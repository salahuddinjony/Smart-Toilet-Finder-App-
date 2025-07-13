import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  final String description;

  const DescriptionWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.5),
      textAlign: TextAlign.center,
    );
  }
}
