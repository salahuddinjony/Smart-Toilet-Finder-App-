import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/package_hold/controller/package_hold_controller.dart';

Widget customToggleButton() {
  final PackageHoldController controller = Get.put(PackageHoldController());

  return Obx(
    () => GestureDetector(
      onTap: controller.toggle,
      child: Container(
        padding: EdgeInsets.all(3),
        width: 60,
        height: 28,
        decoration: BoxDecoration(
          color: Color(0xFFFFF0F0),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: controller.isToggled.value ? 33 : 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFBA4E4E),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
