import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/auth/login/screen/login_screen.dart';

class SignUpController extends GetxController {
  // Text Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Observable variables
  final RxBool isPasswordHidden = true.obs;
  final RxBool isConfirmPasswordHidden = true.obs;
  final RxBool isLoading = false.obs;
  final RxBool isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Add listeners to all text controllers
    nameController.addListener(_validateForm);
    phoneController.addListener(_validateForm);
    emailController.addListener(_validateForm);
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
    bool isValid =
        _isNameValid() &&
        _isPhoneValid() &&
        _isEmailValid() &&
        _isPasswordValid() &&
        _isConfirmPasswordValid();

    isFormValid.value = isValid;
  }

  bool _isNameValid() {
    return nameController.text.trim().isNotEmpty &&
        nameController.text.trim().length >= 2;
  }

  bool _isPhoneValid() {
    String phone = phoneController.text.trim();
    return phone.isNotEmpty && phone.length >= 10;
  }

  bool _isEmailValid() {
    String email = emailController.text.trim();
    return email.isNotEmpty && GetUtils.isEmail(email);
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
    if (!_isNameValid()) {
      Get.snackbar(
        'Error',
        'Please enter a valid name (at least 2 characters)',
      );
      return false;
    }

    if (!_isPhoneValid()) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return false;
    }

    if (!_isEmailValid()) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }

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

  Future<void> signUp() async {
    if (!_validateInputs()) return;

    try {
      isLoading.value = true;

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
        'Account created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to OTP verification or login
      Get.to(LoginScreen());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to create account: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void goToLogin() {
    Get.to(LoginScreen());
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
