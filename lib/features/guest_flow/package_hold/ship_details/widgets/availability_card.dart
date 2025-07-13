import 'package:flutter/material.dart';

class AvailabilityCard extends StatelessWidget {
  const AvailabilityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Availability Dot
        Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(
            color: Color(0xFF00BCD4),
            shape: BoxShape.circle,
          ),
        ),

        const SizedBox(width: 12),

        // Availability Text
        const Text(
          'Availability',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const Spacer(),

        // Available Status
        const Text(
          'Available',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF4CAF50),
          ),
        ),
      ],
    );
  }
}
