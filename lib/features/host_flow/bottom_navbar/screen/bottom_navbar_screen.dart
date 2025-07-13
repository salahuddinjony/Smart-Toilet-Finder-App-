import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/profile/screen/profile_screen.dart';
import 'package:mrweekes229/features/host_flow/bookings/screen/all_bookings.dart';
import 'package:mrweekes229/features/host_flow/bottom_navbar/controller/bottom_navbar_controller.dart';
import 'package:mrweekes229/features/host_flow/bottom_navbar/screen/navbar.dart';
import 'package:mrweekes229/features/host_flow/home_host/screen/home_host.dart';
import 'package:mrweekes229/features/host_flow/toilets/screen/my_bathroom_screen.dart';
import 'package:mrweekes229/features/host_flow/earnings/screen/earnings_screen.dart';

class BottomNavbarScreen extends StatelessWidget {
  BottomNavbarScreen({super.key});

  final BottomNavbarController controller = Get.find<BottomNavbarController>();

  final List<Widget> screens = [
    HomeHost(),
    MyBathroomScreen(),
    AllBookings(),
    EarningsScreen(),
    ProfileScreen(flow: "host"),
  ];

  final List<String> icons = [
    ImagePath.home,
    ImagePath.toilests,
    ImagePath.booking,
    ImagePath.earnings,
    ImagePath.profile,
  ];

  final List<String> labels = [
    'Home',
    'Bathrooms',
    'Bookings',
    'Earnings',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: Navbar(
        controller: controller,
        icons: icons,
        labels: labels,
      ),
    );
  }
}
