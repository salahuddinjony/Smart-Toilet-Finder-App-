import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/package_hold/controller/package_controller.dart';

class PackageWidget extends StatelessWidget {
  const PackageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PackageController());
    final controller = Get.find<PackageController>();

    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: const Color(0xFFECECEC), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Package Holding Time",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.3,
              color: Color(0xFF404040),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Start Time',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF404040),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => TextField(
              readOnly: true, // Prevent keyboard input
              onTap: () => controller.pickTime(context, isStartTime: true),
              decoration: InputDecoration(
                hintText:
                    controller.formattedStartTime.isEmpty
                        ? 'Select start time'
                        : controller.formattedStartTime,
                hintStyle: TextStyle(
                  color:
                      controller.formattedStartTime.isEmpty
                          ? Colors.grey
                          : const Color(0xFF404040),
                  fontWeight:
                      controller.formattedStartTime.isEmpty
                          ? FontWeight.normal
                          : FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFBA4E4E),
                    width: 1.5,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed:
                      () => controller.pickTime(context, isStartTime: true),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFBA4E4E),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'End Time',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.5,
              color: Color(0xFF404040),
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => TextField(
              readOnly: true,
              onTap: () => controller.pickTime(context, isStartTime: false),
              decoration: InputDecoration(
                hintText:
                    controller.formattedEndTime.isEmpty
                        ? 'Select end time'
                        : controller.formattedEndTime,
                hintStyle: TextStyle(
                  color:
                      controller.formattedEndTime.isEmpty
                          ? Colors.grey
                          : const Color(0xFF404040),
                  fontWeight:
                      controller.formattedEndTime.isEmpty
                          ? FontWeight.normal
                          : FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFECECEC),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Color(0xFFBA4E4E),
                    width: 1.5,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed:
                      () => controller.pickTime(context, isStartTime: false),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFBA4E4E),
                  ),
                ),
              ),
            ),
          ),
          Obx(
            () =>
                controller.errorMessage.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        controller.errorMessage.value,
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
