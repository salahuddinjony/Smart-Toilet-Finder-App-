import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../guest_home/model/toilet_model.dart';

class ShipToHostController extends GetxController {
  final Rx<LatLng> initialPosition = const LatLng(23.8103, 90.4125).obs;
  late GoogleMapController googleMapController;
  final RxString selectedToiletName = ''.obs;
  final RxString selectedToiletAddress = ''.obs;
  final RxString selectedToiletRating = ''.obs;
  final RxString selectedToiletPrice = ''.obs;
  final selectedToiletImage = ''.obs;
  final RxList<Toilet> recentlyViewedToilets =
      <Toilet>[
        Toilet(
          toiletName: 'Bathroom A',
          toiletAddress: 'Dhaka Central',
          toiletRating: '4.5',
          price: '20',
          imageUrl: 'https://example.com/toilet_a.jpg',
        ),
        Toilet(
          toiletName: 'Bathroom A',
          toiletAddress: 'Dhaka Central',
          toiletRating: '4.5',
          price: '20',
          imageUrl: 'https://example.com/toilet_a.jpg',
        ),
        Toilet(
          toiletName: 'Bathroom B',
          toiletAddress: 'Dhaka North',
          toiletRating: '4.2',
          price: '15',
          imageUrl: null,
        ),
        Toilet(
          toiletName: 'Bathroom C',
          toiletAddress: 'Dhaka South',
          toiletRating: '4.7',
          price: '25',
          imageUrl: 'https://example.com/toilet_c.jpg',
        ),
      ].obs;

  @override
  void onClose() {
    googleMapController.dispose();
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void moveCamera(LatLng newPosition) {
    googleMapController.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  void showToiletCard(Toilet toilet) {
    selectedToiletName.value = toilet.toiletName;
    selectedToiletAddress.value = toilet.toiletAddress;
    selectedToiletRating.value = toilet.toiletRating;
    selectedToiletPrice.value = toilet.price;
    selectedToiletImage.value = toilet.imageUrl ?? '';
  }
}
