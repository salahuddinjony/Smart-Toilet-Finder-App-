import 'package:flutter/material.dart';

class NavigationButtonsWidget extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onNext;
  final bool canProceed;

  const NavigationButtonsWidget({
    super.key,
    required this.onBack,
    required this.onNext,
    required this.canProceed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Back Button
        GestureDetector(
          onTap: onBack,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE57373), width: 1.5),
            ),
            child: Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE57373),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 50),

        // Next Button
        GestureDetector(
          onTap: canProceed ? onNext : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              color:
                  canProceed ? const Color(0xFFE57373) : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
