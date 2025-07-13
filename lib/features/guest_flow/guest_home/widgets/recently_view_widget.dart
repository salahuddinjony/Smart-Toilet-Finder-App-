import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/ship_details/screen/ship_details_screen.dart';
import '../controller/guest_home_controller.dart';
import 'toilet_list_card.dart';

Widget buildRecentlyViewedSection(
  String title,
  ScrollController scrollController,
) {
  return GetBuilder<GuestHomeController>(
    init: GuestHomeController(),
    builder: (controller) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF404040),
                ),
              ),

              const SizedBox(height: 8),
              Expanded(
                child:
                    controller.recentlyViewedToilets.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconPath.notFoundIcon,
                                height: 120,
                                width: 120,
                              ),
                              const SizedBox(height: 24),
                              const Text(
                                'You haven\'t viewed anything yet',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                        : Obx(
                          () => ListView.builder(
                            controller: scrollController,
                            itemCount: controller.recentlyViewedToilets.length,
                            itemBuilder: (context, index) {
                              final toilet =
                                  controller.recentlyViewedToilets[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),

                                child: GestureDetector(
                                  onTap: () {
                                    title == 'Nearby Bathrooms'
                                        ? Get.to(
                                          ShipDetailsScreen(toilet: toilet),
                                        )
                                        : controller.navigateToToiletDetails(
                                          toilet,
                                        );
                                  },

                                  child: ToiletListCard(
                                    toiletName: toilet.toiletName,
                                    toiletAddress: toilet.toiletAddress,
                                    toiletRating: toilet.toiletRating,
                                    price: toilet.price,
                                    imageUrl: toilet.imageUrl,
                                    isSmallScreen:
                                        MediaQuery.of(context).size.width < 600,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
