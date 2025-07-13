import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class ToiletLocationWidget extends StatelessWidget {
  const ToiletLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(IconPath.editIcon, width: 30, height: 30),
              ),
            ),

            Row(
              children: [
                // Location Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BCD4).withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(IconPath.mapIcon, fit: BoxFit.cover),
                ),

                const SizedBox(width: 12),

                // Location Text
                const Expanded(
                  child: Text(
                    'Central Station,\nDowntown, New York',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF2D3748),
                      height: 1.3,
                    ),
                  ),
                ),

                // Map Button and Icon
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
                          right: 16,
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
                      Icon(
                        Icons.location_pin,
                        color: Color(0xFFBA4E4E),
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
