import 'package:flutter/material.dart';
import '../controller/forgot_password_controller.dart';

class DynamicInputField extends StatelessWidget {
  final ForgotPasswordController controller;
  final int tabIndex;

  const DynamicInputField({
    super.key,
    required this.controller,
    required this.tabIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            tabIndex == 0 ? 'Email' : 'Phone',
            key: ValueKey(tabIndex),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Input Field
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.3, 0),
                end: Offset.zero,
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          },
          child: _buildInputField(tabIndex),
        ),
      ],
    );
  }

  Widget _buildInputField(int index) {
    return TextFormField(
      key: ValueKey(index),
      controller:
          index == 0 ? controller.emailController : controller.phoneController,
      keyboardType:
          index == 0 ? TextInputType.emailAddress : TextInputType.phone,
      style: const TextStyle(fontSize: 16, color: Colors.black),
      decoration: InputDecoration(
        hintText: index == 0 ? 'Enter your Email' : 'Enter your phone number',
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00BCD4), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
      ),
    );
  }
}
