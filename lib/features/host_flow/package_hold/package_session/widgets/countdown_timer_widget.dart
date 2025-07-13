import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/package_session_controller.dart';

class CountdownTimerWidget extends StatelessWidget {
  const CountdownTimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PackageSessionController>();

    return Column(
      children: [
        // Circular Timer
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            children: [
              // Background Circle
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFE0F7FA), width: 8),
                ),
              ),
              // Progress Circle
              Obx(
                () => SizedBox(
                  width: 120,
                  height: 120,
                  child: CircularProgressIndicator(
                    value: controller.progress.value,
                    strokeWidth: 8,
                    backgroundColor: Colors.transparent,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFF00BCD4),
                    ),
                  ),
                ),
              ),
              // Timer Text
              Center(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        controller.timeRemaining.value,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00BCD4),
                        ),
                      ),
                      const Text(
                        'Hour : Minute',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Time remaining',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
