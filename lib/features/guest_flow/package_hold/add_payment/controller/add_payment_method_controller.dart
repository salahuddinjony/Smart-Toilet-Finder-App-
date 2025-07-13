import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/package_session/screen/package_session_screen.dart';

class AddPaymentMethodController extends GetxController {
  var selectedMethod = ''.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  void continueToNextStep() {
    if (selectedMethod.value.isNotEmpty) {
      // Navigate to next screen or process payment
      Get.snackbar(
        'Success',
        'Payment method ${selectedMethod.value} selected!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0xFF4CAF50),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );

      // Here you can navigate to the next screen
      Get.to(() => PackageSessionScreen());
    }
  }
}
