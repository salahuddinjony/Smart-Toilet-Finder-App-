import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/become_host/booking/widget/booking_requirement_row.dart';
import 'package:mrweekes229/features/guest_flow/become_host/booking/widget/booking_stepinfo_row.dart';
import 'package:mrweekes229/features/guest_flow/become_host/booking/widget/custom_info_box.dart';
import 'package:mrweekes229/features/guest_flow/become_host/toilet_info/screen/toilet.dart';

class BookingHost extends StatelessWidget {
  const BookingHost({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image(
              image: AssetImage(ImagePath.bathroom3),
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: screenWidth,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Become A Host',
                      style: getTextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff33CED5),
                      ),
                    ),
                  ),
                  SizedBox(height: 12), // Increased gap
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.14,
                    ), // Start from middle
                    child: SizedBox(
                      width: screenWidth * 0.8, // Control width for 2-line wrap
                      child: Text(
                        'Earn money by sharing your',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffE6F9F1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.22,
                    ), // Start from middle
                    child: SizedBox(
                      width: screenWidth * 0.8, // Control width for 2-line wrap
                      child: Text(
                        'Bathroom when its free',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffE6F9F1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  CustomInfoBox(
                    text: 'Earn Passive Income',
                    iconPath: IconPath.earning,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 16),
                  CustomInfoBox(
                    text: 'Secure & Safe',
                    iconPath: IconPath.safe,
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 16),
                  CustomInfoBox(
                    text: 'Flexible Availablity',
                    iconPath: IconPath.safe,
                    alignment: Alignment.centerLeft,
                  ),
                  SizedBox(height: 16),
                  CustomInfoBox(
                    text: 'Hygiene-first system',
                    iconPath: IconPath.hygine,
                    alignment: Alignment.centerRight,
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'How Hosting Works',
                      style: getTextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  StepInfoRow(number: '01', text: 'Add bathroom details'),
                  SizedBox(height: 16),
                  StepInfoRow(number: '02', text: 'Set schedule'),
                  SizedBox(height: 16),
                  StepInfoRow(number: '03', text: 'Set pricing'),
                  SizedBox(height: 16),
                  StepInfoRow(number: '04', text: 'Upload photos'),
                  SizedBox(height: 16),
                  StepInfoRow(number: '05', text: 'Start earning'),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,

                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Requirement',
                              style: getTextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff404040),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          const RequirementRow(
                            iconPath: IconPath.privatetoilet,
                            text: 'Private Bathroom',
                          ),
                          SizedBox(height: 20),
                          const RequirementRow(
                            iconPath: IconPath.basicaminities,
                            text: 'Basic amenities',
                          ),
                          SizedBox(height: 20),
                          const RequirementRow(
                            iconPath: IconPath.cleanready,
                            text: 'Clean and ready for use',
                          ),
                          SizedBox(height: 20),
                          const RequirementRow(
                            iconPath: IconPath.locationverification,
                            text: 'Location verification',
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 55),
                  InkWell(
                    onTap: () {
                      Get.to(() => Toilet());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffFF6B6B),
                      ),
                      child: Center(
                        child: Text(
                          'Become a Host',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
