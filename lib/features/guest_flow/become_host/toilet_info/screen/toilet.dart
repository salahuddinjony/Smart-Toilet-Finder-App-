import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/common/widgets/progress_steps.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/become_host/location/screen/location.dart';
import 'package:mrweekes229/features/guest_flow/become_host/toilet_info/controller/toilet_info_controller.dart';
import 'package:mrweekes229/features/guest_flow/become_host/toilet_info/widget/toilet_info_widget.dart';

class Toilet extends StatelessWidget {
  const Toilet({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final ToiletInfoController controller = Get.put(ToiletInfoController());

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
              const ProgressSteps(totalSteps: 7, activeSteps: 1),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffFFFFFF),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff000000).withValues(alpha: .3),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ToiletInfoWidget(),
              ),
              const SizedBox(height: 32),

              // *** Wrap in Obx for reactive rebuild ***
              Obx(() {
                return DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    dashPattern: [10, 10],
                    strokeWidth: 2,
                    radius: const Radius.circular(12),
                    color: const Color(0xff666666),
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 158,
                    decoration: BoxDecoration(
                      color: const Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        controller.pickedImage.value == null
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    'Upload your NID',
                                    style: getTextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff00C2CB),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Image.asset(
                                    ImagePath.upload,
                                    width: 38,
                                    height: 27,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(height: 18),
                                InkWell(
                                  onTap: () async {
                                    await controller.pickImage();
                                  },
                                  child: Center(
                                    child: Container(
                                      width: 127,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffE6F9F1),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Upload',
                                          style: getTextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff00C2CB),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                            // If image is picked, show full image inside dotted border container
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                controller.pickedImage.value!,
                                width: double.infinity,
                                height: 158,
                                fit: BoxFit.cover,
                              ),
                            ),
                  ),
                );
              }),
              SizedBox(height: 48),
              InkWell(
                onTap: () {
                  Get.to(() => Location());
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
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
        ),
      ),
    );
  }
}
