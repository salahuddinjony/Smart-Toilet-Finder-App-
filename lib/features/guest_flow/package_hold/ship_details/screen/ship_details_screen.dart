import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../guest_home/model/toilet_model.dart';
import '../controller/ship_details_controller.dart';
import '../widgets/availability_card.dart';
import '../widgets/bathroom_image_carousel.dart';
import '../widgets/date_time_selector.dart';
import '../widgets/location_info_card.dart';
import '../widgets/note_input_field.dart';
import '../widgets/package_size_selector.dart';
import '../widgets/request_button.dart';

class ShipDetailsScreen extends StatelessWidget {
  final Toilet? toilet;
  const ShipDetailsScreen({super.key, this.toilet});

  @override
  Widget build(BuildContext context) {
    final ShipDetailsController controller = Get.put(ShipDetailsController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // Image Carousel Section
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                // Bathroom Images Carousel
                const BathroomImageCarousel(),

                // Back Button
                Positioned(
                  top: 60,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Location Info
                  const LocationInfoCard(),

                  const SizedBox(height: 20),

                  // Reminder Message
                  _buildReminderCard(),

                  const SizedBox(height: 20),

                  // Availability
                  const AvailabilityCard(),

                  const SizedBox(height: 30),

                  // Package Size Selector
                  PackageSizeSelector(controller: controller),

                  const SizedBox(height: 30),

                  // Date Time Selector
                  DateTimeSelector(controller: controller),

                  const SizedBox(height: 30),

                  // Note Input
                  NoteInputField(controller: controller),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom Request Section
          RequestButton(controller: controller),
        ],
      ),
    );
  }

  Widget _buildReminderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Reminder: Update delivery address with your carrier to ensure safe delivery.',
        style: TextStyle(
          fontSize: 14,
          color: const Color(0xFFE57373),
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
