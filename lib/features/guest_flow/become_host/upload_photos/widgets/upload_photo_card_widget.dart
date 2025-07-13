import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../controller/upload_screen_controller.dart';
import 'dashed_border_widgets.dart';
import 'image_card_widget.dart';

final controller = Get.find<UploadScreenController>();

Widget buildUploadPhotosCard() {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upload Photos Title
          Text(
            'Upload Photos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF00BCD4),
            ),
          ),

          const SizedBox(height: 24),

          // Upload Area
          _buildUploadArea(),

          const SizedBox(height: 20),

          // Selected Images Grid
          if (controller.selectedImages.isNotEmpty) _buildSelectedImagesGrid(),

          // Sample Images (if no images selected)
          if (controller.selectedImages.isEmpty) _buildSampleImages(),
        ],
      ),
    ),
  );
}

Widget _buildUploadArea() {
  return GestureDetector(
    onTap: controller.pickImages,
    child: Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.buttonColor,
          width: 2,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: CustomPaint(
        painter: DashedBorderPainter(),
        child: const Center(
          child: Icon(Icons.add, size: 48, color: Color(0xFFE57373)),
        ),
      ),
    ),
  );
}

Widget _buildSelectedImagesGrid() {
  return Column(
    children: [
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.2,
        ),
        itemCount: controller.selectedImages.length,
        itemBuilder: (context, index) {
          return buildImageCard(index, true);
        },
      ),
    ],
  );
}

Widget _buildSampleImages() {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: _buildSampleImageCard(
              'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
              'Cover Image',
              true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildSampleImageCard(
              'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=400&h=300&fit=crop',
              '',
              false,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildSampleImageCard(String imageUrl, String label, bool isCover) {
  return Container(
    height: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .1),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.shade200,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.bathroom,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          if (label.isNotEmpty)
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.edit, color: Color(0xFFE57373), size: 14),
                  ],
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
