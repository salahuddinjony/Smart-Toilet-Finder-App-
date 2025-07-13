import 'package:flutter/material.dart';

class ThanksScreenWidget extends StatelessWidget {
  final String title;
  final String leftsubject1;
  final String leftsubject2;
  final String leftsubject3;
  final String rightsubject1;
  final String rightsubject2;
  final String rightsubject3;
  const ThanksScreenWidget({
    super.key,
    required this.title,
    required this.leftsubject1,
    required this.leftsubject2,
    required this.leftsubject3,
    required this.rightsubject1,
    required this.rightsubject2,
    required this.rightsubject3,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                height: 1.3,
                color: Color(0xFF00C2CB),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leftsubject1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF7F7F7F),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      leftsubject2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF7F7F7F),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      leftsubject3,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.5,
                        color: Color(0xFF7F7F7F),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      rightsubject1,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.3,
                        color: Color(0xFFBA4E4E),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      rightsubject2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.3,
                        color: Color(0xFFBA4E4E),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      rightsubject3,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1.3,
                        color: Color(0xFFBA4E4E),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
