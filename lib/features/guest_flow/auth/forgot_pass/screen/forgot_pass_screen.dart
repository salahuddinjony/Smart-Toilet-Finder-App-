import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/auth/signup/widgets/signup_button.dart';
import '../controller/forgot_password_controller.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/dynamic_input_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );

  ForgotPasswordScreen({super.key});

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
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          const Text(
            'Forget Password',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 40),

          // Subtitle
          const Text(
            'Please enter your email address or phone number for confirmation code.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF5F5F5F),
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 40),

          // Custom Tab Bar
          CustomTabBar(controller: controller),

          const SizedBox(height: 40),

          // Dynamic Input Field
          Obx(
            () => DynamicInputField(
              controller: controller,
              tabIndex: controller.selectedTabIndex.value,
            ),
          ),

          const SizedBox(height: 60),

          // Send Button
          buildSignUpButton(
            onPressed: controller.sendCode,
            text: "Send",
            isFormValid: controller.isFormValid,
          ),

          const Spacer(),
        ],
      ),
    );
  }
}
