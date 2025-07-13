import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/host_flow/bottom_navbar/controller/bottom_navbar_controller.dart';

class Navbar extends StatelessWidget {
  final BottomNavbarController controller;
  final List<String> icons;
  final List<String> labels;

  const Navbar({
    super.key,
    required this.controller,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: (index) => controller.changeIndex(index),
        selectedItemColor: const Color(0xFFE57373),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          icons.length,
          (index) => BottomNavigationBarItem(
            icon: Image.asset(
              icons[index],
              width: 24,
              height: 24,
              color:
                  controller.selectedIndex.value == index
                      ? const Color(0xFFE57373)
                      : Colors.grey,
            ),
            label: labels[index],
          ),
        ),
      ),
    );
  }
}
