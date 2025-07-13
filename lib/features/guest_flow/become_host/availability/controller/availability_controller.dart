// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/pricing/screen/pricing_screen.dart';

class AvailabilityController extends GetxController {
  // Observable variables
  RxList<String> selectedDays = <String>[].obs;
  RxString startTime = '8:00 am'.obs;
  RxString endTime = '8:00 pm'.obs;

  // Available days
  final List<String> allDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  // Available time slots
  final List<String> timeSlots = [
    '6:00 am',
    '6:30 am',
    '7:00 am',
    '7:30 am',
    '8:00 am',
    '8:30 am',
    '9:00 am',
    '9:30 am',
    '10:00 am',
    '10:30 am',
    '11:00 am',
    '11:30 am',
    '12:00 pm',
    '12:30 pm',
    '1:00 pm',
    '1:30 pm',
    '2:00 pm',
    '2:30 pm',
    '3:00 pm',
    '3:30 pm',
    '4:00 pm',
    '4:30 pm',
    '5:00 pm',
    '5:30 pm',
    '6:00 pm',
    '6:30 pm',
    '7:00 pm',
    '7:30 pm',
    '8:00 pm',
    '8:30 pm',
    '9:00 pm',
    '9:30 pm',
    '10:00 pm',
    '10:30 pm',
    '11:00 pm',
    '11:30 pm',
  ];

  // Select a single day (deselect others)
  void toggleDay(String day) {
    print('Toggling $day, current: $selectedDays');
    if (selectedDays.contains(day)) {
      selectedDays.remove(day); // Deselect the day if already selected
    } else {
      selectedDays.add(day); // Select the day if not selected
    }
  }

  // Set start time
  void setStartTime(String time) {
    startTime.value = time;
    if (_getTimeIndex(endTime.value) <= _getTimeIndex(time)) {
      int nextIndex = _getTimeIndex(time) + 1;
      if (nextIndex < timeSlots.length) {
        endTime.value = timeSlots[nextIndex];
      }
    }
  }

  // Set end time
  void setEndTime(String time) {
    if (_getTimeIndex(time) > _getTimeIndex(startTime.value)) {
      endTime.value = time;
    } else {
      Get.snackbar(
        'Invalid Time',
        'End time must be after start time',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  // Get time index for comparison
  int _getTimeIndex(String time) {
    return timeSlots.indexOf(time);
  }

  // Validation
  bool get canProceed {
    return _getTimeIndex(endTime.value) > _getTimeIndex(startTime.value);
  }

  bool validateAvailability() {
    if (_getTimeIndex(endTime.value) <= _getTimeIndex(startTime.value)) {
      Get.snackbar(
        'Invalid Time Range',
        'End time must be after start time',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return false;
    }
    return true; // Allow any number of selected days
  }

  // Get availability summary
  String getAvailabilitySummary() {
    String daysText = selectedDays.isEmpty ? 'None' : selectedDays.first;
    return 'Available: $daysText from ${startTime.value} to ${endTime.value}';
  }

  // Get selected days count
  int get selectedDaysCount => selectedDays.length;

  // Check if specific day is selected
  bool isDaySelected(String day) => selectedDays.contains(day);

  // Get time duration in hours
  double get timeDurationInHours {
    int startIndex = _getTimeIndex(startTime.value);
    int endIndex = _getTimeIndex(endTime.value);
    return (endIndex - startIndex) * 0.5; // Each slot is 30 minutes
  }

  // Reset to defaults
  void resetAvailability() {
    selectedDays.clear();
    startTime.value = '8:00 am';
    endTime.value = '8:00 pm';
  }

  // Save availability (for API call)
  Map<String, dynamic> getAvailabilityData() {
    return {
      'available_days': selectedDays.toList(),
      'start_time': startTime.value,
      'end_time': endTime.value,
      'duration_hours': timeDurationInHours,
    };
  }

  void goToNextStep() {
    if (validateAvailability()) {
      Get.snackbar(
        'Availability Set',
        getAvailabilitySummary(),
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Navigate to next screen
      Get.to(() => PricingScreen());
    }
  }
}
