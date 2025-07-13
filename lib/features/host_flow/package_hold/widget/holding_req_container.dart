import 'package:flutter/material.dart';

class HoldingReqContainer extends StatelessWidget {
  final String heading;
  final String name;
  final String title;
  final String size;

  const HoldingReqContainer({
    super.key,
    required this.heading,
    required this.name,
    required this.title,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: .2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xFF8E6459),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'assets/icons/box.png',
                    height: 16,
                    width: 16,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    heading,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      color: Color(0xFF404040),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Image.asset('assets/icons/man.png', height: 37, width: 37),
                SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF404040),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/smallBox.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      size,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF404040),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.access_time, color: Colors.grey),
                SizedBox(width: 12.0),
                Text(
                  'ETA: 5 June, 2025  3:00pm-6:00pm',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                Spacer(),
                Container(
                  height: 32,
                  width: 32,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(33),
                  ),
                  child: Center(
                    child: Icon(Icons.arrow_forward, color: Color(0xFFBA4E4E)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
