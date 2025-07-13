import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/pricing/screen/pricing_screen.dart';
import 'package:mrweekes229/features/guest_flow/become_host/review/screen/submit_review_screen.dart';

class NavigationButtonWidgetRules extends StatelessWidget {
  const NavigationButtonWidgetRules({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.to(PricingScreen()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE57373), width: 1.5),
            ),
            child: Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE57373),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 50),
        GestureDetector(
          onTap: () => Get.to(SubmitReviewScreen()),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFE57373),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
