import 'package:flutter/material.dart';

class PackageInfoDetails extends StatelessWidget {
  const PackageInfoDetails({super.key});

  Widget _buildInfoRow(
    String imagePath,
    String title,
    String details,
    Color? detailsTextColor,
  ) {
    return Row(
      children: [
        Image.asset(imagePath, height: 40, width: 40),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color(0xFF404040),
              ),
            ),
            Text(
              details,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: detailsTextColor ?? Color(0xFF666666),
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Color(0xFFECECEC)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Package Information',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Color(0xFF404040),
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow(
              'assets/icons/location.png',
              'Delivery Location',
              'Central Station, Downtown, New York',
              null,
            ),
            SizedBox(height: 20),
            _buildInfoRow(
              'assets/icons/time.png',
              'Estimated Delivery',
              '4 June, 2025      3:00Pm - 6:00Pm',
              null,
            ),
            SizedBox(height: 20),
            _buildInfoRow(
              'assets/icons/package1.png',
              'Package Size',
              'Medium',
              null,
            ),
            SizedBox(height: 20),
            _buildInfoRow(
              'assets/icons/file.png',
              'Special Instructions',
              'Please handle with care.\nContainsdelicate itemsthat\nmay break easily.',
              Color(0xFFEA580C),
            ),
          ],
        ),
      ),
    );
  }
}
