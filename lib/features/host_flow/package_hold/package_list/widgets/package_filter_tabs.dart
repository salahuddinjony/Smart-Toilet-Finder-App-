import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/packages_controller.dart';

class PackageFilterTabs extends StatelessWidget {
  final PackagesHoldController controller;

  const PackageFilterTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GetBuilder<PackagesHoldController>(
        builder: (controller) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterTab('All', 'all', controller, isSmallScreen),
                const SizedBox(width: 12),
                _buildFilterTab(
                  'Pending',
                  'pending',
                  controller,
                  isSmallScreen,
                ),
                const SizedBox(width: 12),
                _buildFilterTab(
                  'Completed',
                  'completed',
                  controller,
                  isSmallScreen,
                ),
                const SizedBox(width: 12),
                _buildFilterTab(
                  'Rejected',
                  'rejected',
                  controller,
                  isSmallScreen,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterTab(
    String title,
    String filter,
    PackagesHoldController controller,
    bool isSmallScreen,
  ) {
    final isSelected = controller.selectedFilter == filter;

    return Container(
      width: 80,
      height: 38,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF00BCD4) : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => controller.setFilter(filter),
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: isSmallScreen ? 13 : 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
