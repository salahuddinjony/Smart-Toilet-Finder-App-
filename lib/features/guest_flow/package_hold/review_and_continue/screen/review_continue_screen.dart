import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/review_continue_controller.dart';
import '../widgets/bathroom_info_card.dart';
import '../widgets/booking_summary_card.dart';
import '../widgets/location_summary_card.dart';
import '../widgets/pay_confirm_button.dart';

class PackageReviewContinueScreen extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  const PackageReviewContinueScreen({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final PackageReviewContinueController controller = Get.put(
      PackageReviewContinueController(),
    );
    controller.setBookingData(bookingData);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            _buildHeader(),

            const SizedBox(height: 40),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    BathroomInfoCard(
                      title: 'Urban Comfort – Private Bathroom',
                      rating: 4.5,
                      reviewCount: 344,
                      imageUrl:
                          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
                    ),

                    const SizedBox(height: 30),

                    BookingSummaryCard(controller: controller),

                    const SizedBox(height: 30),

                    const LocationSummaryCard(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            PayConfirmButton(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Spacer(),

          const Text(
            'Review & Continue',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF404040),
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.black, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
