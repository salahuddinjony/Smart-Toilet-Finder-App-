import 'package:flutter/material.dart';

import '../../../../../core/utils/constants/icon_path.dart';

class AmenityModel {
  final String id;
  final String name;
  final String iconData;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String category;

  AmenityModel({
    required this.id,
    required this.name,
    required this.iconData,
    required this.iconColor,
    required this.iconBackgroundColor,
    this.category = 'general',
  });
}

// Predefined amenities list
class AmenityData {
  static List<AmenityModel> getDefaultAmenities() {
    return [
      // Row 1
      AmenityModel(
        id: 'toilet_paper',
        name: 'Toilet paper',
        iconData: IconPath.toiletPaperIcon,
        iconColor: const Color(0xFF00BCD4),
        iconBackgroundColor: const Color(0xFF00BCD4),
        category: 'basic',
      ),
      AmenityModel(
        id: 'hand_wash',
        name: 'Hand Wash',
        iconData: IconPath.handWashIcon,
        iconColor: const Color(0xFF2196F3),
        iconBackgroundColor: const Color(0xFF2196F3),
        category: 'hygiene',
      ),
      AmenityModel(
        id: 'mirror',
        name: 'Mirror',
        iconData: IconPath.mirrorIcon,
        iconColor: const Color(0xFF00BCD4),
        iconBackgroundColor: const Color(0xFF00BCD4),
        category: 'basic',
      ),

      // Row 2
      AmenityModel(
        id: 'shower',
        name: 'Shower',
        iconData: IconPath.showerIcon,
        iconColor: const Color(0xFF4CAF50),
        iconBackgroundColor: const Color(0xFF4CAF50),
        category: 'facilities',
      ),
      AmenityModel(
        id: 'accessible',
        name: 'Accessible',
        iconData: IconPath.accessibleIcon,
        iconColor: const Color(0xFF9C27B0),
        iconBackgroundColor: const Color(0xFF9C27B0),
        category: 'accessibility',
      ),
      AmenityModel(
        id: 'lockable',
        name: 'Lockable',
        iconData: IconPath.lockableIcon,
        iconColor: const Color(0xFFFF9800),
        iconBackgroundColor: const Color(0xFFFF9800),
        category: 'security',
      ),

      // Row 3
      AmenityModel(
        id: 'music',
        name: 'Music',
        iconData: IconPath.musicIcon,
        iconColor: const Color(0xFFE91E63),
        iconBackgroundColor: const Color(0xFFE91E63),
        category: 'entertainment',
      ),
      AmenityModel(
        id: 'aromatherapy',
        name: 'Aromatherapy',
        iconData: IconPath.aromatherapyIcon,
        iconColor: const Color(0xFFFF5722),
        iconBackgroundColor: const Color(0xFFFF5722),
        category: 'wellness',
      ),
      AmenityModel(
        id: 'razors',
        name: 'Razors',
        iconData: IconPath.razorsIcon,
        iconColor: const Color(0xFF00BCD4),
        iconBackgroundColor: const Color(0xFF00BCD4),
        category: 'grooming',
      ),

      // Row 4
      AmenityModel(
        id: 'baby_changing',
        name: 'Baby Changing Station',
        iconData: IconPath.babyChangingStationIcon,
        iconColor: const Color(0xFFFF9800),
        iconBackgroundColor: const Color(0xFFFF9800),
        category: 'family',
      ),
      AmenityModel(
        id: 'hair_dryer',
        name: 'Hair Dryer',
        iconData: IconPath.hairDryerIcon,
        iconColor: const Color(0xFFE91E63),
        iconBackgroundColor: const Color(0xFFE91E63),
        category: 'grooming',
      ),
      AmenityModel(
        id: 'feminine_product',
        name: 'Feminine Product',
        iconData: IconPath.feminineProductIcon,
        iconColor: const Color(0xFF00BCD4),
        iconBackgroundColor: const Color(0xFF00BCD4),
        category: 'hygiene',
      ),

      // Row 5
      AmenityModel(
        id: 'air_dryer',
        name: 'Air Dryer',
        iconData: IconPath.airDryerIcon,
        iconColor: const Color(0xFF795548),
        iconBackgroundColor: const Color(0xFF795548),
        category: 'facilities',
      ),
      AmenityModel(
        id: 'trash_can',
        name: 'Trash Can',
        iconData: IconPath.trashCanIcon,
        iconColor: const Color(0xFF4CAF50),
        iconBackgroundColor: const Color(0xFF4CAF50),
        category: 'basic',
      ),
      AmenityModel(
        id: 'deodorant_spray',
        name: 'Deodorant Spray',
        iconData: IconPath.deodorantSprayIcon,
        iconColor: const Color(0xFF00BCD4),
        iconBackgroundColor: const Color(0xFF00BCD4),
        category: 'hygiene',
      ),

      // Row 6
      AmenityModel(
        id: 'lotions',
        name: 'Lotions',
        iconData: IconPath.lotionsIcon,
        iconColor: const Color(0xFFFF9800),
        iconBackgroundColor: const Color(0xFFFF9800),
        category: 'skincare',
      ),
      AmenityModel(
        id: 'lint_roller',
        name: 'Lint Roller',
        iconData: IconPath.lintRollerIcon,
        iconColor: const Color(0xFFFF5722),
        iconBackgroundColor: const Color(0xFFFF5722),
        category: 'grooming',
      ),
      AmenityModel(
        id: 'bidet_toilet',
        name: 'Bidet Toilet',
        iconData: IconPath.bidetToiletIcon,
        iconColor: const Color(0xFF2196F3),
        iconBackgroundColor: const Color(0xFF2196F3),
        category: 'facilities',
      ),
    ];
  }

  // Get amenities by category
  static List<AmenityModel> getAmenitiesByCategory(String category) {
    return getDefaultAmenities()
        .where((amenity) => amenity.category == category)
        .toList();
  }

  // Get all categories
  static List<String> getAllCategories() {
    return getDefaultAmenities()
        .map((amenity) => amenity.category)
        .toSet()
        .toList();
  }
}
