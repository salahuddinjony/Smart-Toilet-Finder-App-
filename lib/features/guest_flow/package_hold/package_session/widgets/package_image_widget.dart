import 'package:flutter/material.dart';

class PackageImageWidget extends StatelessWidget {
  const PackageImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFFB74D), Color(0xFFFF8A65), Color(0xFFE91E63)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: _buildBox(40, 40, Colors.white.withValues(alpha: .3)),
            ),
            Positioned(
              top: 40,
              right: 30,
              child: _buildBox(60, 30, Colors.white.withValues(alpha: .2)),
            ),
            Positioned(
              bottom: 60,
              left: 40,
              child: _buildBox(50, 50, Colors.white.withValues(alpha: .25)),
            ),
            Positioned(
              bottom: 30,
              right: 20,
              child: _buildBox(35, 45, Colors.white.withValues(alpha: .3)),
            ),
            Positioned(
              top: 80,
              left: 80,
              child: _buildBox(45, 35, Colors.white.withValues(alpha: .2)),
            ),
            Positioned(
              bottom: 100,
              right: 60,
              child: _buildBox(55, 40, Colors.white.withValues(alpha: .25)),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(
                    60,
                    80,
                    const Color(0xFFD81B60).withValues(alpha: .8),
                  ),
                  const SizedBox(width: 8),
                  _buildBox(
                    50,
                    60,
                    const Color(0xFFE91E63).withValues(alpha: .9),
                  ),
                  const SizedBox(width: 8),
                  _buildBox(
                    55,
                    70,
                    const Color(0xFFAD1457).withValues(alpha: .8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
    );
  }
}
