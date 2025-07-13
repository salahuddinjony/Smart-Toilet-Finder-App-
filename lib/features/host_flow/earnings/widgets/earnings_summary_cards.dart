import 'package:flutter/material.dart';

class EarningsSummaryCards extends StatelessWidget {
  const EarningsSummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildEarningsCard('\$2543', 'Total Earnings', Colors.green),
        _buildEarningsCard('\$323', 'This Month\'s Earnings', Colors.red),
        _buildEarningsCard('\$120', 'Withdrawable Amount', Colors.grey),
      ],
    );
  }

  Widget _buildEarningsCard(String amount, String title, Color indicatorColor) {
    return Expanded(
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00C2CB),
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                title,
                style: const TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              Container(width: 20.0, height: 2.0, color: indicatorColor),
            ],
          ),
        ),
      ),
    );
  }
}
