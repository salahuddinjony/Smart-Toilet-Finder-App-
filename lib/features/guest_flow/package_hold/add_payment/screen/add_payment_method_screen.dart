import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/add_payment/controller/add_payment_method_controller.dart';
import '../widgets/payment_method_option.dart';
import '../widgets/continue_button.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  late final AddPaymentMethodController controller;

  AddPaymentMethodScreen({super.key}) {
    controller = Get.put(AddPaymentMethodController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  const Text(
                    'Add a payment method',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Payment Methods List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Obx(
                      () => PaymentMethodOption(
                        title: 'stripe',
                        isSelected: controller.selectedMethod.value == 'stripe',
                        onTap: () => controller.selectMethod('stripe'),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // You can add more payment methods here
                    // PaymentMethodOption(
                    //   title: 'PayPal',
                    //   isSelected: controller.selectedMethod.value == 'paypal',
                    //   onTap: () => controller.selectMethod('paypal'),
                    // ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => ContinueButton(
                  isEnabled: controller.selectedMethod.value.isNotEmpty,
                  onPressed: controller.continueToNextStep,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
