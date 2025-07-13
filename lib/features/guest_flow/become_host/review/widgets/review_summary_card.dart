import 'package:flutter/material.dart';
import '../controller/submit_review_controller.dart';
import 'restroom_title_widget.dart';
import 'description_widget.dart';
import 'host_info_widget.dart';
import 'availability_info_widget.dart';
import 'location_info_widget.dart';
import 'photos_gallery_widget.dart';
import 'amenities_grid_widget.dart';
import 'pricing_list_widget.dart';
import 'late_fee_indicator_widget.dart';

class ReviewSummaryCard extends StatelessWidget {
  final SubmitReviewController controller;

  const ReviewSummaryCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bathroom Title
            RestroomTitleWidget(
              title:
                  controller.restroomData['title'] ??
                  'Urban Comfort - Private Bathroom',
            ),

            const SizedBox(height: 20),

            // Description
            DescriptionWidget(
              description:
                  controller.restroomData['description'] ??
                  'Lorem ipsum dolor sit amet consectetur. Leo eget amet odio nibh viverra viverra. Nibh faucibus at sed tristique vitae. Et fames nisl sit condimentum. Id eros ac magna morbi risus adipiscing urna vel quam.',
            ),

            const SizedBox(height: 24),

            // Host Information
            HostInfoWidget(
              hostName: controller.restroomData['host_name'] ?? 'Alex Tran',
              hostImage: controller.restroomData['host_image'],
            ),

            const SizedBox(height: 20),

            // Availability
            AvailabilityInfoWidget(
              availability:
                  controller.restroomData['availability'] ??
                  'Everyday : 6am to 6pm',
            ),

            const SizedBox(height: 20),

            // Location
            LocationInfoWidget(
              address:
                  controller.restroomData['address'] ??
                  'Central Station, Downtown, New York',
              onMapTap: () => controller.openMap(),
            ),

            const SizedBox(height: 24),

            // Photos Gallery
            PhotosGalleryWidget(
              photos: controller.restroomData['photos'] ?? [],
            ),

            const SizedBox(height: 24),

            // Amenities
            AmenitiesGridWidget(
              amenities: controller.restroomData['amenities'] ?? [],
            ),

            const SizedBox(height: 24),

            // Pricing
            PricingListWidget(
              pricingSlots: controller.restroomData['pricing_slots'] ?? [],
            ),

            const SizedBox(height: 16),

            // Late Fee Indicator
            if (controller.restroomData['late_fee_enabled'] == true)
              const LateFeeIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}
