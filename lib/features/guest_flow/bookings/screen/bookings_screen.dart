import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/booking_container.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/booking_list_widget.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> previousBookings = [
      {
        'imagePath': 'assets/images/restroom.png',
        'title': 'Urban Comfort',
        'address': 'Central Station, Downtown, New York',
        'rating': '4.5',
      },
      {
        'imagePath': 'assets/images/restroom1.png',
        'title': 'Cozy Retreat',
        'address': 'Sunset Boulevard, Los Angeles, California',
        'rating': '4.7',
      },
      {
        'imagePath': 'assets/images/restroom2.png',
        'title': 'Seaside Paradise',
        'address': 'Ocean Drive, Miami, Florida',
        'rating': '4.8',
      },
      {
        'imagePath': 'assets/images/restroom3.png',
        'title': 'Mountain Escape',
        'address': 'Alpine Road, Aspen, Colorado',
        'rating': '4.6',
      },
      {
        'imagePath': 'assets/images/restroom4.png',
        'title': 'Countryside Haven',
        'address': 'Green Valley, Napa, California',
        'rating': '4.9',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 24),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Current Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    height: 1.2,
                    color: Color(0xFF404040),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 32),
              BookingContainer(),
              SizedBox(height: 32),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Previous Booking',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    height: 1.2,
                    color: Color(0xFF404040),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: previousBookings.length,
                itemBuilder: (context, index) {
                  final booking = previousBookings[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: BookingListWidget(
                      imagePath: booking['imagePath']!,
                      title: booking['title']!,
                      address: booking['address']!,
                      rating: booking['rating']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
