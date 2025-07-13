import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import '../../guest_home/model/toilet_model.dart';
import '../widget/bottom_sheet_widget.dart';

class MapHomeController extends GetxController {
  final Rx<LatLng> initialPosition = const LatLng(23.8103, 90.4125).obs;
  late GoogleMapController googleMapController;
  final RxString selectedToiletName = ''.obs;
  final RxString selectedToiletAddress = ''.obs;
  final RxString selectedToiletRating = ''.obs;
  final RxString selectedToiletPrice = ''.obs;
  final selectedToiletImage = ''.obs;
  final RxBool isDirectionEnabled = false.obs;
  final RxList<Toilet> recentlyViewedToilets =
      <Toilet>[
        Toilet(
          toiletName: 'Bathroom A',
          toiletAddress: 'Dhaka Central',
          toiletRating: '4.5',
          price: '20',
          imageUrl: ImagePath.restroom,
        ),
        Toilet(
          toiletName: 'Bathroom A',
          toiletAddress: 'Dhaka Central',
          toiletRating: '4.5',
          price: '20',
          imageUrl: ImagePath.restroom1,
        ),
        Toilet(
          toiletName: 'Bathroom B',
          toiletAddress: 'Dhaka North',
          toiletRating: '4.2',
          price: '15',
          imageUrl: ImagePath.restroom2,
        ),
        Toilet(
          toiletName: 'Bathroom C',
          toiletAddress: 'Dhaka South',
          toiletRating: '4.7',
          price: '25',
          imageUrl: ImagePath.restroom3,
        ),
      ].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      if (Get.context != null) {
        showBottomSheet();
      }
    });
  }

  @override
  void onClose() {
    googleMapController.dispose();
    isDirectionEnabled.value = false;
    super.onClose();
  }

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  void moveCamera(LatLng newPosition) {
    googleMapController.animateCamera(CameraUpdate.newLatLng(newPosition));
  }

  void showBottomSheet() {
    Get.bottomSheet(
      BottomSheetWidget(controller: this),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    );
  }

  void showToiletCard(Toilet toilet) {
    selectedToiletName.value = toilet.toiletName;
    selectedToiletAddress.value = toilet.toiletAddress;
    selectedToiletRating.value = toilet.toiletRating;
    selectedToiletPrice.value = toilet.price;
    selectedToiletImage.value = toilet.imageUrl ?? '';
    isDirectionEnabled.value = true;
  }
}
