import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/become_host/booking/screen/booking.dart';
import 'package:mrweekes229/features/guest_flow/bookings/screen/bookings_screen.dart';
import 'package:mrweekes229/features/guest_flow/bottom_navbar/screen/guest_navbar.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/screen/guest_home_screen.dart';
import 'package:mrweekes229/features/guest_flow/profile/screen/profile_screen.dart';

import '../controller/guest_bottom_navbar_controller.dart';

class GuestBottomNavbarScreen extends StatelessWidget {
  GuestBottomNavbarScreen({super.key});

  final GuestBottomNavbarController controller = Get.put(
    GuestBottomNavbarController(),
  );

  final List<Widget> screens = [
    GuestHomeScreen(),
    BookingsScreen(),
    ProfileScreen(flow: "guest"),
    BookingHost(),
  ];

  final List<String> icons = [
    ImagePath.home,
    ImagePath.guestBooking,
    ImagePath.profile,
    ImagePath.becomeHost,
  ];

  final List<String> labels = ['Home', 'Booking', 'Profile', ' Become Host'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Obx(() => screens[controller.selectedIndex.value])),
        ],
      ),
      bottomNavigationBar: GuestNavbar(),
    );
  }
}
