import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mrweekes229/features/guest_flow/inbox/screen/chat_inbox_screen.dart';

class DirectMessageButton extends StatelessWidget {
  const DirectMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.to(ChatInboxScreen());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff00C2CB),
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          'Inbox',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
