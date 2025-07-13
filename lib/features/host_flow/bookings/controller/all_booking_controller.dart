import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bookings/widgets/graph_chart_widget.dart';

class Booking {
  final String? imagePath;
  final String? title;
  final String? date;
  final String? time;
  final String userName;
  final String status;
  final String? price;

  final String? timeLeft;
  final String? startTime;
  final String? endTime;
  final String? amountPaid;
  final String? currentEarnings;
  final List<String>? activity;

  Booking({
    this.imagePath,
    this.title,
    this.date,
    this.time,
    required this.userName,
    required this.status,
    this.price,
    this.timeLeft,
    this.startTime,
    this.endTime,
    this.amountPaid,
    this.currentEarnings,
    this.activity,
  });
}

class AllBookingController extends GetxController {
  final searchController = TextEditingController();
  final RxList<Booking> bookings = <Booking>[].obs;

  List<Color> statusColor = [
    Colors.amber,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  Widget getStatusWidget(Booking booking) {
    switch (booking.status.toLowerCase()) {
      case 'ongoing':
        return GraphChartWidget(booking: booking, width: 120, heigth: 120);
      case 'canceled':
        return Image.asset(
          'assets/images/canceled.png',
          height: 100,
          width: 100,
        );
      case 'completed':
        return Image.asset(
          'assets/images/completed.png',
          height: 100,
          width: 100,
        );
      case 'upcoming':
        return Image.asset(
          'assets/images/upcoming.png',
          height: 100,
          width: 100,
        );
      default:
        return const SizedBox();
    }
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'ongoing':
        return statusColor[0];
      case 'canceled':
        return statusColor[1];
      case 'completed':
        return statusColor[2];
      case 'upcoming':
        return statusColor[3];
      default:
        return Colors.grey.withValues(alpha: 0.4);
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Sample data
    bookings.assignAll([
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 24",
        time: " --",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Ongoing",
        startTime: "14:30",
        endTime: "14:45",
        timeLeft: "10:00",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 24",
        time: "--",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Canceled",
        startTime: "15:00",
        endTime: "15:15",
        timeLeft: "--:--",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 24",
        time: "--",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Completed",
        startTime: "14:30",
        endTime: "14:45",
        timeLeft: "00:00",
        activity: [
          "Booking confirmed",
          "User arrived at location",
          "Session started",
          "Session completed",
          "Payment processed",
        ],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 24",
        time: "--",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Upcoming",
        startTime: "16:00",
        endTime: "16:15",
        timeLeft: "--:--",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 25",
        time: " --",
        userName: "Jerome Bell",
        price: "\$20",
        status: "Ongoing",
        startTime: "14:00",
        endTime: "14:15",
        timeLeft: "05:30",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 25",
        time: "--",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Canceled",
        startTime: "15:00",
        endTime: "15:15",
        timeLeft: "--:--",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
      Booking(
        imagePath: "assets/images/image1.png",
        title: "Urban Comfort",
        date: "May 25",
        time: "--",
        userName: "Jerome Bell",
        price: "\$15",
        status: "Canceled",
        startTime: "16:00",
        endTime: "16:15",
        timeLeft: "--:--",
        activity: ["Session Starts at ", "Payment Confirmed "],
      ),
    ]);
  }
}
