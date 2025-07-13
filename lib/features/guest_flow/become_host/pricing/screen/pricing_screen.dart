import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/pricing_controller.dart';
import '../widgets/commission_note_widget.dart';
import '../widgets/pricing_card.dart';
import '../widgets/progress_steps_widget.dart';
import '../widgets/navigation_buttons_widget.dart';

class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PricingController controller = Get.put(PricingController());
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
                  'List Your Bathroom',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF404040),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Progress Steps
              const ProgressStepsWidget(currentStep: 6, totalSteps: 7),

              SizedBox(height: screenHeight * 0.05),

              // Pricing Card
              PricingCard(controller: controller),

              const SizedBox(height: 20),

              // Commission Note
              const CommissionNoteWidget(),

              const SizedBox(height: 40),

              // Navigation Buttons
              NavigationButtonsWidget(
                onBack: () => Get.back(),

                onNext: () => controller.goToNextStep(),
                canProceed: true,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
