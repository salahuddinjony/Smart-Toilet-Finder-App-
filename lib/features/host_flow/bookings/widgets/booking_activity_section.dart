import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';

class BookingActivitySection extends StatelessWidget {
  final Booking booking;

  const BookingActivitySection({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: AppColors.info,
            ),
          ),
          const SizedBox(height: 12.0),

          if (booking.activity != null)
            ...booking.activity!.map(
              (activityItem) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Icon(
                      color: AppColors.info,
                      activityItem.contains('Session Starts')
                          ? Icons.access_time
                          : Icons.payment,
                      size: 20,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      activityItem.contains('Session Starts')
                          ? "$activityItem ${booking.startTime}"
                          : "$activityItem ${booking.price}",
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
