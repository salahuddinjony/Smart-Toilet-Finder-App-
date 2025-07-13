import 'package:flutter/material.dart';

class PricingListWidget extends StatelessWidget {
  final List<Map<String, String>> pricingSlots;

  const PricingListWidget({super.key, required this.pricingSlots});

  @override
  Widget build(BuildContext context) {
    // Default pricing if none provided
    final displayPricing =
        pricingSlots.isNotEmpty
            ? pricingSlots
            : [
              {'time': '15 Minutes', 'price': '\$2.5'},
              {'time': '30 Minutes', 'price': '\$5.0'},
              {'time': '1 Hour', 'price': '\$10.0'},
            ];

    return Column(
      children:
          displayPricing.map((slot) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _buildPricingRow(slot['time']!, slot['price']!),
            );
          }).toList(),
    );
  }

  Widget _buildPricingRow(String time, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF00BCD4),
          ),
        ),
      ],
    );
  }
}
