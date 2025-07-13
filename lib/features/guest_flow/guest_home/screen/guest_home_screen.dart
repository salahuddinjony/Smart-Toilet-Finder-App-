import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/guest_home/widgets/map_view_widget.dart';
import '../widgets/package_widgets.dart';
import '../widgets/recently_view_widget.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: const MapViewWidget(),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(isSmallScreen),
                SizedBox(
                  height: screenHeight * .80,
                  child: const PackageWidgets(),
                ),
              ],
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.15,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return buildRecentlyViewedSection(
                'Recently Viewed',
                scrollController,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(bool isSmallScreen) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        isSmallScreen ? 8 : 16,
        isSmallScreen ? 24 : 50,
        isSmallScreen ? 8 : 16,
        isSmallScreen ? 8 : 16,
      ),
      color: Colors.white.withValues(alpha: .95),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: isSmallScreen ? 40 : 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(isSmallScreen ? 18 : 25),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search ...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: isSmallScreen ? 14 : 16,
                  ),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      isSmallScreen ? 18 : 25,
                    ),
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isSmallScreen ? 14 : 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: isSmallScreen ? 40 : 50,
            height: isSmallScreen ? 40 : 50,
            decoration: BoxDecoration(
              color: const Color(0xFF00BCD4),
              borderRadius: BorderRadius.circular(isSmallScreen ? 8 : 12),
            ),
            child: const Icon(Icons.filter_list, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }
}
