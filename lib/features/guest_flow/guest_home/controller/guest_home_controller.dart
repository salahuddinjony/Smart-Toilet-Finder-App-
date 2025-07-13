// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/restroom_home_screen/restroom_details_screen.dart';

import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/constants/image_path.dart';
import '../model/toilet_model.dart';

class GuestHomeController extends GetxController {
  final Rx<LatLng> initialPosition = const LatLng(23.8103, 90.4125).obs;
  late GoogleMapController googleMapController;
  final RxList<Toilet> recentlyViewedToilets =
      <Toilet>[
        Toilet(
          toiletName: 'Urban Comfort',
          toiletAddress: 'Central Station, Downtown, New York',
          toiletRating: '4.5',
          price: '20',
          imageUrl: ImagePath.restroom1,
        ),
        Toilet(
          toiletName: 'Cozy Retreat',
          toiletAddress: 'Seaside Boulevard, Santa Monica',
          toiletRating: '4.5',
          price: '20',
          imageUrl: ImagePath.restroom2,
        ),
        Toilet(
          toiletName: 'Mountain Escape',
          toiletAddress: 'High Peak Trail, Aspen, Colorado',
          toiletRating: '4.2',
          price: '15',
          imageUrl: ImagePath.restroom3,
        ),
        Toilet(
          toiletName: 'Historic Charm',
          toiletAddress: 'Old Town Square, Savannah, Georgia',
          toiletRating: '4.7',
          price: '25',
          imageUrl: ImagePath.restroom4,
        ),
      ].obs;

  @override
  void onInit() {
    super.onInit();
    _requestLocationPermission();
  }

  void _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isDenied) {
      print('Location permission denied');
    }
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void moveCamera(LatLng newPosition) {
    googleMapController.animateCamera(CameraUpdate.newLatLng(newPosition));
    initialPosition.value = newPosition;
  }

  void navigateToToiletDetails(Toilet toilet) {
    Get.to(RestroomDetailsScreen(key: Key(toilet.toiletName)));
  }
}
