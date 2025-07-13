import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/ship_details/controller/ship_details_controller.dart';

class PackageSizeSelector extends StatelessWidget {
  final ShipDetailsController controller;

  const PackageSizeSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Package Size',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 16),

        GetBuilder<ShipDetailsController>(
          builder: (controller) {
            return Column(
              children: [
                _buildSizeOption(
                  'Small (up to 1 kg)',
                  '\$05',
                  'small',
                  controller,
                ),
                const SizedBox(height: 12),
                _buildSizeOption(
                  'Medium (up to 5 kg)',
                  '\$10',
                  'medium',
                  controller,
                ),
                const SizedBox(height: 12),
                _buildSizeOption(
                  'Large (up to 20 kg)',
                  '\$15',
                  'large',
                  controller,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildSizeOption(
    String title,
    String price,
    String size,
    ShipDetailsController controller,
  ) {
    final isSelected = controller.selectedSize == size;

    return GestureDetector(
      onTap: () => controller.selectSize(size),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF00BCD4) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Radio Button
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF00BCD4)
                          : Colors.grey.shade400,
                  width: 2,
                ),
                color:
                    isSelected ? const Color(0xFF00BCD4) : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Center(
                        child: Icon(Icons.circle, color: Colors.white, size: 8),
                      )
                      : null,
            ),

            const SizedBox(width: 16),

            // Size Text
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? const Color(0xFF00BCD4) : Colors.black,
                ),
              ),
            ),

            // Price
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? const Color(0xFF00BCD4) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
