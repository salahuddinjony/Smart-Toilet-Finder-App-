import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_list/screen/packages_holding_screen.dart';
import 'package:mrweekes229/features/host_flow/package_hold/screen/package_holding_dashboard.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/guest_profile_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/package_info_details.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/request_details_widget.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(PackagesHoldingScreen());
                    },
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
              GuestProfileWidget(),
              SizedBox(height: 20),
              PackageInfoDetails(),
              SizedBox(height: 20),
              RequestDetailsWidget(),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Color(0xFFBA4E4E)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(PackageHoldingDashboard());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/incorrect.png',
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Reject',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xFFBA4E4E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 17),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(PackageHoldingDashboard());
                      },
                      child: Container(
                        height: 50,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFBA4E4E),
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
                              'Accept',
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
