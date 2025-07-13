import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/common/widgets/custom_appbar.dart';
import 'package:mrweekes229/features/guest_flow/auth/forgot_pass/screen/forgot_pass_screen.dart';
import 'package:mrweekes229/features/guest_flow/auth/login/controller/login_controller.dart';
import 'package:mrweekes229/features/guest_flow/auth/login/widget/custom_input_container.dart';
import 'package:mrweekes229/features/guest_flow/auth/signup/screen/signup_screen.dart';
import 'package:mrweekes229/features/guest_flow/bottom_navbar/screen/guest_bottom_navbar_screen.dart';

import '../../../../../core/utils/constants/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: 'Log In'),
              SizedBox(height: screenHeight * 0.1),
              Text(
                'Email',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff404040),
                ),
              ),
              const SizedBox(height: 10),
              CustomInputContainer(
                controller: controller.emailController,
                hintText: 'Enter your email',
                obscureText: false,
                borderHighlightCondition: controller.emailHasInput,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 20),
              Text(
                'Password',
                style: getTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff404040),
                ),
              ),
              const SizedBox(height: 10),
              CustomInputContainer(
                controller: controller.passwordController,
                hintText: 'Enter your password',
                obscureText: controller.obscurePassword.value,
                borderHighlightCondition: controller.passwordHasInput,
                keyboardType: TextInputType.text,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.obscurePassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: const Color(0xffA6A6A6),
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              ),

              const SizedBox(height: 36),
              Obx(() {
                final isActive = controller.isFormValid.value;
                return GestureDetector(
                  onTap:
                      isActive
                          ? () {
                            Get.to(GuestBottomNavbarScreen());
                          }
                          : null,
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color:
                          isActive
                              ? AppColors.buttonColor
                              : AppColors.buttonDisableColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
                        style: getTextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color:
                              isActive ? Colors.white : const Color(0xffFF6B6B),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 16),
              Center(
                child: InkWell(
                  onTap: () {
                    Get.to(ForgotPasswordScreen());
                  },
                  child: Text(
                    'Forgot password?',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3A4C67),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account?',
                    style: getTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff404040),
                    ),
                  ),
                  SizedBox(width: 5),
                  InkWell(
                    onTap: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text(
                      'Sign Up',
                      style: getTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF6B6B),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
