import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class AmenitiesGridWidget extends StatelessWidget {
  const AmenitiesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final amenities = [
      {'icon': IconPath.toiletPaperIcon, 'label': 'Toilet paper'},
      {'icon': IconPath.handWashIcon, 'label': 'Hand Wash'},
      {'icon': IconPath.mirrorIcon, 'label': 'Mirror'},
      {'icon': IconPath.showerIcon, 'label': 'Shower'},
      {'icon': IconPath.accessibleIcon, 'label': 'Accessible'},
      {'icon': IconPath.lockableIcon, 'label': 'Lockable'},
    ];
    //Gridview Widget
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: amenities.length,
      itemBuilder: (context, index) {
        final amenity = amenities[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              height: 40,

              child: Image.asset(
                amenity['icon'] as String,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              amenity['label'] as String,
              style: const TextStyle(fontSize: 12, color: Color(0xFF2D3748)),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
