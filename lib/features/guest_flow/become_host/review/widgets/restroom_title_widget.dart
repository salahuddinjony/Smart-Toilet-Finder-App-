import 'package:flutter/material.dart';

class RestroomTitleWidget extends StatelessWidget {
  final String title;

  const RestroomTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}
