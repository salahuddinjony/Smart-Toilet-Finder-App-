import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/signup_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/email_field_widget.dart';
import '../widgets/login_link_widget.dart';
import '../widgets/password_field_widget.dart';
import '../widgets/retype_pass_widget.dart';
import '../widgets/signup_button.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFF9F9F9),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Get.back(),
      ),
      title: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Name Field
          _buildNameField(),

          const SizedBox(height: 20),

          // Phone Number Field
          _buildPhoneField(),

          const SizedBox(height: 20),

          // Email Field
          buildEmailField(emailController: controller),

          const SizedBox(height: 20),

          // Password Field
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
            onPressed: controller.signUp,
            text: 'Sign Up',
            isFormValid: controller.isFormValid,
          ),

          const SizedBox(height: 40),

          // Already have account
          buildLoginLink(goToLogin: controller.goToLogin),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF404040),
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: controller.nameController,
          hintText: 'Enter your Name',
          keyboardType: TextInputType.name,
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF404040),
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: controller.phoneController,
          hintText: 'Enter your Phone number',
          keyboardType: TextInputType.phone,
        ),
      ],
    );
  }
}
