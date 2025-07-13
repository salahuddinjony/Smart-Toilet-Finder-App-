import 'package:flutter/material.dart';

class HostInfoWidget extends StatelessWidget {
  const HostInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Host Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const SizedBox(width: 12),

        // Host Info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Alex Tran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Host',
                style: TextStyle(fontSize: 14, color: Color(0xFF718096)),
              ),
            ],
          ),
        ),

        // Rating
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFFA726), size: 16),
            const SizedBox(width: 4),
            const Text(
              '4.5',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
              ),
            ),
            Text(
              ' (344)',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),
      ],
    );
  }
}
