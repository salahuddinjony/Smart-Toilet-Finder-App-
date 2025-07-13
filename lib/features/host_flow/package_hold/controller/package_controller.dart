import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {
  final Rx<TimeOfDay?> startTime = Rx<TimeOfDay?>(null);
  final Rx<TimeOfDay?> endTime = Rx<TimeOfDay?>(null);
  final RxString errorMessage = ''.obs;

  // Format TimeOfDay to string (e.g., "12:00 PM")
  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  // Pick time for start or end
  Future<void> pickTime(BuildContext context, {required bool isStartTime}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFBA4E4E), 
              onPrimary: Colors.white,
              onSurface: Color(0xFF404040),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFFBA4E4E),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isStartTime) {
        startTime.value = picked;
        // Validate if endTime exists and is after startTime
        if (endTime.value != null) {
          if (!_isEndTimeValid(picked, endTime.value!)) {
            errorMessage.value = 'End time must be after start time';
          } else {
            errorMessage.value = '';
          }
        }
      } else {
        if (startTime.value != null && !_isEndTimeValid(startTime.value!, picked)) {
          errorMessage.value = 'End time must be after start time';
          return;
        }
        endTime.value = picked;
        errorMessage.value = '';
      }
    }
  }

  // Validate that end time is after start time
  bool _isEndTimeValid(TimeOfDay start, TimeOfDay end) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    return endMinutes > startMinutes;
  }

  // Get formatted start time
  String get formattedStartTime => _formatTime(startTime.value);

  // Get formatted end time
  String get formattedEndTime => _formatTime(endTime.value);
}