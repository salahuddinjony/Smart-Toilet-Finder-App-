import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/bookings/screen/thanks_screen.dart';

import '../../../../core/common/widgets/custom_small_button.dart';

import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/bookings/controller/bookings_controller.dart';

class MoreTimeContainer extends StatelessWidget {
  const MoreTimeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingsController());

    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Need More Time?',
              style: TextStyle(
                color: Color(0xFF404040),
                fontWeight: FontWeight.w600,
                height: 1.2,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 24),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(3, (index) {
                    final times = [
                      {'label': '5 min (\$1)  +'},
                      {'label': '10 min (\$2)  +'},
                      {'label': '15 min (\$3)  +'},
                    ];
                    return Padding(
                      padding: EdgeInsets.only(right: index < 2 ? 12.0 : 0),
                      child: InkWell(
                        onTap: () => controller.selectTime(index),
                        child: Container(
                          height: 36,
                          constraints: BoxConstraints(
                            minWidth: 90,
                            maxWidth: 140,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedTimeIndex.value == index
                                    ? Color(0xFFE6F9FA)
                                    : Color(0xFFECECEC),
                            borderRadius: BorderRadius.circular(66),
                          ),
                          child: Center(
                            child: Text(
                              times[index]['label']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                height: 1.3,
                                color:
                                    controller.selectedTimeIndex.value == index
                                        ? Color(0xFF00C2CB)
                                        : Color(0xFF7F7F7F),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: CustomSmallButton(
                onPressed: () {
                  Get.to(ThanksScreen());
                },
                text: 'Confirm & Pay',
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
