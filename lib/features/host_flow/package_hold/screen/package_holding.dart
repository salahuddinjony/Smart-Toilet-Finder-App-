import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_large_button.dart';
import 'package:mrweekes229/features/host_flow/package_hold/screen/package_holding_dashboard.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/custom_toggle_button.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/notice_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/package_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/pricing_widget.dart';

class PackageHolding extends StatelessWidget {
  const PackageHolding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 65, left: 16, right: 16, bottom: 30),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
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
                    'Package Holding',
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
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Color(0xFFECECEC)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enable Package Holding',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            height: 1.3,
                            color: Color(0xFF404040),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Allow customers to hold packages',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF7F7F7F),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    customToggleButton(),
                  ],
                ),
              ),
              SizedBox(height: 34),
              PricingWidget(),
              SizedBox(height: 20),
              PackageWidget(),
              SizedBox(height: 34),
              NoticeWidget(),
              SizedBox(height: 48),
              CustomLargeButton(
                onPressed: () {
                  Get.to(PackageHoldingDashboard());
                },
                text: 'Save Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
