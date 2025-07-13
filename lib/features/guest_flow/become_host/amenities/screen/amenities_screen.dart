import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/amenities_controller.dart';
import '../widgets/amenity_grid_builder.dart';

class AmenitiesScreen extends StatelessWidget {
  final AmenitiesController controller = Get.put(AmenitiesController());

  AmenitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.08),

              const SizedBox(height: 20),

              // Title
              Center(
                child: Text(
                  'List Your Bathroom',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF404040),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              _buildProgressSteps(),

              SizedBox(height: screenHeight * 0.05),

              Text(
                'Amenities',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF00BCD4),
                ),
              ),

              AmenityGridBuilder(
                amenities: controller.amenities,
                selectedAmenities: controller.selectedAmenities,
                onAmenityToggle: controller.toggleAmenity,
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                useCompactLayout: false,
              ),

              const SizedBox(height: 40),

              _buildNavigationButtons(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSteps() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                index < 4 ? const Color(0xFF00BCD4) : const Color(0xFFD0D0D0),
          ),
        );
      }),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE57373), width: 1.5),
            ),
            child: Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE57373),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 50),

        Obx(
          () => GestureDetector(
            onTap:
                controller.selectedAmenities.isNotEmpty
                    ? controller.goToNextStep
                    : null,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 50,
              decoration: BoxDecoration(
                color:
                    controller.selectedAmenities.isNotEmpty
                        ? const Color(0xFFE57373)
                        : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
