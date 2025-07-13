import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/auth/otp/screen/otp_screen.dart';

class ForgotPasswordController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  // Text Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // Observable variables
  final RxInt selectedTabIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final RxBool isEmailValid = false.obs;
  final RxBool isPhoneValid = false.obs;
  final RxBool isFormValid = false.obs;
  final RxString phoneOrEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    // Add listeners
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
    });

    emailController.addListener(_validateEmail);
    phoneController.addListener(_validatePhone);
  }

  void _validateForm() {
    isFormValid.value = isEmailValid.value || isPhoneValid.value;
  }

  void _validateEmail() {
    String email = emailController.text.trim();
    isEmailValid.value = email.isNotEmpty && GetUtils.isEmail(email);
    _validateForm();
  }

  void _validatePhone() {
    String phone = phoneController.text.trim();
    isPhoneValid.value = phone.isNotEmpty && phone.length >= 10;
    _validateForm();
  }

  bool get isCurrentTabValid {
    if (selectedTabIndex.value == 0) {
      phoneOrEmail.value = emailController.text.trim();
      return isEmailValid.value;
    } else {
      phoneOrEmail.value = phoneController.text.trim();
      return isPhoneValid.value;
    }
  }

  String get currentInputValue {
    if (selectedTabIndex.value == 0) {
      return emailController.text.trim();
    } else {
      return phoneController.text.trim();
    }
  }

  String get currentInputType {
    return selectedTabIndex.value == 0 ? 'Email' : 'Phone';
  }

  Future<void> sendCode() async {
    if (!isCurrentTabValid) {
      Get.snackbar(
        'Error',
        'Please enter a valid ${currentInputType.toLowerCase()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Verification code sent to your ${currentInputType.toLowerCase()}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate to OTP screen
      Get.to(
        OtpScreen(
          messagePrefix: "Verification code has been sent to the ",
          highlightText: phoneOrEmail.value,
        ),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send code: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void switchTab(int index) {
    tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
