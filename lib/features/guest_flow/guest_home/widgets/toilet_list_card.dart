import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';

import '../../../../core/utils/constants/colors.dart';

class ToiletListCard extends StatelessWidget {
  final String toiletName;
  final String toiletAddress;
  final String toiletRating;
  final String price;
  final String? imageUrl;
  final bool isDirectionEnabled;

  const ToiletListCard({
    super.key,
    required this.toiletName,
    required this.toiletAddress,
    required this.toiletRating,
    required this.price,
    this.isDirectionEnabled = false,
    this.imageUrl,
    required bool isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildImageSection(context),

                const SizedBox(width: 12),

                Expanded(child: _buildContentSection()),

                _buildRatingPriceSection(),
              ],
            ),
          ),

          isDirectionEnabled ? _buildDirectionButton() : SizedBox(),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.20,
      height: MediaQuery.of(context).size.width * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child:
            imageUrl != null
                ? Image.asset(ImagePath.bathroom10, fit: BoxFit.cover)
                : _buildPlaceholderImage(),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.brown.shade300, Colors.grey.shade600],
        ),
      ),
      child: const Icon(Icons.bathroom, color: Colors.white, size: 32),
    );
  }

  Widget _buildContentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          toiletName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            const Icon(Icons.location_on, color: Color(0xFF00BCD4), size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                toiletAddress,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingPriceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              toiletRating,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Text(
          '\$$price',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00BCD4),
          ),
        ),
      ],
    );
  }

  Widget _buildDirectionButton() {
    return Container(
      height: 45,
      width: 180,
      decoration: BoxDecoration(
        color: Color(0xFFFFF0F0),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Direction',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonColor,
                  ),
                ),
                SizedBox(width: 8),
                Image.asset(
                  IconPath.directionIcon,
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
