// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/become_host/success/screen/submission_success_screen.dart';

class SubmitReviewController extends GetxController {
  bool isSubmitting = false;

  Map<String, dynamic> restroomData = {
    'title': 'Urban Comfort - Private Bathroom',
    'description': 'Lorem ipsum...',
    'host_name': 'Alex Tran',
    'host_image':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
    'availability': 'Everyday : 6am to 6pm',
    'address': 'Central Station, Downtown, New York',
    'photos': [
      'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
      'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=400&h=300&fit=crop',
    ],
    'amenities': [
      {
        'name': 'Toilet paper',
        'icon': Icons.receipt_long,
        'color': Color(0xFF00BCD4),
      },
      {'name': 'Hand Wash', 'icon': Icons.soap, 'color': Color(0xFF2196F3)},
      {'name': 'Mirror', 'icon': Icons.girl_sharp, 'color': Color(0xFF00BCD4)},
      {'name': 'Shower', 'icon': Icons.shower, 'color': Color(0xFF4CAF50)},
      {
        'name': 'Accessible',
        'icon': Icons.accessible,
        'color': Color(0xFF9C27B0),
      },
      {'name': 'Lockable', 'icon': Icons.lock, 'color': Color(0xFFFF9800)},
    ],
    'pricing_slots': [
      {'time': '15 Minutes', 'price': '\$2.5'},
      {'time': '30 Minutes', 'price': '\$5.0'},
      {'time': '1 Hour', 'price': '\$10.0'},
    ],
    'late_fee_enabled': true,
    'late_fee_amount': '\$0.50',
  };

  Future<void> submitForReview() async {
    if (isSubmitting) return;

    isSubmitting = true;
    update();

    try {
      await Future.delayed(const Duration(seconds: 2));

      Get.to(SubmissionSuccessScreen());
    } catch (e) {
      print('error $e');
    } finally {
      isSubmitting = false;
      update();
    }
  }

  void openMap() {
    _showLazyLoadingSnackbar("Opening map for ${restroomData['address']}");
    Future.delayed(const Duration(seconds: 1), () {
      Get.closeCurrentSnackbar();
    });
  }

  String getSubmissionSummary() {
    return '''
Bathroom: ${restroomData['title']}
Host: ${restroomData['host_name']}
Location: ${restroomData['address']}
Amenities: ${restroomData['amenities']?.length ?? 0} items
Pricing: ${restroomData['pricing_slots']?.length ?? 0} slots
''';
  }

  bool validateSubmissionData() {
    if (restroomData['title']?.isEmpty ?? true) {
      _showLazyErrorSnackbar("Bathroom title is required");
      return false;
    }
    if (restroomData['address']?.isEmpty ?? true) {
      _showLazyErrorSnackbar("Address is required");
      return false;
    }
    if (restroomData['pricing_slots']?.isEmpty ?? true) {
      _showLazyErrorSnackbar("At least one pricing slot is required");
      return false;
    }
    return true;
  }

  void updateRestroomData(Map<String, dynamic> newData) {
    restroomData.addAll(newData);
    update();
  }

  String getFormattedPricing() {
    final slots = restroomData['pricing_slots'] as List<Map<String, String>>?;
    if (slots == null || slots.isEmpty) return 'No pricing set';
    return slots.map((slot) => '${slot['time']}: ${slot['price']}').join(', ');
  }

  int getAmenitiesCount() {
    final amenities = restroomData['amenities'] as List?;
    return amenities?.length ?? 0;
  }

  // 🔹 Lazy Snackbar Helpers 🔹

  void _showLazyLoadingSnackbar(String message) {
    Get.rawSnackbar(
      messageText: Row(
        children: [
          const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: Colors.blueAccent,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(days: 1), // stays until closed
    );
  }

  void _showLazyErrorSnackbar(String message) {
    Get.rawSnackbar(
      messageText: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
    );
  }
}
