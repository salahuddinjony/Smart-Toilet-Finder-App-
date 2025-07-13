import 'package:flutter/material.dart';

class PricingWidget extends StatelessWidget {
  const PricingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Color(0xFFECECEC)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pricing Per Package Size',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildPackageRow(
              'Small (up to 500ml / 500g / under 30cm)',
              Icons.local_shipping,
              25.0,
              25.0,
            ),
            _buildPackageRow(
              'Medium (500ml–2L / 500g–2kg / up to 50cm)',
              Icons.local_shipping,
              25.0,
              25.0,
            ),
            _buildPackageRow(
              'Large (Over 2L or 2kg / over 50cm)',
              Icons.local_shipping,
              25.0,
              25.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageRow(
    String text,
    IconData icon,
    double height,
    double width,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/smallBox1.png',
            height: height,
            width: width,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
          ),
          Text('\$   ', style: TextStyle(fontSize: 20)),
          Container(
            width: 62,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFC4C4C4)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
