import 'package:flutter/material.dart';

class AvailabilityInfoWidget extends StatelessWidget {
  final String availability;

  const AvailabilityInfoWidget({super.key, required this.availability});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 62), // Align with host name
      child: Text(
        availability,
        style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
      ),
    );
  }
}
