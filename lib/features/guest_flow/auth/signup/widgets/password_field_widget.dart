import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'password_field.dart';

Widget buildPasswordField({
  required RxBool isPasswordHidden,
  required TextEditingController passwordController,
  required VoidCallback togglePasswordVisibility,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Password',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF404040),
        ),
      ),
      const SizedBox(height: 8),
      Obx(
        () => PasswordField(
          controller: passwordController,
          hintText: 'Enter your Password',
          isObscured: isPasswordHidden.value,
          onToggleVisibility: togglePasswordVisibility,
        ),
      ),
    ],
  );
}
