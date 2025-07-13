// ignore_for_file: library_prefixes

import 'dart:math' as Math;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/host_flow/bookings/controller/all_booking_controller.dart';

class GraphHomeChartWidget extends StatelessWidget {
  final Booking booking;
  final double heigth;
  final double width;

  const GraphHomeChartWidget({
    super.key,
    required this.booking,
    required this.width,
    required this.heigth,
  });

  int _getTotalMinutes(String time) {
    final parts = time.split(':');
    if (parts.length != 2) return 0;
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return hour * 60 + minute;
  }

  String _getRemainingTime() {
    if (booking.startTime == null || booking.endTime == null) return '--:--';

    try {
      final startTotalMinutes = _getTotalMinutes(booking.startTime!);
      final endTotalMinutes = _getTotalMinutes(booking.endTime!);

      final totalMinutes = endTotalMinutes - startTotalMinutes;
      if (totalMinutes <= 0) return '--:--';

      final hours = (totalMinutes ~/ 60).toString().padLeft(2, '0');
      final minutes = (totalMinutes % 60).toString().padLeft(2, '0');
      return '$hours:$minutes';
    } catch (e) {
      return '--:--';
    }
  }

  double _calculatePercentage() {
    if (booking.startTime == null || booking.endTime == null) return 0;

    try {
      final startTotalMinutes = _getTotalMinutes(booking.startTime!);
      final endTotalMinutes = _getTotalMinutes(booking.endTime!);

      final totalDuration = endTotalMinutes - startTotalMinutes;
      if (totalDuration <= 0) return 0;
      return (totalDuration / 60) * 100;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage =
        _calculatePercentage() + (Math.Random().nextDouble() * 30);
    final remainingTime = _getRemainingTime();

    return SizedBox(
      width: width,
      height: heigth,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 60,
              sections: [
                PieChartSectionData(
                  color: const Color(0xff00C2CB),
                  value: percentage,
                  radius: 20,
                  showTitle: false,
                ),
                PieChartSectionData(
                  color: const Color(0xffE6F9FA),
                  value: 100 - percentage,
                  radius: 20,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                remainingTime,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Left',
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
