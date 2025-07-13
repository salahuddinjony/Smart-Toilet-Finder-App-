import 'package:flutter/material.dart';
import '../model/package_model.dart';

class PackageCardWidget extends StatelessWidget {
  final PackageModel package;
  final VoidCallback onTap;

  const PackageCardWidget({
    super.key,
    required this.package,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF8D6E63),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset('assets/icons/smallBox1.png'),
            ),

            const SizedBox(width: 16),

            // Package Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and Status Row
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          package.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Status Badge
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusBackgroundColor(package.status),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _getStatusText(package.status),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: _getStatusTextColor(package.status),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Time Info and Size Row
                  Row(
                    children: [
                      // Time Icon and Text
                      Icon(
                        Icons.schedule,
                        size: 16,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          _getTimeText(package),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),

                      // Package Size
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/smallBox.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            package.size,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusBackgroundColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return const Color(0xFFFFE0B2); // Light orange
      case 'completed':
        return const Color(0xFFE8F5E8); // Light green
      case 'rejected':
        return const Color(0xFFFFEBEE); // Light red
      default:
        return Colors.grey.shade200;
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return const Color(0xFFFF9800); // Orange
      case 'completed':
        return const Color(0xFF4CAF50); // Green
      case 'rejected':
        return const Color(0xFFE57373); // Red
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Pending';
      case 'completed':
        return 'Completed';
      case 'rejected':
        return 'Rejected';
      default:
        return 'Unknown';
    }
  }

  String _getTimeText(PackageModel package) {
    switch (package.status.toLowerCase()) {
      case 'pending':
        return package.eta ?? 'ETA: Not set';
      case 'completed':
        return package.deliveredAt ?? 'Delivered';
      case 'rejected':
        return package.rejectedAt ?? 'Rejected';
      default:
        return 'No time info';
    }
  }
}
