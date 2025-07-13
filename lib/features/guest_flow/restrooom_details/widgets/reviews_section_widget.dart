import 'package:flutter/material.dart';

class ReviewsSectionWidget extends StatelessWidget {
  const ReviewsSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF2D3748),
          ),
        ),
        const SizedBox(height: 20),

        // Review Items
        _buildReviewItem(),
        const SizedBox(height: 20),
        _buildReviewItem(),
        const SizedBox(height: 20),
        _buildReviewItem(),
      ],
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Avatar
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Name and Stars
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Floyd Miles',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF5C5C5C),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Color(0xFFF0C020),
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Date
            const Text(
              '27/05/2025',
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF00BCD4),
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Review Text
        Text(
          'Lorem ipsum dolor sit amet consectetur. Interdum ac hac nec etiam. Augue etiam ornare eu velit ultrices pharetra. Velit fringilla tellus justo sed et praesent quam praesent in. Scelerisque venenatis leo nunc convallis vel amet faucibus mattis parturient.',
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFF5C5C5C),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
