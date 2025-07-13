import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/guest_flow/auth/change_password/screen/change_pass_screen.dart';
import 'package:mrweekes229/features/guest_flow/auth/otp/controller/otp_controller.dart';
import 'package:mrweekes229/features/guest_flow/auth/otp/widget/pin_put_theme.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final String messagePrefix;
  final String highlightText;
  const OtpScreen({
    super.key,
    required this.messagePrefix,
    required this.highlightText,
  });
  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final defaultPinTheme = getDefaultPinTheme();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.03),
                const Text(
                  'Enter the',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff333333),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Padding(
                  padding: EdgeInsets.only(left: 83),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'confirmation code',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Pinput(
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                        color: const Color(0xffFF6B6B),
                        width: 2,
                      ),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme,
                  showCursor: true,
                  onCompleted: (pin) {
                    controller.updateOtp(pin);
                  },
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff404040),
                      ),
                      children: [
                        TextSpan(text: messagePrefix),
                        TextSpan(
                          text: highlightText,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Resend Code',
                  style: getTextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff3A4C67),
                  ),
                ),
                SizedBox(height: 77),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ChangePassScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
