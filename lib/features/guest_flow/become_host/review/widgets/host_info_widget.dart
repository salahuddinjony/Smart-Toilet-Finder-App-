import 'package:flutter/material.dart';

class HostInfoWidget extends StatelessWidget {
  final String hostName;
  final String? hostImage;

  const HostInfoWidget({super.key, required this.hostName, this.hostImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Host Avatar
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:
                hostImage != null
                    ? Image.network(
                      hostImage!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholderAvatar();
                      },
                    )
                    : _buildPlaceholderAvatar(),
          ),
        ),

        const SizedBox(width: 12),

        // Host Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hostName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              'Host',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ],
        ),

        const Spacer(),

        // Availability Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF00BCD4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Availability',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholderAvatar() {
    return Container(
      color: Colors.grey.shade300,
      child: const Icon(Icons.person, color: Colors.grey, size: 24),
    );
  }
}
