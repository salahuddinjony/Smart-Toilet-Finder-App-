import 'package:flutter/material.dart';

class EmptyPackagesWidget extends StatelessWidget {
  const EmptyPackagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Empty State Illustration
          _buildEmptyStateIllustration(),

          const SizedBox(height: 40),

          // Empty State Message
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Currently, there are no available packages in the system.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateIllustration() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Magnifying Glass
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey.shade300, width: 3),
          ),
          child: Center(
            child: Icon(
              Icons.help_outline,
              size: 40,
              color: const Color(0xFFE57373),
            ),
          ),
        ),

        // Magnifying Glass Handle
        Positioned(
          bottom: -10,
          right: -10,
          child: Container(
            width: 40,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        // Decorative Lines
        Positioned(top: 20, right: -30, child: _buildDecorationLine()),

        Positioned(top: 40, right: -40, child: _buildDecorationLine()),

        Positioned(top: 60, right: -35, child: _buildDecorationLine()),
      ],
    );
  }

  Widget _buildDecorationLine() {
    return Container(
      width: 20,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xFFE57373),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
