import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/map_home_controller.dart';
import '../../guest_home/widgets/toilet_list_card.dart';

class BottomSheetWidget extends StatelessWidget {
  final MapHomeController controller;

  const BottomSheetWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.9,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15, top: 8),
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Color(0xFF00C2CB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                Text(
                  'Nearby Bathrooms',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.recentlyViewedToilets.length,
                  itemBuilder: (context, index) {
                    final toilet = controller.recentlyViewedToilets[index];
                    return InkWell(
                      onTap: () {
                        Get.back();
                        controller.showToiletCard(toilet);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: ToiletListCard(
                          toiletName: toilet.toiletName,
                          toiletAddress: toilet.toiletAddress,
                          toiletRating: toilet.toiletRating,
                          price: toilet.price,
                          imageUrl: toilet.imageUrl,
                          isSmallScreen: false,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
