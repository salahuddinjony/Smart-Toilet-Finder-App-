import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/my_bathroom_controller.dart';

class BathroomFilterTabs extends StatelessWidget {
  final MyBathroomController controller;

  const BathroomFilterTabs({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 500;
    final tabSpacing = isWide ? 32.0 : 12.0;
    final horizontalPadding = isWide ? 24.0 : 8.0;
    final fontSize = isWide ? 18.0 : 14.0;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: horizontalPadding,
      ),
      child: GetBuilder<MyBathroomController>(
        builder: (controller) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterTab('All', 'all', controller, fontSize),
                SizedBox(width: tabSpacing),
                _buildFilterTab('In use', 'in_use', controller, fontSize),
                SizedBox(width: tabSpacing),
                _buildFilterTab('Available', 'available', controller, fontSize),
                SizedBox(width: tabSpacing),
                _buildFilterTab(
                  'Unpublished',
                  'unpublished',
                  controller,
                  fontSize,
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
    MyBathroomController controller,
    double fontSize,
  ) {
    final isSelected = controller.selectedFilter == filter;

    return GestureDetector(
      onTap: () => controller.setFilter(filter),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: fontSize,
          vertical: fontSize * 0.6,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? const Color(0xFFE91E63) : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: isSelected ? const Color(0xFFE91E63) : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
