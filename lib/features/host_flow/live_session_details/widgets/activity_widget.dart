import 'package:flutter/material.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activity',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.5,
            color: Color(0xff00C2CB),
          ),
        ),
        SizedBox(height: 22),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.timer_outlined, size: 16, color: Color(0xff00C2CB)),
                SizedBox(width: 4),
                Text(
                  'Session Starts at 2:00 pm',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0XFF7F7F7F),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.payment_outlined,
                  size: 16,
                  color: Color(0xff00C2CB),
                ),
                SizedBox(width: 4),
                Text(
                  'Payment Confirmed (\$5.00)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    color: Color(0XFF7F7F7F),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
