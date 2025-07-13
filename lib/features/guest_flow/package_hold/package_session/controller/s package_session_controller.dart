// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mrweekes229/features/guest_flow/bottom_navbar/screen/guest_bottom_navbar_screen.dart';

class PackageSessionController extends GetxController {
  // Timer properties
  var timeRemaining = '00:00'.obs;
  var progress = 0.0.obs;

  Timer? _timer;
  int totalSeconds = 0;
  int remainingSeconds = 0;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    // Set initial time (3 hours = 10800 seconds)
    totalSeconds = 10800;
    remainingSeconds = totalSeconds;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        updateTimeDisplay();
        updateProgress();
      } else {
        timer.cancel();
        onTimerComplete();
      }
    });
  }

  void updateTimeDisplay() {
    int hours = remainingSeconds ~/ 3600;
    int minutes = (remainingSeconds % 3600) ~/ 60;
    timeRemaining.value =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  void updateProgress() {
    progress.value = (totalSeconds - remainingSeconds) / totalSeconds;
  }

  void onTimerComplete() {}

  void markAsCollected() {
    Get.dialog(
      AlertDialog(
        title: const Text('Confirm Collection'),
        content: const Text(
          'Are you sure you want to mark this package as collected?',
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();

              Get.to(GuestBottomNavbarScreen());
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  void reportToAdmin() {
    Get.dialog(
      AlertDialog(
        title: const Text('Report Issue'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Please describe the issue:'),
            const SizedBox(height: 12),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your issue description...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
