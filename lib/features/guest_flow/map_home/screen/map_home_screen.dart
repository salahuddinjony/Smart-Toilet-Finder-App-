import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/widgets/toilet_list_card.dart';
import 'package:mrweekes229/features/guest_flow/map_home/widget/custom_app_bar.dart';
import '../controller/map_home_controller.dart';

class MapHomeScreen extends StatelessWidget {
  final MapHomeController controller = Get.put(MapHomeController());
  MapHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (Get.isBottomSheetOpen == false) {
        controller.showBottomSheet();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              child: GoogleMap(
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: controller.initialPosition.value,
                  zoom: 12.0,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
              ),
            ),
          ),

          Positioned(top: 30, left: 0, right: 0, child: CustomAppBar()),

          Obx(() {
            return controller.isDirectionEnabled.value
                ? Positioned(
                  top: 650,
                  left: 20,
                  right: 20,
                  bottom: 40,
                  child: ToiletListCard(
                    toiletName: controller.selectedToiletName.value,
                    imageUrl: controller.selectedToiletImage.value,
                    toiletAddress: controller.selectedToiletAddress.value,
                    toiletRating: controller.selectedToiletRating.value,
                    price: controller.selectedToiletPrice.value,
                    isDirectionEnabled: true,
                    isSmallScreen: false,
                  ),
                )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}
