import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/auth/change_password/widgets/appbar_widgets.dart';

import '../../signup/widgets/password_field_widget.dart';
import '../../signup/widgets/retype_pass_widget.dart';
import '../../signup/widgets/signup_button.dart';
import '../controller/change_pass_controller.dart';

class ChangePassScreen extends StatelessWidget {
  final ChangePassController controller = ChangePassController();
  ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Changed Password"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              "Enter Verification Code:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            buildPasswordField(
              isPasswordHidden: controller.isPasswordHidden,
              passwordController: controller.passwordController,
              togglePasswordVisibility: controller.togglePasswordVisibility,
            ),

            const SizedBox(height: 20),

            // Retype Password Field
            buildRetypePasswordField(
              isConfirmPasswordHidden: controller.isConfirmPasswordHidden,
              confirmPasswordController: controller.confirmPasswordController,
              toggleConfirmPasswordVisibility:
                  controller.toggleConfirmPasswordVisibility,
            ),

            const SizedBox(height: 40),

            // Sign Up Button
            buildSignUpButton(
              onPressed: controller.changePass,
              text: 'Changed',
              isFormValid: true.obs,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
