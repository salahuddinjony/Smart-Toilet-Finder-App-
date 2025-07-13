import 'package:flutter/material.dart';

class ProgressStepsWidget extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const ProgressStepsWidget({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(totalSteps, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                index < currentStep
                    ? const Color(0xFF00BCD4)
                    : const Color(0xFFD0D0D0),
          ),
        );
      }),
    );
  }
}
