import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/host_flow/earnings/controller/earnings_controller.dart';
import 'package:mrweekes229/features/host_flow/toilets/widgets/pricing_card.dart';
import 'package:mrweekes229/features/host_flow/toilets/widgets/toilet_availibility_widget.dart';

import '../../../guest_flow/restrooom_details/widgets/amenities_grid_widget.dart';
import '../../../guest_flow/restrooom_details/widgets/reviews_section_widget.dart';

import '../../earnings/widgets/revenue_section.dart';
import '../widgets/location_widget.dart';

class LiveSessionScreen extends StatefulWidget {
  const LiveSessionScreen({super.key});

  @override
  State<LiveSessionScreen> createState() => _LiveSessionScreenState();
}

class _LiveSessionScreenState extends State<LiveSessionScreen> {
  @override
  void initState() {
    super.initState();

    if (!Get.isRegistered<EarningsController>()) {
      Get.lazyPut(() => EarningsController());
    }
  }

  @override
  void dispose() {
    if (Get.isRegistered<EarningsController>()) {
      Get.delete<EarningsController>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9F9F9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Urban Comfort',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ImagePath.restroom,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lorem ipsum dolor sit amet consectetur. Odio libero sed egestas sit. Bibendum a amet cursus imperdiet enim. Vel cursus tellus mauris enim eu. Ut ac faucibus dictum et urna mauris natoque.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF404040),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ToiletLocationWidget(),
                const SizedBox(height: 20),
                ToiletAvailabilityWidget(),
                const SizedBox(height: 20),
                const PricingCardWidget(),
                const SizedBox(height: 20),
                AmenitiesGridWidget(),
                const SizedBox(height: 20),
                const RevenueSection(),
                const SizedBox(height: 20),
                const ReviewsSectionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
