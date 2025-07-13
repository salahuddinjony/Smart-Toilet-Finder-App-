import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/review/widgets/location_info_widget.dart';
import 'package:mrweekes229/features/guest_flow/become_host/upload_photos/controller/upload_screen_controller.dart';
import 'package:mrweekes229/features/guest_flow/become_host/upload_photos/widgets/upload_photo_card_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/dm_button.dart';
import '../../controller/restroom_controller/restroom_details_controller.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/amenities_grid_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/availability_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/booking_bottom_bar.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/cleaning_info_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/duration_selector_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/host_info_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/image_carousel_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/reviews_section_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/shower_option_widget.dart';

class RestroomDetailsScreen extends StatelessWidget {
  const RestroomDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RestroomDetailsController());
    Get.put(UploadScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Carousel
                  const ImageCarouselWidget(),

                  // Content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title.
                        const Text(
                          'Urban Comfort – Private\nBathroom',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF2D3748),
                            height: 1.2,
                          ),
                        ),

                        const SizedBox(height: 32),
                        DmButton(),
                        const SizedBox(height: 20),

                        // Host Info.
                        const HostInfoWidget(),

                        const SizedBox(height: 20),

                        // Location.
                        LocationInfoWidget(
                          address: 'Central Station, Downtown, New York',
                          onMapTap: controller.openMap,
                        ),

                        const SizedBox(height: 20),

                        // Availability.
                        const AvailabilityWidget(),

                        const SizedBox(height: 30),

                        // Duration Selector.
                        const DurationSelectorWidget(),

                        const SizedBox(height: 25),

                        // Shower Option.
                        const ShowerOptionWidget(),

                        const SizedBox(height: 30),

                        // Amenities.
                        const AmenitiesGridWidget(),

                        const SizedBox(height: 25),

                        // Cleaning Info.
                        const CleaningInfoWidget(),

                        const SizedBox(height: 30),

                        // Reviews.
                        const ReviewsSectionWidget(),

                        const SizedBox(height: 100), // Space for bottom bar.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Bar.
      bottomNavigationBar: const BookingBottomBar(),
    );
  }
}
