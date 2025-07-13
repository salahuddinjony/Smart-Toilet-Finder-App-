import 'package:flutter/material.dart';

class AmenitiesGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> amenities;

  const AmenitiesGridWidget({super.key, required this.amenities});

  @override
  Widget build(BuildContext context) {
    // Default amenities if none provided
    final displayAmenities =
        amenities.isNotEmpty
            ? amenities
            : [
              {
                'name': 'Toilet paper',
                'icon': Icons.receipt_long,
                'color': Color(0xFF00BCD4),
              },
              {
                'name': 'Hand Wash',
                'icon': Icons.soap,
                'color': Color(0xFF2196F3),
              },
              {
                'name': 'Mirror',
                'icon': Icons.girl_sharp,
                'color': Color(0xFF00BCD4),
              },
              {
                'name': 'Shower',
                'icon': Icons.shower,
                'color': Color(0xFF4CAF50),
              },
              {
                'name': 'Accessible',
                'icon': Icons.accessible,
                'color': Color(0xFF9C27B0),
              },
              {
                'name': 'Lockable',
                'icon': Icons.lock,
                'color': Color(0xFFFF9800),
              },
            ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: displayAmenities.length,
      itemBuilder: (context, index) {
        final amenity = displayAmenities[index];
        return _buildAmenityItem(amenity);
      },
    );
  }

  Widget _buildAmenityItem(Map<String, dynamic> amenity) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: (amenity['color'] as Color).withValues(alpha: .1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            amenity['icon'] as IconData,
            color: amenity['color'] as Color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          amenity['name'] as String,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
