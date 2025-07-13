import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/pricing_controller.dart';
import 'pricing_slot_widget.dart';
import 'late_fee_widget.dart';
import 'add_slot_button.dart';

class PricingCard extends StatelessWidget {
  final PricingController controller;

  const PricingCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pricing Title
            Text(
              'Pricing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF00BCD4),
              ),
            ),

            const SizedBox(height: 30),

            // Pricing Slots
            GetBuilder<PricingController>(
              builder: (controller) {
                return Column(
                  children: [
                    ...controller.pricingSlots.asMap().entries.map((entry) {
                      int index = entry.key;
                      var slot = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: PricingSlotWidget(
                          timeValue: slot['time'] ?? '',
                          priceValue: slot['price'] ?? '',
                          onTimeChanged:
                              (value) =>
                                  controller.updateSlotTime(index, value),
                          onPriceChanged:
                              (value) =>
                                  controller.updateSlotPrice(index, value),
                          onRemove:
                              controller.pricingSlots.length > 1
                                  ? () => controller.removeSlot(index)
                                  : null,
                        ),
                      );
                    }),
                  ],
                );
              },
            ),

            // Add Slot Button
            AddSlotButton(onPressed: () => controller.addNewSlot()),

            const SizedBox(height: 30),

            // Late Fee Section
            GetBuilder<PricingController>(
              builder: (controller) {
                return LateFeeWidget(
                  isEnabled: controller.lateFeeEnabled,
                  feeAmount: controller.lateFeeAmount,
                  onToggle: (value) => controller.toggleLateFee(value),
                  onFeeChanged: (value) => controller.updateLateFee(value),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
