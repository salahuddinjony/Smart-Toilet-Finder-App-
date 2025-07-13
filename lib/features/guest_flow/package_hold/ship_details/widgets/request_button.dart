import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ship_details_controller.dart';

class RequestButton extends StatelessWidget {
  final ShipDetailsController controller;

  const RequestButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: GetBuilder<ShipDetailsController>(
        builder: (controller) {
          return Row(
            children: [
              // Price Display
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    controller.getTotalPrice(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF00BCD4),
                    ),
                  ),
                  Text(
                    '/${controller.getSizeText()}',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ],
              ),

              const SizedBox(width: 20),

              // Request Button
              Expanded(
                child: GestureDetector(
                  onTap:
                      controller.isRequestEnabled
                          ? () => controller.submitRequest()
                          : null,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      color:
                          controller.isRequestEnabled
                              ? const Color(0xFFE57373)
                              : Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child:
                          controller.isSubmitting
                              ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              )
                              : const Text(
                                'Request',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
