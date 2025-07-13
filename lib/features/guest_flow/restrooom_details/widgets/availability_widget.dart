import 'package:flutter/material.dart';

class AvailabilityWidget extends StatelessWidget {
  const AvailabilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF00BCD4),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Availability',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF48BB78).withValues(alpha: .2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Available',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                  color: Color(0XFF11B32A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Everyday: 6am to 6pm',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
