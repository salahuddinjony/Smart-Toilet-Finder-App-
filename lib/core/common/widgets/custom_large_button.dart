import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import '../styles/global_text_style.dart';

class CustomLargeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final double? height;
  final String? imagePath;

  const CustomLargeButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.backgroundColor,
    this.height,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Image.asset('assets/icons/package.png', height: 24, width: 24),
            SizedBox(width: 8),

            if (imagePath != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  imagePath!,
                  height: 24,
                  width: 24,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      width: 24,
                      height: 24,
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 24,
                      ),
                    );
                  },
                ),
              ),

            Text(
              text,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor ?? Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}