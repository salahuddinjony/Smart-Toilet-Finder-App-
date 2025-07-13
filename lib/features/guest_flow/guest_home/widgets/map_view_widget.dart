import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/controller/guest_home_controller.dart';
import 'package:mrweekes229/features/guest_flow/map_home/screen/map_home_screen.dart';

class MapViewWidget extends StatelessWidget {
  const MapViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GuestHomeController());

    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;
    final double fabSize = isSmallScreen ? 48 : 56;
    final double fabIconSize = isSmallScreen ? 20 : 28;
    final double fabPadding = isSmallScreen ? 12 : 24;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Obx(() {
          final GuestHomeController controller =
              Get.find<GuestHomeController>();
          return Stack(
            children: [
              Positioned.fill(
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

              Positioned(
                left: fabPadding,
                bottom: fabPadding,
                child: SizedBox(
                  width: fabSize,
                  height: fabSize,
                  child: FloatingActionButton(
                    onPressed: () {
                      Get.to(MapHomeScreen());
                    },
                    backgroundColor: Colors.white,
                    elevation: 4.0,
                    child: Image.asset(
                      IconPath.mapExtendsIcon,
                      width: fabIconSize,
                      height: fabIconSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
      },
    );
  }
}
