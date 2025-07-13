import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/inbox/screen/chat_inbox_screen.dart';

class DmButton extends StatelessWidget {
  const DmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          Get.to(() => ChatInboxScreen());
        },
        child: Container(
          height: 50,
          width: 361,
          decoration: BoxDecoration(
            color: Color(0XFF00C2CB),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'Inbox',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
