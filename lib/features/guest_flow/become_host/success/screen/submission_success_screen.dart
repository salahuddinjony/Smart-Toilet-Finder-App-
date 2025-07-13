import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/submission_success_controller.dart';

class SubmissionSuccessScreen extends StatelessWidget {
  const SubmissionSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SubmissionSuccessController controller = Get.put(
      SubmissionSuccessController(),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              _buildSuccessIcon(),
                              const SizedBox(height: 60),
                              _buildSuccessTitle(),
                              const SizedBox(height: 30),
                              _buildSuccessMessage(),
                              const Spacer(),
                              _buildDashboardButton(controller),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFF4CAF50), const Color(0xFF2E7D32)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4CAF50).withValues(alpha: .3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: const Icon(Icons.check, color: Colors.white, size: 100),
    );
  }

  Widget _buildSuccessTitle() {
    return const Text(
      'Your private bathroom has been listed!',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFF404040),
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSuccessMessage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        'Thanks for submitting your bathroom listing. We\'re reviewing it now to ensure everything meets our quality and safety standards. You\'ll be notified once it\'s approved and live on the app.',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
          height: 1.5,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildDashboardButton(SubmissionSuccessController controller) {
    return GetBuilder<SubmissionSuccessController>(
      builder: (controller) {
        return GestureDetector(
          onTap:
              controller.isNavigating ? null : () => controller.goToDashboard(),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color:
                  controller.isNavigating
                      ? Colors.grey.shade400
                      : const Color(0xFFE57373),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE57373).withValues(alpha: .3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child:
                  controller.isNavigating
                      ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                      : const Text(
                        'Go To Dashboard',
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
