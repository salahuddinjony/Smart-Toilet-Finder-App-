import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/inbox/widgets/chat_bubble.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          width: 393,
          height: 118,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0XFF00C2CB)),
          ),
          child: AppBar(
            backgroundColor: Color(0XFFE6F9FA),
            elevation: 1,
            leadingWidth: 88,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  iconSize: 18, // Smaller icon size
                  padding: EdgeInsets.zero, // Remove default padding
                  onPressed: () => Get.back(),
                ),
                const CircleAvatar(
                  radius: 20, // Smaller avatar to fit better
                  backgroundImage: NetworkImage(
                    'https://i.pravatar.cc/150?img=5',
                  ),
                ),
              ],
            ),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Samantha Green',
                  style: TextStyle(
                    color: Color(0XFF333333),
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Color(0xFF008D36),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.2,
                  ),
                ),
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.more_vert, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true, // Newest messages at bottom
              padding: const EdgeInsets.all(12),
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: ChatBubble(
                    message: "Hello! It's great to meet you!",
                    time: "14:40",
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ChatBubble(
                    message:
                        "Hey, I'm Alex! Today, I'm excited to guide you in discovering the ideal Webflow Template for your needs! 👨‍🏫",
                    time: "14:40",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Color(0XFFC4C4C4),
                        hintText: 'Type Message',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                Icon(Icons.send, color: Color(0XFF00C2CB)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
