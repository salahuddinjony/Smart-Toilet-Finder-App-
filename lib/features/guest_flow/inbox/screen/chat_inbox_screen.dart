import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mrweekes229/features/guest_flow/inbox/screen/chat_detail_screen.dart';

class ChatInboxScreen extends StatelessWidget {
  const ChatInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Floyd Miles',
        'lastMessage': 'Lorem ipsum dolor sit...',
        'timestamp': DateTime.now().subtract(const Duration(minutes: 5)),
        'unreadCount': 2,
        'avatarColor': Colors.blue,
      },
      {
        'name': 'Samantha Green',
        'lastMessage': 'Consectetur adipiscing elit...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 1)),
        'unreadCount': 0,
        'avatarColor': Colors.green,
      },
      {
        'name': 'Oliver Smith',
        'lastMessage': 'Sed do eiusmod tempor...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.orange,
      },
      {
        'name': 'Isabella Johnson',
        'lastMessage': 'Ut enim ad minim veniam',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.blueGrey,
      },
      {
        'name': 'Liam Brown',
        'lastMessage': 'Quis nostrud exercitation...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.brown,
      },
      {
        'name': 'Mia Wilson',
        'lastMessage': 'Duis aute irure dolor...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.deepOrange,
      },
      {
        'name': 'Noah Garcia',
        'lastMessage': 'In reprehendendrit in voluptate...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.cyan,
      },
      {
        'name': 'Emma Martinez',
        'lastMessage': 'Excepteur sint occaecat',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.grey,
      },
      {
        'name': 'Ava Taylor',
        'lastMessage': 'Laboris nisi ut aliquip...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 1,
        'avatarColor': Colors.pink,
      },
      {
        'name': 'James Anderson',
        'lastMessage': 'Nosturd exercitation ullamco...',
        'timestamp': DateTime.now().subtract(const Duration(hours: 2)),
        'unreadCount': 0,
        'avatarColor': Colors.purple,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: chat['avatarColor'],
              child: Text(
                chat['name'][0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              chat['name'],
              style: TextStyle(
                fontWeight:
                    chat['unreadCount'] > 0
                        ? FontWeight.bold
                        : FontWeight.normal,
              ),
            ),
            subtitle: Text(
              chat['lastMessage'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight:
                    chat['unreadCount'] > 0
                        ? FontWeight.w500
                        : FontWeight.normal,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatTimestamp(chat['timestamp']),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                if (chat['unreadCount'] > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      chat['unreadCount'].toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            onTap: () {
              Get.to(() => ChatDetailScreen());
            },
          );
        },
      ),
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays == 0) {
      return DateFormat('hh:mm a').format(timestamp);
    } else if (difference.inDays < 7) {
      return DateFormat('EEE').format(timestamp);
    } else {
      return DateFormat('MM/dd').format(timestamp);
    }
  }
}
