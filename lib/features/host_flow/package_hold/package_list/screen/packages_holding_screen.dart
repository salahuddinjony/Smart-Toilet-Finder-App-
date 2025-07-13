import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screen/package_holding_dashboard.dart';
import '../controller/packages_controller.dart';
import '../widgets/empty_packages_widget.dart';
import '../widgets/package_filter_tabs.dart';
import '../widgets/package_list_widget.dart';

class PackagesHoldingScreen extends StatelessWidget {
  const PackagesHoldingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PackagesHoldController controller = Get.put(PackagesHoldController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildHeader(),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefix: Icon(Icons.search),
                      hintText: 'Search ...',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: Color(0xFFABB7C2),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.tune, color: Color(0xFF00C2CB)),
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            PackageFilterTabs(controller: controller),
            const SizedBox(height: 20),
            Expanded(
              child: GetBuilder<PackagesHoldController>(
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
            onTap: () => Get.offAll(PackageHoldingDashboard()),
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
}
