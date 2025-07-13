// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/common/widgets/progress_steps.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/guest_flow/become_host/location/controller/location_screen_controller.dart';
import 'package:mrweekes229/features/guest_flow/become_host/upload_photos/screen/upload_photos_screen.dart';

class Location extends StatelessWidget {
  final LocationScreenController controller = Get.put(
    LocationScreenController(),
  );
  Location({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Center(
                child: Text(
                  'List Your Bathroom',
                  style: getTextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff404040),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const ProgressSteps(totalSteps: 7, activeSteps: 2),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xfff000000).withValues(alpha: 0.2),
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Location',
                        style: getTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff00C2CB),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Address',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7F7F7F),
                        ),
                      ),
                      const SizedBox(height: 10),

                      TextField(
                        // controller: controller.titleController,
                        style: const TextStyle(color: Colors.black),
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 20,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xffC4C4C4),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xffC4C4C4),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xffC4C4C4),
                              width: 1,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        'Map',
                        style: getTextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7F7F7F),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        height: 230,
                        decoration: BoxDecoration(
                          color: Color(0xffF0F0F0),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xffC4C4C4),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Container(
                            color: Colors.white,
                            child: GoogleMap(
                              onMapCreated: controller.onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: controller.initialPosition.value,
                                zoom: 12.0,
                              ),
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),

                      InkWell(
                        onTap: () {
                          controller.pinCurrentLocation();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff00C2CB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              'Pin Current Location',
                              style: getTextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.buttonColor,
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Back',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 50),

                  InkWell(
                    onTap: () {
                      Get.to(() => UploadPhotosScreen());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                          ),
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
