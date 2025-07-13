import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/auth/login/screen/login_screen.dart';

import '../../../../core/utils/constants/colors.dart';

class SplashoScreen extends StatelessWidget {
  const SplashoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bgImage()),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: .6),
                    Colors.black.withValues(alpha: .3),
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final screenHeight = MediaQuery.of(context).size.height;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenHeight * 0.07),
                          Text(
                            'Need a Bathroom Fast?\nWe’ve Got You.',
                            style: GoogleFonts.poppins(
                              fontSize: 33,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff00C2CB),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              'Find and book clean, private Bathrooms\nnearby — anytime, anywhere. No lines. No hassle. Just go.',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffF9F9F9),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.25),
                          InkWell(
                            onTap: () {
                              Get.to(() => LoginScreen());
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
                                  'Get Started',
                                  style: getTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.1),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String bgImage() {
  List<String> imagePaths = [
    ImagePath.onbording,
    ImagePath.restroom1,
    ImagePath.restroom2,
    ImagePath.restroom3,
    ImagePath.restroom4,
    ImagePath.bathroom1,
    ImagePath.bathroom2,
    ImagePath.bathroom3,
    ImagePath.bathroom4,
    ImagePath.bathroom5,
    ImagePath.bathroom6,
    ImagePath.bathroom7,
    ImagePath.bathroom8,
    ImagePath.bathroom9,
    ImagePath.bathroom10,
    ImagePath.bathroom11,
    ImagePath.bathroom12,
    ImagePath.bathroom13,
    ImagePath.bathroom14,
    ImagePath.bathroom15,
  ];

  final random = Random();
  int randomIndex = random.nextInt(imagePaths.length);

  return imagePaths[randomIndex];
}
