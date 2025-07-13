import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/restroom_controller/restroom_details_controller.dart';

class ShowerOptionWidget extends StatelessWidget {
  const ShowerOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestroomDetailsController>();

    return Obx(
      () => Row(
        children: [
          // Checkbox
          GestureDetector(
            onTap: () => controller.toggleShower(),
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color:
                    controller.isShowerSelected.value
                        ? const Color(0xFF00BCD4)
                        : Colors.transparent,
                border: Border.all(
                  color:
                      controller.isShowerSelected.value
                          ? const Color(0xFF00BCD4)
                          : Colors.grey.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child:
                  controller.isShowerSelected.value
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : null,
            ),
          ),

          const SizedBox(width: 12),

          // Shower Text
          const Expanded(
            child: Text(
              'Shower ( + \$1 ) ( +10 min)',
              style: TextStyle(
                fontSize: 12,
                height: 1.30,
                color: Color(0xFF404040),
              ),
            ),
          ),

          // Price
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE53E3E)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              width: 74,
              height: 32,
              decoration: BoxDecoration(
                color: const Color(0xFFFDEDED),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: const Text(
                  '\$3.5',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                    color: Color(0xFFBA4E4E),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
