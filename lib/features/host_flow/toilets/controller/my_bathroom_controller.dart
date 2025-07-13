import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mrweekes229/features/host_flow/toilets/screen/live_session_screen.dart';
import '../model/bathroom_model.dart';

class MyBathroomController extends GetxController {
  String selectedFilter = 'all';

  List<BathroomModel> bathrooms = [
    BathroomModel(
      id: '1',
      title: 'Urban Comfort',
      location: 'Central Station,\nDowntown, New York',
      rating: 4.5,
      status: 'available',
      imageUrl:
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
    ),
    BathroomModel(
      id: '2',
      title: 'Mountain Escape',
      location: 'Alpine Road, Aspen, Colorado',
      rating: 4.7,
      status: 'available',
      imageUrl:
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
    ),
    BathroomModel(
      id: '3',
      title: 'Coastal Retreat',
      location: 'Ocean Drive, Miami, Florida',
      rating: 4.8,
      status: 'in_use',
      imageUrl:
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
    ),
    BathroomModel(
      id: '4',
      title: 'Desert Oasis',
      location: 'Sand Dunes,\nScottsdale, Arizona',
      rating: 4.6,
      status: 'unpublished',
      imageUrl:
          'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
    ),
  ];

  void setFilter(String filter) {
    selectedFilter = filter;
    update();
  }

  List<BathroomModel> getFilteredBathrooms() {
    if (selectedFilter == 'all') {
      return bathrooms;
    }
    return bathrooms
        .where((bathroom) => bathroom.status == selectedFilter)
        .toList();
  }

  void showMenuOptions(BathroomModel bathroom) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Unpublish Option
            GestureDetector(
              onTap: () {
                Get.back();
                _unpublishBathroom(bathroom);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Unpublish',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ),

            // Divider
            Container(
              height: 1,
              color: const Color(0xFFE0E0E0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),

            // Delete Option
            GestureDetector(
              onTap: () {
                Get.back();
                _showDeleteConfirmation(bathroom);
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  'Delete',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _unpublishBathroom(BathroomModel bathroom) {
    // Find and update the bathroom status
    int index = bathrooms.indexWhere((b) => b.id == bathroom.id);
    if (index != -1) {
      bathrooms[index] = BathroomModel(
        id: bathroom.id,
        title: bathroom.title,
        location: bathroom.location,
        rating: bathroom.rating,
        status: 'unpublished',
        imageUrl: bathroom.imageUrl,
      );
      update();
    }
  }

  void _showDeleteConfirmation(BathroomModel bathroom) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Bathroom'),
        content: Text('Are you sure you want to delete ${bathroom.title}?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              bathrooms.removeWhere((b) => b.id == bathroom.id);
              update();
              Get.back();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void navigateToDetails(BathroomModel bathroom) {
    Get.to(LiveSessionScreen());
  }
}
