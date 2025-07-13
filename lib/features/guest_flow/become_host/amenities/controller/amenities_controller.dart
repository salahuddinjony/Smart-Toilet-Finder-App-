import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/availability/screen/availability_screen.dart';
import '../model/amenity_model.dart';

class AmenitiesController extends GetxController {
  // Observable lists
  RxList<AmenityModel> amenities = <AmenityModel>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;

  // Categories
  RxString selectedCategory = 'all'.obs;
  RxList<String> categories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAmenities();
    loadCategories();
  }

  void loadAmenities() {
    amenities.value = AmenityData.getDefaultAmenities();
  }

  void loadCategories() {
    categories.value = ['all', ...AmenityData.getAllCategories()];
  }

  // Method to toggle an amenity
  void toggleAmenity(String amenityId) {
    if (selectedAmenities.contains(amenityId)) {
      selectedAmenities.remove(amenityId);
    } else {
      selectedAmenities.add(amenityId);
    }
  }

  void selectAllAmenities() {
    selectedAmenities.value = amenities.map((amenity) => amenity.id).toList();
  }

  void clearAllAmenities() {
    selectedAmenities.clear();
  }

  void filterByCategory(String category) {
    selectedCategory.value = category;
    if (category == 'all') {
      amenities.value = AmenityData.getDefaultAmenities();
    } else {
      amenities.value = AmenityData.getAmenitiesByCategory(category);
    }
  }

  // Add custom amenity
  void addCustomAmenity(AmenityModel amenity) {
    amenities.add(amenity);
  }

  // Remove amenity
  void removeAmenity(String amenityId) {
    amenities.removeWhere((amenity) => amenity.id == amenityId);
    selectedAmenities.remove(amenityId);
  }

  // Get selected amenity objects
  List<AmenityModel> get selectedAmenityObjects {
    return amenities
        .where((amenity) => selectedAmenities.contains(amenity.id))
        .toList();
  }

  // Validation
  bool get hasSelectedAmenities => selectedAmenities.isNotEmpty;

  String get selectionSummary {
    if (selectedAmenities.isEmpty) {
      return 'No amenities selected';
    }
    return '${selectedAmenities.length} amenities selected';
  }

  void goToNextStep() {
    Get.snackbar(
      'Amenities Selected',
      '${selectedAmenities.length} amenities selected',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Navigate to next screen
    Get.to(() => AvailabilityScreen());
  }
}
