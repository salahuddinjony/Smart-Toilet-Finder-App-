import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/review_continue_controller.dart';

class PayConfirmButton extends StatelessWidget {
  final PackageReviewContinueController controller;

  const PayConfirmButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: GetBuilder<PackageReviewContinueController>(
        builder: (controller) {
          return GestureDetector(
            onTap:
                controller.isProcessing
                    ? null
                    : () => controller.processPayment(),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color:
                    controller.isProcessing
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
                    controller.isProcessing
                        ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                        : const Text(
                          'Pay & Confirm',
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
      ),
    );
  }
}
