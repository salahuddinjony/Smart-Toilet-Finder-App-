import 'package:flutter/material.dart';

class BathroomImageCarousel extends StatefulWidget {
  const BathroomImageCarousel({super.key});

  @override
  State<BathroomImageCarousel> createState() => _BathroomImageCarouselState();
}

class _BathroomImageCarouselState extends State<BathroomImageCarousel> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=800&h=600&fit=crop',
    'https://images.unsplash.com/photo-1620626011761-996317b8d101?w=800&h=600&fit=crop',
    'https://images.unsplash.com/photo-1571068316344-75bc76f77890?w=800&h=600&fit=crop',
    'https://images.unsplash.com/photo-1552321554-5fefe8c9ef14?w=800&h=600&fit=crop',
    'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?w=800&h=600&fit=crop',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image PageView
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),

        // Navigation Arrows
        Positioned(
          left: 20,
          top: 0,
          bottom: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (currentIndex > 0) {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_left,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        ),

        Positioned(
          right: 20,
          top: 0,
          bottom: 0,
          child: Center(
            child: GestureDetector(
              onTap: () {
                if (currentIndex < images.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
          ),
        ),

        // Dots Indicator
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentIndex == index
                          ? const Color(0xFF00BCD4)
                          : Colors.white.withValues(alpha: .5),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
