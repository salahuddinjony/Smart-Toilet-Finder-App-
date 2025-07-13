// ignore_for_file: avoid_print

import 'package:get/get.dart';

class OtpController extends GetxController {
  /// Store entered OTP
  final otpCode = ''.obs;

  /// Method to update OTP when completed
  void updateOtp(String code) {
    otpCode.value = code;
    print("OTP captured in controller: $code");

    // In future you can call verifyOtp() here
    // verifyOtp();
  }

  /// Future API call for OTP verification (mock for now)
  Future<void> verifyOtp() async {
    print("Verifying OTP: ${otpCode.value}");

    await Future.delayed(const Duration(seconds: 2));
    print("OTP verification successful!");
  }
}
