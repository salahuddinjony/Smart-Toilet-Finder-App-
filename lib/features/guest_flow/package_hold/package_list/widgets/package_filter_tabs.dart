import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/packages_controller.dart';

class PackageFilterTabs extends StatelessWidget {
  final PackagesController controller;

  const PackageFilterTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GetBuilder<PackagesController>(
        builder: (controller) {
          return Row(
            children: [
              _buildFilterTab('All', 'all', controller),
              const SizedBox(width: 12),
              _buildFilterTab('Pending', 'pending', controller),
              const SizedBox(width: 12),
              _buildFilterTab('Completed', 'completed', controller),
              const SizedBox(width: 12),
              _buildFilterTab('Rejected', 'rejected', controller),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterTab(
    String title,
    String filter,
    PackagesController controller,
  ) {
    final isSelected = controller.selectedFilter == filter;

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = 14;
          double height = 40;
          if (constraints.maxWidth < 350) {
            fontSize = 12;
            height = 32;
          } else if (constraints.maxWidth > 500) {
            fontSize = 16;
            height = 48;
          }
          return GestureDetector(
            onTap: () => controller.setFilter(filter),
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color:
                    isSelected ? const Color(0xFF00BCD4) : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
