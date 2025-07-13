// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/amenities_controller.dart';
import '../model/amenity_model.dart';

class AmenityGridBuilder extends StatelessWidget {
  final AmenitiesController controller = Get.put(AmenitiesController());
  final List<AmenityModel> amenities;
  final List<String> selectedAmenities;
  final Function(String) onAmenityToggle;
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;
  final bool useCompactLayout;

  AmenityGridBuilder({
    super.key,
    required this.amenities,
    required this.selectedAmenities,
    required this.onAmenityToggle,
    this.crossAxisCount = 3,
    this.childAspectRatio = 0.8,
    this.spacing = 16,
    required this.useCompactLayout,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final amenity = amenities[index];
        return Obx(() {
          final isSelected = controller.selectedAmenities.contains(amenity.id);
          print('Amenity ${amenity.id}: isSelected = $isSelected');
          return useCompactLayout
              ? CompactAmenityItem(
                key: ValueKey(amenity.id),
                amenity: amenity,
                isSelected: isSelected,
                onTap: () => controller.toggleAmenity(amenity.id),
              )
              : AmenityItem(
                key: ValueKey(amenity.id),
                amenity: amenity,
                isSelected: isSelected,
                onTap: () => controller.toggleAmenity(amenity.id),
              );
        });
      },
    );
  }
}

class AmenityItem extends StatelessWidget {
  final AmenityModel amenity;
  final bool isSelected;
  final VoidCallback onTap;

  const AmenityItem({
    super.key,
    required this.amenity,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Checkbox
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF00BCD4)
                          : const Color(0xFFE57373),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4),
                color:
                    isSelected ? const Color(0xFF00BCD4) : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 14)
                      : null,
            ),

            const SizedBox(height: 12),

            // Icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: amenity.iconBackgroundColor.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(amenity.iconData, width: 24, height: 24),
            ),

            const SizedBox(height: 8),

            // Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                amenity.name,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Alternative compact version
class CompactAmenityItem extends StatelessWidget {
  final AmenityModel amenity;
  final bool isSelected;
  final VoidCallback onTap;

  const CompactAmenityItem({
    super.key,
    required this.amenity,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color(0xFF00BCD4).withValues(alpha: .1)
                  : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF00BCD4) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF00BCD4)
                          : Colors.grey.shade400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(3),
                color:
                    isSelected ? const Color(0xFF00BCD4) : Colors.transparent,
              ),
              child:
                  isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 12)
                      : null,
            ),

            const SizedBox(width: 12),

            // Icon
            Image.asset(amenity.iconData, width: 24, height: 24),

            const SizedBox(width: 8),

            // Label
            Expanded(
              child: Text(
                amenity.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelected
                          ? const Color(0xFF00BCD4)
                          : Colors.grey.shade700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
