import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/add_payment/screen/add_payment_method_screen.dart';

class PackageReviewContinueController extends GetxController {
  // Booking data
  Map<String, dynamic> bookingData = {};

  // State
  bool isProcessing = false;

  // Set booking data
  void setBookingData(Map<String, dynamic> data) {
    bookingData = data;
    update();
  }

  // Get formatted price
  String getFormattedPrice() {
    final price = bookingData['price'] ?? 5;
    return '\$${price.toString().padLeft(2, '0')}';
  }

  // Get formatted time
  String getFormattedTime() {
    final startTime = bookingData['start_time'] ?? '15:00';
    final endTime = bookingData['end_time'] ?? '18:00';

    // Convert 24h to 12h format
    final start = _convertTo12Hour(startTime);
    final end = _convertTo12Hour(endTime);

    return '$start - $end';
  }

  // Get formatted date
  String getFormattedDate() {
    final date = bookingData['date'] ?? '06/04/2025';
    return date;
  }

  // Convert 24h to 12h format
  String _convertTo12Hour(String time24) {
    final parts = time24.split(':');
    int hour = int.parse(parts[0]);
    final minute = parts[1];

    if (hour == 0) {
      return '12:${minute}AM';
    } else if (hour < 12) {
      return '$hour:${minute}AM';
    } else if (hour == 12) {
      return '12:${minute}PM';
    } else {
      return '${hour - 12}:${minute}PM';
    }
  }

  // Process payment
  Future<void> processPayment() async {
    if (isProcessing) return;

    isProcessing = true;
    update();

    try {
      // Simulate payment processing
      await Future.delayed(const Duration(seconds: 3));

      Get.to(AddPaymentMethodScreen());
    } catch (e) {
      Get.snackbar(
        'Payment Failed',
        'Unable to process payment. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isProcessing = false;
      update();
    }
  }

  // Get booking summary
  String getBookingSummary() {
    return '''
Package: ${bookingData['package_size'] ?? 'Small'}
Price: ${getFormattedPrice()}
Time: ${getFormattedTime()}
Date: ${getFormattedDate()}
Location: Central Station, Downtown, New York
''';
  }

  // Get total cost breakdown
  Map<String, dynamic> getCostBreakdown() {
    final basePrice = bookingData['price'] ?? 5;
    final serviceFee = (basePrice * 0.1).round(); // 10% service fee
    final total = basePrice + serviceFee;

    return {'base_price': basePrice, 'service_fee': serviceFee, 'total': total};
  }

  // Validate booking data
  bool validateBookingData() {
    return bookingData.isNotEmpty &&
        bookingData['package_size'] != null &&
        bookingData['price'] != null &&
        bookingData['date'] != null &&
        bookingData['start_time'] != null &&
        bookingData['end_time'] != null;
  }
}
