import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: AppBar(
        leading: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0XFFECECEC),
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Private Bathroom - 1',
              style: TextStyle(
                color: Color(0xff404040),
                fontWeight: FontWeight.w600,
                fontSize: 20,
                height: 1.2,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'In Use',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff00C2CB),
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
