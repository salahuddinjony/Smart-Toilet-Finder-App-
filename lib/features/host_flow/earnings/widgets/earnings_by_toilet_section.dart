import 'package:flutter/material.dart';
import 'toilet_earnings_item.dart';

class EarningsByToiletSection extends StatelessWidget {
  const EarningsByToiletSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Earnings By Bathroom',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16.0),

        ToiletEarningsItem(
          imageUrl: 'assets/images/image1.png',
          title: 'Urban Comfort',
          location: 'Central Station, Downtown, New York',
          totalEarnings: '\$2543',
          monthlyEarnings: '\$323',
          withdrawableAmount: '\$120',
        ),
        ToiletEarningsItem(
          imageUrl: 'assets/images/image1.png',
          title: 'Downtown Delight',
          location: 'Arts District, City Center, New York',
          totalEarnings: '\$1800',
          monthlyEarnings: '\$210',
          withdrawableAmount: '\$80',
        ),
      ],
    );
  }
}
