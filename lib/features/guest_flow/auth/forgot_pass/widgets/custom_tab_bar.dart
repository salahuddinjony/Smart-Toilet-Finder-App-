import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forgot_password_controller.dart';

class CustomTabBar extends StatelessWidget {
  final ForgotPasswordController controller;

  const CustomTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchTab(0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedTabIndex.value == 0
                            ? const Color(0xFF00C2CB)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:
                        controller.selectedTabIndex.value == 0
                            ? [
                              BoxShadow(
                                color: const Color(
                                  0xFF00BCD4,
                                ).withValues(alpha: .3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            controller.selectedTabIndex.value == 0
                                ? Colors.white
                                : Colors.grey.shade600,
                      ),
                      child: const Text('Email'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.switchTab(1),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedTabIndex.value == 1
                            ? const Color(0xFF00C2CB)
                            : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow:
                        controller.selectedTabIndex.value == 1
                            ? [
                              BoxShadow(
                                color: const Color(
                                  0xFF00BCD4,
                                ).withValues(alpha: .3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                            : null,
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 300),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            controller.selectedTabIndex.value == 1
                                ? Colors.white
                                : Colors.grey.shade600,
                      ),
                      child: const Text('Phone'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
