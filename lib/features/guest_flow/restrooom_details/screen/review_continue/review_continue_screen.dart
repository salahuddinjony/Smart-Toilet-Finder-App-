import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_large_button.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/become_host/upload_photos/widgets/upload_photo_card_widget.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/review_continue/bill_details.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/payment_method_screen/add_payment_method_screen.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/review_continue/end_text.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/review_continue/location_widget.dart';

class ReviewContinueScreen extends StatelessWidget {
  const ReviewContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 56,
            left: 16,
            right: 16,
            bottom: 35,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Review & Continue',
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF404040),
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          ImagePath.restroom,
                          height: 70,
                          width: 70,
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Urban Comfort – Private\nBathroom',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              height: 1.2,
                              color: Color(0xFF404040),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Image.asset(
                                IconPath.ratings,
                                height: 16,
                                width: 16,
                              ),

                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(
                                    color: Color(0xFF404040),
                                    height: 1.5,
                                    fontSize: 12.0,
                                  ),
                                  children: [
                                    TextSpan(text: '4.5'),
                                    TextSpan(
                                      text: ' (344)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        height: 1.5,
                                        color: Color(0xFF7F7F7F),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              BillDetails(),
              SizedBox(height: 24),
              LocationInfoWidget(
                address: 'Central Station, Downtown, New York',
                onMapTap: () {
                  controller.openMap();
                },
              ),
              SizedBox(height: 24),
              EndText(),
              SizedBox(height: 40),
              CustomLargeButton(
                onPressed: () {
                  Get.to(() => AddPaymentMethodPage());
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
