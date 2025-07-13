import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mrweekes229/features/guest_flow/become_host/amenities/screen/amenities_screen.dart';

class UploadScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final RxList<XFile> selectedImages = <XFile>[].obs;
  final Rx<int?> coverImageIndex = 0.obs;

  // ignore: prefer_typing_uninitialized_variables
  var restroomData;

  void goToNextStep() {
    if (selectedImages.isEmpty) {
      Get.snackbar(
        'No Images',
        'Please upload at least one image to continue',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    // Navigate to next step
    Get.snackbar(
      'Success',
      'Photos uploaded successfully!',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Add navigation to next screen here
    Get.to(() => AmenitiesScreen());
  }

  // Method to pick images
  Future<void> pickImages() async {
    try {
      final List<XFile> images = await picker.pickMultiImage();
      if (images.isNotEmpty) {
        selectedImages.addAll(images);
        // Set first image as cover if no cover is set
        if (coverImageIndex.value == 0 && selectedImages.isNotEmpty) {
          coverImageIndex.value = 0;
        }
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick images: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Method to set cover image
  void setCoverImage(int index) {
    coverImageIndex.value = index;
    Get.snackbar(
      'Cover Image Set',
      'Image ${index + 1} is now the cover image',
      backgroundColor: const Color(0xFF00BCD4),
      colorText: Colors.white,
    );
  }

  // Method to remove image
  void removeImage(int index) {
    selectedImages.removeAt(index);
    // Adjust cover image index if needed
    if (coverImageIndex.value == index) {
      coverImageIndex.value = selectedImages.isNotEmpty ? 0 : null;
    } else if (coverImageIndex.value != null &&
        coverImageIndex.value! > index) {
      coverImageIndex.value = coverImageIndex.value! - 1;
    }
  }

  void openMap() {}
}
