import 'package:flutter/material.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';

class StepInfoRow extends StatelessWidget {
  final String number;
  final String text;

  const StepInfoRow({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xff00C2CB),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              number,
              style: getTextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: const Color(0xffFFFFFF),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xffECECEC),
          ),
        ),
      ],
    );
  }
}
