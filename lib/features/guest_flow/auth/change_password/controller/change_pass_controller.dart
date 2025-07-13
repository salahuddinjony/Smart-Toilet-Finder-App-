import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/screen/login_screen.dart';

class ChangePassController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;
  final RxBool isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  void _validateForm() {
    bool isValid = _isPasswordValid() && _isConfirmPasswordValid();

    isFormValid.value = isValid;
  }

  bool _isPasswordValid() {
    return passwordController.text.isNotEmpty &&
        passwordController.text.length >= 6;
  }

  bool _isConfirmPasswordValid() {
    return confirmPasswordController.text.isNotEmpty &&
        confirmPasswordController.text == passwordController.text;
  }

  bool _validateInputs() {
    if (!_isPasswordValid()) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return false;
    }

    if (!_isConfirmPasswordValid()) {
      Get.snackbar('Error', 'Passwords do not match');
      return false;
    }

    return true;
  }

  Future<void> changePass() async {
    if (!_validateInputs()) return;

    try {
      // Implement your signup logic here
      // For example:
      // await authService.signUp(
      //   name: nameController.text.trim(),
      //   phone: phoneController.text.trim(),
      //   email: emailController.text.trim(),
      //   password: passwordController.text,
      // );

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Password Change successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to OTP verification or login
      Get.offAll(LoginScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to change password: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
