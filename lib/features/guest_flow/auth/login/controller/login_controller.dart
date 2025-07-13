import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscurePassword = true.obs;

  
  final emailHasInput = false.obs;
  final passwordHasInput = false.obs;

 
  RxBool isFormValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      emailHasInput.value = emailController.text.trim().isNotEmpty;
      _validateForm();
    });
    passwordController.addListener(() {
      passwordHasInput.value = passwordController.text.trim().isNotEmpty;
      _validateForm();
    });
  }

  void _validateForm() {
    isFormValid.value = emailHasInput.value && passwordHasInput.value;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}