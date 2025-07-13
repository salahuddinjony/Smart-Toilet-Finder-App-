import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/features/guest_flow/package_hold/package_list/screen/packages_screen.dart';

class PackageWidgets extends StatelessWidget {
  const PackageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: size.width * 0.92,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF032728), Color(0xFF00C2CB)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Need to hold a package?',
                style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.2,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                'Click here to send a request for a host\nand get started on your journey!',
                style: TextStyle(
                  fontSize: size.width * 0.04,
                  color: Colors.white,
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.020),
              Container(
                height: size.height * 0.06,
                width: size.width * 0.40,
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  borderRadius: BorderRadius.circular(size.height * 0.030),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: .3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.to(PackagesScreen());
                    },
                    borderRadius: BorderRadius.circular(size.height * 0.025),
                    child: const Center(
                      child: Text(
                        'Add a Package',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
