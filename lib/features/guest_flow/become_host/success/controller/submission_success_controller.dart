// ignore_for_file: avoid_print

import 'package:get/get.dart';

import 'package:mrweekes229/features/host_flow/bottom_navbar/controller/bottom_navbar_controller.dart';

import 'package:mrweekes229/features/host_flow/bottom_navbar/screen/bottom_navbar_screen.dart';

class SubmissionSuccessController extends GetxController {
  bool isNavigating = false;

  @override
  void onInit() {
    super.onInit();
    _showSuccessAnimation();
  }

  // Show success animation on screen load
  void _showSuccessAnimation() {
    // You can add custom animations here
  }

  // Navigate to dashboard
  Future<void> goToDashboard() async {
    if (isNavigating) return;

    isNavigating = true;
    update();

    try {
      Get.put(BottomNavbarController());
      Get.offAll(() => BottomNavbarScreen());
    } catch (e) {
      print('error $e');
    } finally {
      isNavigating = false;
      update();
    }
  }

  // Get submission details
  Map<String, dynamic> getSubmissionDetails() {
    return {
      'submitted_at': DateTime.now().toIso8601String(),
      'status': 'under_review',
      'estimated_review_time': '24-48 hours',
      'notification_enabled': true,
    };
  }
}
