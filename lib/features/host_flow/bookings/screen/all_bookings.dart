// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';
import 'package:mrweekes229/features/host_flow/bookings/screen/booking_details.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_card.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/search_bar.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/title_text.dart';

class AllBookings extends StatelessWidget {
  AllBookings({super.key});
  final controller = Get.put(AllBookingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffF9F9F9),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TitleText(),
              const SizedBox(height: 16),
              SearchBarW(
                controller: controller.searchController,
                onFilterPressed: () => print('Filter button pressed'),
              ),
              const SizedBox(height: 16),
              Obx(
                () => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.bookings.length,
                    itemBuilder:
                        (context, index) => GestureDetector(
                          onTap: () {
                            Get.to(
                              () => BookingDetails(
                                booking: controller.bookings[index],
                              ),
                            );
                          },
                          child: BookingCard(
                            booking: controller.bookings[index],
                          ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
