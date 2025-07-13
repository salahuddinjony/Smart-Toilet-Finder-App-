// ignore_for_file: deprecated_member_use, avoid_print

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreenController extends GetxController {
  final Rx<LatLng> initialPosition = const LatLng(23.8103, 90.4125).obs;
  late GoogleMapController googleMapController;
  final RxSet<Marker> markers = <Marker>{}.obs;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void moveCamera(LatLng newPosition) {
    googleMapController.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  Future<void> pinCurrentLocation() async {
    try {
      // Check and request location permission
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        Get.snackbar('Error', 'Location services are disabled.');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Error', 'Location permissions are denied.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Error', 'Location permissions are permanently denied.');
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Create LatLng for current position
      LatLng currentLatLng = LatLng(position.latitude, position.longitude);

      // Add marker for current location
      markers.clear(); // Clear existing markers (optional)
      markers.add(
        Marker(
          markerId: const MarkerId('current_location'),
          position: currentLatLng,
          infoWindow: const InfoWindow(title: 'Current Location'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

      // Move camera to current location
      moveCamera(currentLatLng);

      // Update initialPosition
      initialPosition.value = currentLatLng;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location: $e');
      print('Error getting current location: $e');
    }
  }
}
