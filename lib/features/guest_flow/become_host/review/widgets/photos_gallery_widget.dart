import 'package:flutter/material.dart';

class PhotosGalleryWidget extends StatelessWidget {
  final List<String> photos;

  const PhotosGalleryWidget({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    // Use sample images if no photos provided
    final displayPhotos =
        photos.isNotEmpty
            ? photos
            : [
              'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=400&h=300&fit=crop',
              'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=400&h=300&fit=crop',
            ];

    return Row(
      children: [
        Expanded(child: _buildPhotoCard(displayPhotos[0])),
        const SizedBox(width: 12),
        Expanded(
          child: _buildPhotoCard(
            displayPhotos.length > 1 ? displayPhotos[1] : displayPhotos[0],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCard(String imageUrl) {
    return Container(
      height: 120,
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
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey.shade300,
              child: const Icon(Icons.bathroom, size: 40, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
