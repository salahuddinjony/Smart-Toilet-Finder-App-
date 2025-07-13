import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';

class CustomSmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  const CustomSmallButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Material(
        elevation: 3.0,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: height ?? 50,
          width: width ?? 172,
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.buttonColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                height: 1.0,
                fontWeight: FontWeight.w500,
                color: textColor ?? Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
