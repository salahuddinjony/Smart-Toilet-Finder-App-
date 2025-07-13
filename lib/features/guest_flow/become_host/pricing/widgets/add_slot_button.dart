import 'package:flutter/material.dart';

class AddSlotButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddSlotButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF00BCD4).withValues(alpha: .1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF00BCD4), width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add Slot',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF00BCD4),
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.add, color: const Color(0xFF00BCD4), size: 20),
          ],
        ),
      ),
    );
  }
}
