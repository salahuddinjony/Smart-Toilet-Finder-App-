import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

PinTheme getDefaultPinTheme() {
  return PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    decoration: BoxDecoration(
      color: const Color(0xffF5F5F5),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(width: 1, color: const Color(0xffE5E6EB)),
    ),
  );
}