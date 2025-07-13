import 'package:flutter/material.dart';

class CommissionNoteWidget extends StatelessWidget {
  const CommissionNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Text(
        'Note: The app owner will receive a 10% commission from each successful booking.',
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.shade600,
          height: 1.4,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
