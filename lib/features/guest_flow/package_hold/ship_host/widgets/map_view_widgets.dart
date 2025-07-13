import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/ship_host/controller/ship_to_host_controller.dart';

Widget mapViewWidget() {
  ShipToHostController controller = Get.put(ShipToHostController());
  return Container(
    height: 270,
    width: double.infinity,
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
  );
}
