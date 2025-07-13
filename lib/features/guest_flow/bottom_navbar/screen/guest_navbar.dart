import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/bottom_navbar/controller/guest_bottom_navbar_controller.dart';

class GuestNavbar extends StatelessWidget {
  GuestNavbar({super.key});
  final GuestBottomNavbarController controller = Get.put(
    GuestBottomNavbarController(),
  );

  final List<String> icons = [
    ImagePath.home,
    ImagePath.guestBooking,
    ImagePath.profile,
    ImagePath.becomeHost,
  ];

  final List<String> labels = ['Home', 'Booking', 'Profile', 'Become Host'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final screenHeight = MediaQuery.of(context).size.height;
      final navBarHeight = screenHeight * 0.09;

      return NavigationBarTheme(
        data: NavigationBarThemeData(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
            Set<WidgetState> states,
          ) {
            final isSelected = states.contains(WidgetState.selected);
            return TextStyle(
              color: isSelected ? const Color(0xFFFF6B6B) : Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }),
        ),
        child: NavigationBar(
          height: navBarHeight,
          indicatorColor: Colors.transparent,
          backgroundColor: Colors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          destinations: List.generate(4, (index) {
            return NavigationDestination(
              icon:
                  index == 3
                      ? Icon(
                        Icons.search,
                        color:
                            controller.selectedIndex.value == index
                                ? const Color(0xFFFF6B6B)
                                : Colors.black,
                        size: 24,
                      )
                      : Image.asset(
                        icons[index],
                        color:
                            controller.selectedIndex.value == index
                                ? const Color(0xFFFF6B6B)
                                : Colors.black,
                        height: 24,
                        width: 24,
                      ),
              label: labels[index],
            );
          }),
        ),
      );
    });
  }
}
