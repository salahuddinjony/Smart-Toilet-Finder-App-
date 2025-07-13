import 'package:flutter/material.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/custom_elevated_buttons.dart';

class ToiletEarningsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;

  final String totalEarnings;
  final String monthlyEarnings;
  final String withdrawableAmount;

  const ToiletEarningsItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.totalEarnings,
    required this.monthlyEarnings,
    required this.withdrawableAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        leading: Container(
          width: 50,
          height: 50,
          color: Colors.grey[300],
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.broken_image),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(location),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildEarningsCard(
                      totalEarnings,
                      'Total Earnings',
                      Colors.green,
                    ),
                    _buildEarningsCard(
                      monthlyEarnings,
                      'This Month\'s Earnings',
                      Colors.red,
                    ),
                    _buildEarningsCard(
                      withdrawableAmount,
                      'Withdrawable Amount',
                      Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButtons(buttonText: "Withdraw"),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsCard(String amount, String title, Color indicatorColor) {
    return Expanded(
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00C2CB),
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                title,
                style: const TextStyle(fontSize: 10.0, color: Colors.grey),
              ),
              const SizedBox(height: 4.0),
              Container(width: 15.0, height: 1.5, color: indicatorColor),
            ],
          ),
        ),
      ),
    );
  }
}
