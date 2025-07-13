import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ship_details_controller.dart';

class DateTimeSelector extends StatelessWidget {
  final ShipDetailsController controller;

  const DateTimeSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date Section
        const Text(
          'Date',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 12),

        GetBuilder<ShipDetailsController>(
          builder: (controller) {
            return GestureDetector(
              onTap: () => controller.selectDate(context),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        controller.selectedDate ?? 'MM/DD/YY',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              controller.selectedDate != null
                                  ? Colors.black
                                  : Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.calendar_today,
                      color: const Color(0xFF00BCD4),
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 20),

        // Time Slot Section
        const Text(
          'Time Slot',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        const SizedBox(height: 12),

        GetBuilder<ShipDetailsController>(
          builder: (controller) {
            return Row(
              children: [
                // Start Time
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectStartTime(context),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        controller.startTime ?? '00:00',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              controller.startTime != null
                                  ? Colors.black
                                  : Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 16),

                // TO Text
                const Text(
                  'TO',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(width: 16),

                // End Time
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.selectEndTime(context),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        controller.endTime ?? '00:00',
                        style: TextStyle(
                          fontSize: 16,
                          color:
                              controller.endTime != null
                                  ? Colors.black
                                  : Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
