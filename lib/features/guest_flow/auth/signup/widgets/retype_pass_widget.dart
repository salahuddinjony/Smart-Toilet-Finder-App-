import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_field.dart';

Widget buildRetypePasswordField({
  required RxBool isConfirmPasswordHidden,
  required TextEditingController confirmPasswordController,
  required VoidCallback toggleConfirmPasswordVisibility,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Retype Password',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF404040),
        ),
      ),
      const SizedBox(height: 8),
      Obx(
        () => PasswordField(
          controller: confirmPasswordController,
          hintText: 'Enter your Password',
          isObscured: isConfirmPasswordHidden.value,
          onToggleVisibility: toggleConfirmPasswordVisibility,
        ),
      ),
    ],
  );
}
