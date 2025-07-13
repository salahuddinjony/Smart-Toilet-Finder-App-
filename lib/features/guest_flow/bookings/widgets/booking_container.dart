import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mrweekes229/core/common/widgets/custom_small_button.dart';
import 'package:mrweekes229/features/guest_flow/bookings/screen/toilet_in_use_screen.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Color(0xFFE6F9FA)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: Image.asset(
                    'assets/images/restroom.png',
                    height: 70,
                    width: 70,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Urban Comfort – Private\nBathroom',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        height: 1.2,
                        color: Color(0xFF404040),
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/ratings.png',
                          height: 16,
                          width: 16,
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Color(0xFF404040),
                              height: 1.5,
                              fontSize: 12.0,
                            ),
                            children: [
                              TextSpan(text: '4.5'),
                              TextSpan(
                                text: ' (344)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  height: 1.5,
                                  color: Color(0xFF7F7F7F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFFE6F9FA),
                  ),
                  child: Image.asset(
                    'assets/icons/location.png',
                    height: 16,
                    width: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Remaining time to arrive at the location.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                height: 1.5,
                color: Color(0xFF404040),
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 74,
                  width: 63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: Color(0xFF00C2CB)),
                    color: Color(0xFFE6F9FA),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '09',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Min',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 7),
                Container(
                  height: 74,
                  width: 63,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: Color(0xFF00C2CB)),
                    color: Color(0xFFE6F9FA),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '59',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Sec',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            CustomSmallButton(
              onPressed: () {
                Get.to(ToiletInUseScreen());
              },
              text: 'Start',
            ),
          ],
        ),
      ),
    );
  }
}
