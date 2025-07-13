import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class LocationInfoWidget extends StatelessWidget {
  final String address;
  final VoidCallback onMapTap;

  const LocationInfoWidget({
    super.key,
    required this.address,
    required this.onMapTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          // Location Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xffBA4E4E),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(IconPath.mapIcon, width: 20, height: 20),
          ),

          const SizedBox(width: 12),

          // Address
          Expanded(
            child: Text(
              address,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          // Map Button
          GestureDetector(
            onTap: onMapTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFE57373),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Map',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.location_on, color: Colors.white, size: 14),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
