import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/colors.dart';
import '../controller/upload_screen_controller.dart';

Widget buildNavigationButtons() {
  final controller = Get.find<UploadScreenController>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Back Button
      GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.buttonColor, width: 1.5),
          ),
          child: Center(
            child: Text(
              'Back',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonColor,
              ),
            ),
          ),
        ),
      ),

      const SizedBox(width: 50),

      // Next Button
      GestureDetector(
        onTap: controller.goToNextStep,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
