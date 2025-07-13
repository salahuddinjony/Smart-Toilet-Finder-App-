import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInputContainer extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final RxBool borderHighlightCondition;
  final TextInputType keyboardType;

  const CustomInputContainer({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.suffixIcon,
    required this.borderHighlightCondition,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffFFFFFF),
            border: Border.all(
              color: borderHighlightCondition.value
                  ? const Color(0xffE53935)  // লাল যখন ইনপুট আছে
                  : const Color(0xff78828A), // ধূসর যখন ইনপুট ফাঁকা
              width: 1,
            ),
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: suffixIcon,
            ),
          ),
        ));
  }
}