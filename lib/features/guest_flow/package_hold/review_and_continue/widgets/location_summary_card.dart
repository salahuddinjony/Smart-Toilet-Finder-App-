import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class LocationSummaryCard extends StatelessWidget {
  const LocationSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF00BCD4).withValues(alpha: .1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(IconPath.mapIcon),
          ),

          const SizedBox(width: 16),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Central Station,',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Downtown, New York',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Color(0XFFFFF0F0),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 6.0,
                    bottom: 6,
                    left: 12,
                    right: 36,
                  ),
                  child: Text(
                    "Map",
                    style: TextStyle(
                      color: Color(0xFFBA4E4E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.location_pin, color: Color(0xFFBA4E4E), size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
