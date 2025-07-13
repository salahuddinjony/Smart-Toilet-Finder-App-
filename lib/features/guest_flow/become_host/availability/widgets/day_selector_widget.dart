// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/availability_controller.dart';

class DaySelectorWidget extends StatelessWidget {
  const DaySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AvailabilityController controller =
        Get.find<AvailabilityController>();
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Column(
      children: [
        Row(
          children:
              days.take(4).map((day) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Obx(() => _buildDayButton(day, controller)),
                  ),
                );
              }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              days.skip(4).map((day) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    width: 80,
                    child: Obx(() => _buildDayButton(day, controller)),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }

  Widget _buildDayButton(String day, AvailabilityController controller) {
    final isSelected = controller.selectedDays.contains(day);
    print('Day $day: isSelected = $isSelected'); // Debug

    return GestureDetector(
      onTap: () => controller.toggleDay(day),
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFFE57373).withValues(alpha: .1)
                  : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border:
              isSelected
                  ? Border.all(color: const Color(0xFFE57373), width: 1.5)
                  : null,
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  isSelected ? const Color(0xFFE57373) : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
