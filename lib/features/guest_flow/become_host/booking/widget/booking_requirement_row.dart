import 'package:flutter/material.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';

class RequirementRow extends StatelessWidget {
  final String iconPath;
  final String text;

  const RequirementRow({
    super.key,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: getTextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: const Color(0xff404040),
          ),
        ),
      ],
    );
  }
}
