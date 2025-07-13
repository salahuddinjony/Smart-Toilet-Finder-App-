import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/auth/signup/controller/signup_controller.dart';

import 'custom_text_field.dart';

Widget buildEmailField({required SignUpController emailController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Email',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF404040),
        ),
      ),
      const SizedBox(height: 8),
      CustomTextField(
        controller: emailController.emailController,
        hintText: 'Enter your Email',
        keyboardType: TextInputType.emailAddress,
      ),
    ],
  );
}
