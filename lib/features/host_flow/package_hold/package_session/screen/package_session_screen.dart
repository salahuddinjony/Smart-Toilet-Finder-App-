import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/controller/package_session_controller.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/widgets/%20action_buttons_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/widgets/progress_bar.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/widgets/upload_delivery_photo_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/widgets/package_info_card.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_session/widgets/time_slot_widget.dart';

// ignore: must_be_immutable
class PackageSessionScreen extends StatelessWidget {
  PackageSessionController controller = Get.put(PackageSessionController());
  PackageSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.only(top: 60, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: Color(0xFFECECEC),
                      ),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Package Request\nDetails',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.2,
                      color: Color(0xFF404040),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),
              const PackageInfoCard(),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC4C4C4),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '04/06/2025',
                        style: TextStyle(
                          color: Color(0xFF404040),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(child: const ProgressContainer()),

                    const SizedBox(height: 20),

                    const TimeSlotWidget(),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.local_shipping,
                            color: Color(0xFF4CAF50),
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Confirm Delivery',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    UploadDeliveryPhotoWidget(),
                    SizedBox(height: 18),
                    GestureDetector(
                      onTap: () {
                        Get.to(BottomNavbarScreen());
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFF11B32A),

                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/correct.png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Confirm Package Received ',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const ActionButtonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
