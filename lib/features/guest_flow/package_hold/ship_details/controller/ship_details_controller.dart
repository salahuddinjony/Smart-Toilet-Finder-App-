import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/review_and_continue/screen/review_continue_screen.dart';

class ShipDetailsController extends GetxController {
  // Form data
  String selectedSize = 'small';
  String? selectedDate;
  String? startTime;
  String? endTime;
  final TextEditingController noteController = TextEditingController();

  // State
  bool isSubmitting = false;

  // Package size prices
  final Map<String, Map<String, dynamic>> packageSizes = {
    'small': {'price': 5, 'text': 'Small'},
    'medium': {'price': 10, 'text': 'Medium'},
    'large': {'price': 15, 'text': 'Large'},
  };

  // Select package size
  void selectSize(String size) {
    selectedSize = size;
    update();
  }

  // Select date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF00BCD4)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate =
          '${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year.toString().substring(2)}';
      update();
    }
  }

  // Select start time
  Future<void> selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF00BCD4)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      startTime =
          '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      update();
    }
  }

  // Select end time
  Future<void> selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF00BCD4)),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      endTime =
          '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      update();
    }
  }

  // Get total price
  String getTotalPrice() {
    final price = packageSizes[selectedSize]?['price'] ?? 5;
    return '\$$price';
  }

  // Get size text
  String getSizeText() {
    return packageSizes[selectedSize]?['text'] ?? 'Small';
  }

  // Check if request can be submitted
  bool get isRequestEnabled {
    return selectedDate != null &&
        startTime != null &&
        endTime != null &&
        !isSubmitting;
  }

  // Submit request
  Future<void> submitRequest() async {
    if (!isRequestEnabled) return;

    isSubmitting = true;
    update();

    try {
      // Navigate back or to confirmation screen
      await Future.delayed(const Duration(seconds: 1));
      Get.to(PackageReviewContinueScreen(bookingData: getRequestSummary()));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to submit request. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isSubmitting = false;
      update();
    }
  }

  // Get request summary
  Map<String, dynamic> getRequestSummary() {
    return {
      'package_size': selectedSize,
      'price': packageSizes[selectedSize]?['price'],
      'date': selectedDate,
      'start_time': startTime,
      'end_time': endTime,
      'note': noteController.text,
      'location': 'Central Station, Downtown, New York',
    };
  }

  // Reset form
  void resetForm() {
    selectedSize = 'small';
    selectedDate = null;
    startTime = null;
    endTime = null;
    noteController.clear();
    isSubmitting = false;
    update();
  }

  @override
  void onClose() {
    noteController.dispose();
    super.onClose();
  }
}
