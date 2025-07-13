import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import '../controller/packages_controller.dart';
import '../widgets/empty_packages_widget.dart';
import '../widgets/package_filter_tabs.dart';
import '../widgets/package_list_widget.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PackagesController controller = Get.put(PackagesController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),

            _buildHeader(),

            const SizedBox(height: 30),

            _buildShipToHostButton(controller),

            const SizedBox(height: 20),

            PackageFilterTabs(controller: controller),

            const SizedBox(height: 20),

            Expanded(
              child: GetBuilder<PackagesController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF00BCD4),
                      ),
                    );
                  }

                  if (controller.filteredPackages.isEmpty) {
                    return const EmptyPackagesWidget();
                  } else {
                    return PackageListWidget(
                      packages: controller.filteredPackages,
                      controller: controller,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),

          const Spacer(),

          const Text(
            'Packages',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF404040),
            ),
          ),

          const Spacer(),

          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildShipToHostButton(PackagesController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => controller.shipToHost(),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE57373).withValues(alpha: .3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'Ship to Host',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
