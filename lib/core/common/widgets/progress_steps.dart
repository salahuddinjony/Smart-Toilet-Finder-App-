import 'package:flutter/material.dart';

class ProgressSteps extends StatelessWidget {
  final int totalSteps;
  final int activeSteps;

  const ProgressSteps({
    super.key,
    required this.totalSteps,
    required this.activeSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index < activeSteps;
          return Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color:
                      isActive
                          ? const Color(0xff00C2CB)
                          : const Color(0xffD9D9D9),
                  shape: BoxShape.circle,
                ),
              ),
              if (index != totalSteps - 1) const SizedBox(width: 32),
            ],
          );
        }),
      ),
    );
  }
}
