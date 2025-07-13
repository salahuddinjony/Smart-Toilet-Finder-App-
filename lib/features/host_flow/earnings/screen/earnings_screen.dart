import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/custom_elevated_buttons.dart';
import 'package:mrweekes229/features/host_flow/earnings/controller/earnings_controller.dart';
import 'package:mrweekes229/features/host_flow/earnings/widgets/earnings_summary_cards.dart';
import 'package:mrweekes229/features/host_flow/earnings/widgets/revenue_section.dart';
import 'package:mrweekes229/features/host_flow/earnings/widgets/earnings_by_toilet_section.dart';

class EarningsScreen extends StatelessWidget {
  final EarningsController controller = Get.put(EarningsController());

  EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Earnings',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const EarningsSummaryCards(),
            SizedBox(height: 20),
            CustomElevatedButtons(buttonText: "Withdraw"),
            const RevenueSection(),
            const SizedBox(height: 16.0),
            const EarningsByToiletSection(),
          ],
        ),
      ),
    );
  }
}
