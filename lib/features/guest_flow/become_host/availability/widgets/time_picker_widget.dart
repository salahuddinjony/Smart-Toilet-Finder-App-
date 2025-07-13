import 'package:flutter/material.dart';

import 'time_picker_modal.dart';

class TimePickerWidget extends StatelessWidget {
  final String selectedTime;
  final Function(String) onTimeChanged;
  final String label;

  const TimePickerWidget({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showTimePicker(context),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.access_time, color: const Color(0xFF00BCD4), size: 20),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                selectedTime,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade600,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showTimePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder:
          (context) => TimePickerModal(
            selectedTime: selectedTime,
            onTimeSelected: onTimeChanged,
            label: label,
          ),
    );
  }
}
