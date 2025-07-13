import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pricing/widgets/progress_steps_widget.dart';
import '../controller/submit_review_controller.dart';
import '../widgets/review_summary_card.dart';

class SubmitReviewScreen extends StatelessWidget {
  const SubmitReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SubmitReviewController controller = Get.put(SubmitReviewController());
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08),

              const SizedBox(height: 20),

              // Title
              Center(
                child: Text(
                  'Submit For Review',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF404040),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Progress Steps (All completed)
              const ProgressStepsWidget(currentStep: 7, totalSteps: 7),

              SizedBox(height: screenHeight * 0.05),

              // Review Summary Card
              ReviewSummaryCard(controller: controller),

              const SizedBox(height: 30),

              // Submit Button
              _buildSubmitButton(controller),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(SubmitReviewController controller) {
    return GetBuilder<SubmitReviewController>(
      builder: (controller) {
        return GestureDetector(
          onTap:
              controller.isSubmitting
                  ? null
                  : () => controller.submitForReview(),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color:
                  controller.isSubmitting
                      ? Colors.grey.shade400
                      : const Color(0xFFE57373),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child:
                  controller.isSubmitting
                      ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                      : const Text(
                        'Submit For Review',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
            ),
          ),
        );
      },
    );
  }
}
