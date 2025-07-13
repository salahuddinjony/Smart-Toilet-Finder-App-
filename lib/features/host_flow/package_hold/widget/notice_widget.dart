import 'package:flutter/material.dart';

class NoticeWidget extends StatelessWidget {
  const NoticeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 243, 215),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Color(0xFFFFB400)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '⚠️   Important Notice',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1.3,
              color: Color(0xFFBE8909),
            ),
          ),
          SizedBox(height: 13.5),
          Text(
            'By activating this service, you agree to accept responsibility for the package during the holding period. Platform may deduct a fixed penalty for lost items',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.5,
              color: Color(0xFFBE8909),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
