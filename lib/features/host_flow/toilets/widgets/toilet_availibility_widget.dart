import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class ToiletAvailabilityWidget extends StatelessWidget {
  const ToiletAvailabilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(IconPath.editIcon, width: 30, height: 30),
              ),
            ),
            Row(
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
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Available Days
                const Text(
                  'Everyday : 6am to 6pm',
                  style: TextStyle(fontSize: 14, color: Color(0xFF404040)),
                ),
                // Switch Button (Green color)
                Switch(
                  value: true,
                  onChanged: (bool value) {
                    // Handle switch toggle
                  },
                  activeColor: Color(0xFF4CAF50), // Green color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
