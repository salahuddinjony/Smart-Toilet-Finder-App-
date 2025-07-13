import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/review_continue/review_continue_screen.dart';
import '../controller/restroom_controller/restroom_details_controller.dart';

class BookingBottomBar extends StatelessWidget {
  const BookingBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestroomDetailsController>();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0XFFFFF0F0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            // Price
            Obx(
              () => Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${controller.getTotalPrice()} ',
                            style: const TextStyle(
                              fontSize: 20,
                              height: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF00C2CB),
                            ),
                          ),
                          TextSpan(
                            text: '/${controller.selectedDuration.value} min',
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1.2,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    controller.isShowerSelected.value
                        ? RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' + ',
                                style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                              WidgetSpan(child: SizedBox(width: 4)),
                              TextSpan(
                                text: '\$${controller.showerPrice} ',
                                style: const TextStyle(
                                  fontSize: 18,
                                  height: 1.2,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF00C2CB),
                                ),
                              ),
                              TextSpan(
                                text: '/${controller.additionalItemName}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.2,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),

            // Request Button
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const ReviewContinueScreen());
                },
                child: Container(
                  height: 50,
                  width:
                      MediaQuery.of(context).size.width *
                      0.4, // 40% of screen width
                  decoration: BoxDecoration(
                    color: AppColors.buttonColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Request',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
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
