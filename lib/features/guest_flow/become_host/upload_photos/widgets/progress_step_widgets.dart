import 'package:flutter/material.dart';

Widget buildProgressSteps() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(7, (index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index < 3 ? const Color(0xFF00BCD4) : const Color(0xFFD0D0D0),
        ),
      );
    }),
  );
}
