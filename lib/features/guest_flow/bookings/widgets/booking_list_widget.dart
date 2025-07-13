import 'package:flutter/material.dart';

class BookingListWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String address;
  final String rating;

  const BookingListWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.address,
    required this.rating,
  });

  String _formatAddress(String address) {
    List<String> segments = address.split(',').map((s) => s.trim()).toList();
    if (segments.length >= 2) {
      return '${segments[0]}, ${segments[1]}\n${segments.sublist(2).join(', ')}';
    }
    return address;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 3.0,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Color(0xFFE6F9FA)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: screenWidth * 0.18,
                width: screenWidth * 0.20,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 0.05,
                      height: 1.3,
                      color: Color(0xFF404040),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/icons/distance.png',
                        height: screenWidth * 0.04,
                        width: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Expanded(
                        child: Text(
                          _formatAddress(address),
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF7F7F7F),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/rating.png',
                      height: screenWidth * 0.04,
                      width: screenWidth * 0.04,
                    ),
                    Text(
                      ' $rating',
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.05),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(33),
                    color: Color(0xFFFFF0F0),
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.015),
                  child: Image.asset(
                    'assets/icons/Arrow.png',
                    height: screenWidth * 0.040,
                    width: screenWidth * 0.040,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
