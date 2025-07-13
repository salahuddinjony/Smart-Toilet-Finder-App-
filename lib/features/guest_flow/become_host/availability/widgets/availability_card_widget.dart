import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/availability/controller/availability_controller.dart';

import 'day_selector_widget.dart';
import 'time_picker_widget.dart';

Widget buildAvailabilityCard() {
  AvailabilityController controller = Get.find<AvailabilityController>();
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
          // Availability Title
          Text(
            'Availability',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF00BCD4),
            ),
          ),
          const SizedBox(height: 20),
          // Choose available day subtitle
          Text(
            'Choose one available day',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
          // Days Selector
          const DaySelectorWidget(),
          const SizedBox(height: 30),
          // Time Slots
          Text(
            'Time Slots',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
          // Time Pickers
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: TimePickerWidget(
                    selectedTime: controller.startTime.value,
                    onTimeChanged: controller.setStartTime,
                    label: 'From',
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'To',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFE57373),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TimePickerWidget(
                    selectedTime: controller.endTime.value,
                    onTimeChanged: controller.setEndTime,
                    label: 'To',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
