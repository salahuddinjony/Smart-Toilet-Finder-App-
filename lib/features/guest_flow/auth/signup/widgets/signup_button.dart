import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/colors.dart';

Widget buildSignUpButton({
  required VoidCallback onPressed,
  required String text,
  required RxBool isFormValid,
}) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: Theme(
      data: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            side: BorderSide.none,
            splashFactory: NoSplash.splashFactory,
          ),
        ),
      ),
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: isFormValid.value ? onPressed : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isFormValid.value
                      ? AppColors.buttonColor
                      : AppColors.buttonDisableColor,
              foregroundColor:
                  isFormValid.value
                      ? const Color(0xFFFF6B6B) // White text when valid
                      : Colors.white, // Red text when invalid
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: isFormValid.value ? 2 : 0,
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:
                    isFormValid.value ? Colors.white : const Color(0xFFFF6B6B),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
