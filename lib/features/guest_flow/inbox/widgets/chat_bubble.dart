import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;

  const ChatBubble({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(maxWidth: 298),
      decoration: BoxDecoration(
        color: Color(0XFF00C2CB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: const TextStyle(color: Color(0XFFFFFFFF), fontSize: 17),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: const TextStyle(color: Color(0XffE9E9EB), fontSize: 13),
          ),
        ],
      ),
    );
  }
}
