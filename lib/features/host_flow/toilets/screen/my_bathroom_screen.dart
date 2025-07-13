import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_bathroom_controller.dart';
import '../widgets/bathroom_filter_tabs.dart';
import '../widgets/bathroom_listing_card.dart';

class MyBathroomScreen extends StatelessWidget {
  const MyBathroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBathroomController());

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'My Bathroom',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          BathroomFilterTabs(controller: controller),

          const SizedBox(height: 20),

          Expanded(
            child: GetBuilder<MyBathroomController>(
              builder: (controller) {
                final filteredBathrooms = controller.getFilteredBathrooms();

                if (filteredBathrooms.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bathroom_outlined,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No bathrooms found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredBathrooms.length,
                  itemBuilder: (context, index) {
                    final bathroom = filteredBathrooms[index];
                    return BathroomListingCard(
                      bathroom: bathroom,
                      onMenuTap: () => controller.showMenuOptions(bathroom),
                      onCardTap: () => controller.navigateToDetails(bathroom),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
