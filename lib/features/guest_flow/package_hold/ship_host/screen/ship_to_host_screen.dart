import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/widgets/recently_view_widget.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/ship_host/widgets/map_view_widgets.dart';

class ShipToHostScreen extends StatelessWidget {
  ShipToHostScreen({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildHeader(),
              SizedBox(height: 30),
              const Text(
                'Select Host Nearby',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 20),
              mapViewWidget(),
              SizedBox(height: 20),
              Expanded(
                child: buildRecentlyViewedSection(
                  'Nearby Bathrooms',
                  scrollController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHeader() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
        ),

        const Spacer(),

        const Text(
          'Ship to Host',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF404040),
          ),
        ),

        const Spacer(),

        const SizedBox(width: 40),
      ],
    ),
  );
}
