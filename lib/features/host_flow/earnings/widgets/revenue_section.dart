import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart'; // Import Get for accessing the controller
import 'package:mrweekes229/features/host_flow/earnings/controller/earnings_controller.dart'; // Import the controller

class RevenueSection extends StatelessWidget {
  const RevenueSection({super.key});

  @override
  Widget build(BuildContext context) {
    final EarningsController controller =
        Get.find<EarningsController>(); // Get the controller instance

    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Revenue',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              // Use Obx to react to changes in selectedTimePeriod
              Obx(
                () => PopupMenuButton<String>(
                  initialValue: controller.selectedTimePeriod.value,
                  onSelected: (String item) {
                    controller.selectTimePeriod(item);
                  },
                  itemBuilder: (BuildContext context) {
                    return controller.timePeriodOptions.map((String option) {
                      return PopupMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          controller
                              .selectedTimePeriod
                              .value, // Display selected period
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const Icon(Icons.arrow_drop_down, size: 16.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Earning',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
              const Text(
                '\$256.75', // Placeholder value - update with dynamic data later
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff00C2CB), // Adjust color as needed
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 150,
            child: LineChart(
              LineChartData(
                // Placeholder data for the chart - update with dynamic data later
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 0),
                      FlSpot(1, 20),
                      FlSpot(2, 50),
                      FlSpot(3, 80),
                      FlSpot(4, 60),
                      FlSpot(5, 60),
                      FlSpot(6, 90),
                    ], // Sample data points
                    isCurved: true,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffff6b6b).withValues(alpha: 0.5),
                        const Color(0xffff6b6b).withValues(alpha: 0),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xffff6b6b).withValues(alpha: 0.5),
                          const Color(0xffff6b6b).withValues(alpha: 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          _buildRevenueDetailRow(
            'Base Revenue',
            '\$327',
          ), // Placeholder values - update with dynamic data later
          _buildRevenueDetailRow(
            'Extra Time Fees',
            '\$245',
          ), // Placeholder values - update with dynamic data later
          _buildRevenueDetailRow(
            'Platform Fees (10%)',
            '\$56',
          ), // Placeholder values - update with dynamic data later
          const Divider(height: 32.0), // Separator before Net Earnings
          _buildRevenueDetailRow(
            'Net Earnings',
            '\$677',
            isBold: true,
          ), // Placeholder values - update with dynamic data later
        ],
      ),
    );
  }

  Widget _buildRevenueDetailRow(
    String label,
    String value, {
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              color: isBold ? Colors.black : Colors.grey,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              color: isBold ? const Color(0xff00C2CB) : Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
