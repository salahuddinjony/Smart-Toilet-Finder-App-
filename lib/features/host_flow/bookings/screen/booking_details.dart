import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_activity_section.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_details_app_bar.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_financial_details.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_timer_status.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/booking_user_info.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/custom_elevated_buttons.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/custom_outline_button.dart';

class BookingDetails extends StatelessWidget {
  final Booking booking;

  BookingDetails({super.key, required this.booking});
  final AllBookingController controller = Get.find<AllBookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BookingDetailsAppBar(booking: booking),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BookingUserInfo(booking: booking),
            BookingTimerStatus(booking: booking),
            BookingFinancialDetails(booking: booking),
            BookingActivitySection(booking: booking),
            CustomElevatedButtons(
              buttonText: 'Report An Issue',
              onPressed: () {},
            ),
            SizedBox(height: 20),
            CustomOutlineButton(buttonText: 'Contact User', onPressed: () {}),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
