// ignore_for_file: unrelated_type_equality_checks, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/upload_screen_controller.dart';

Widget buildImageCard(int index, bool isSelected) {
  final controller = Get.find<UploadScreenController>();
  final isFile = controller.selectedImages[index].path.isNotEmpty;
  final isCover = controller.coverImageIndex == index;

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border:
          isCover ? Border.all(color: const Color(0xFF00BCD4), width: 2) : null,
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
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                isFile
                    ? Image.file(
                      File(controller.selectedImages[index].path),
                      fit: BoxFit.cover,
                    )
                    : Container(
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.image,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
          ),

          // Cover Image Label
          if (isCover)
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cover Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.edit, color: Color(0xFFE57373), size: 14),
                  ],
                ),
              ),
            ),

          // Action Buttons
          Positioned(
            top: 8,
            right: 8,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => controller.setCoverImage(index),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isCover ? Icons.star : Icons.star_border,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => controller.removeImage(index),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
