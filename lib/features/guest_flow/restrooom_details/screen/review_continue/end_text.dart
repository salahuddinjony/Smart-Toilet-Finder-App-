import 'package:flutter/material.dart';

class EndText extends StatelessWidget {
  const EndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Color(0XFFFFF0F0)),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          "Just a heads up, make sure to arrive within 30 minutes after you book!",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xFFBA4E4E),
          ),
        ),
      ),
    );
  }
}
