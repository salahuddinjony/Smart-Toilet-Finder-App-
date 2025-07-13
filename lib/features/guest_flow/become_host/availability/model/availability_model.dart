class AvailabilityModel {
  final List<String> availableDays;
  final String startTime;
  final String endTime;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  AvailabilityModel({
    required this.availableDays,
    required this.startTime,
    required this.endTime,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'available_days': availableDays,
      'start_time': startTime,
      'end_time': endTime,
      'is_active': isActive,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Create from JSON
  factory AvailabilityModel.fromJson(Map<String, dynamic> json) {
    return AvailabilityModel(
      availableDays: List<String>.from(json['available_days'] ?? []),
      startTime: json['start_time'] ?? '8:00 am',
      endTime: json['end_time'] ?? '8:00 pm',
      isActive: json['is_active'] ?? true,
      createdAt:
          json['created_at'] != null
              ? DateTime.parse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.parse(json['updated_at'])
              : null,
    );
  }

  // Copy with new values
  AvailabilityModel copyWith({
    List<String>? availableDays,
    String? startTime,
    String? endTime,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AvailabilityModel(
      availableDays: availableDays ?? this.availableDays,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Get duration in hours
  double get durationInHours {
    // Simple calculation - you might want to make this more sophisticated
    final startHour = _parseTime(startTime);
    final endHour = _parseTime(endTime);
    return endHour - startHour;
  }

  double _parseTime(String time) {
    final parts = time.split(' ');
    final timePart = parts[0];
    final period = parts[1];

    final hourMinute = timePart.split(':');
    double hour = double.parse(hourMinute[0]);
    double minute = double.parse(hourMinute[1]) / 60;

    if (period.toLowerCase() == 'pm' && hour != 12) {
      hour += 12;
    } else if (period.toLowerCase() == 'am' && hour == 12) {
      hour = 0;
    }

    return hour + minute;
  }

  // Check if available on specific day
  bool isAvailableOn(String day) {
    return availableDays.contains(day);
  }

  // Get formatted availability string
  String get formattedAvailability {
    String days =
        availableDays.length == 7 ? 'Every day' : availableDays.join(', ');
    return '$days from $startTime to $endTime';
  }
}
