import 'package:flutter/material.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';

class BookingDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Booking booking;
  const BookingDetailsAppBar({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF9F9F9),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Urban Comfort',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                booking.status,
                style: const TextStyle(color: Colors.teal, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
