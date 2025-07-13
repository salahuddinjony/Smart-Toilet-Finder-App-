import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/screen/guest_home_screen.dart';
import 'package:mrweekes229/features/guest_flow/inbox/screen/chat_inbox_screen.dart';
import 'package:mrweekes229/features/guest_flow/profile/screen/payment_method_screen.dart';
import 'package:mrweekes229/features/host_flow/package_hold/screen/package_holding_dashboard.dart';
import 'package:mrweekes229/features/host_flow/toilets/screen/my_bathroom_screen.dart';

Widget buildSectionTitle(String title) {
  return GestureDetector(
    onTap: () {
      // Navigate based on the title
      switch (title) {
        case 'Payment Method':
          Get.to(PaymentMethodScreen());
          break;
        case 'Bathroom Dashboard':
          Get.to(MyBathroomScreen());
          break;
        case 'Package Dashboard':
          Get.to(PackageHoldingDashboard());
          break;
        case 'Inbox':
          Get.to(ChatInboxScreen());
          break;
        case 'Switch Account':
          Get.to(GuestHomeScreen());
          break;
        default:
          Get.snackbar('Error', 'No route defined for $title');
      }
    },
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
