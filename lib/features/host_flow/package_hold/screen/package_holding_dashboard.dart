import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_large_button.dart';
import 'package:mrweekes229/features/host_flow/package_hold/controller/package_hold_controller.dart';
import 'package:mrweekes229/features/host_flow/package_hold/package_list/screen/packages_holding_screen.dart';
import 'package:mrweekes229/features/host_flow/package_hold/screen/package_holding.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/custom_gridview_widget.dart';
import 'package:mrweekes229/features/host_flow/package_hold/widget/holding_req_container.dart';

class PackageHoldingDashboard extends StatelessWidget {
  final PackageHoldController controller = Get.put(PackageHoldController());
  PackageHoldingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> holdings = [
      {
        'imagePath': 'assets/images/holding1.png',
        'heading': 'Jerome Bell-Medium Box',
        'name': 'Leslie Alexander',
        'title': 'Guest',
        'size': 'Medium',
      },
      {
        'imagePath': 'assets/images/holding2.png',
        'heading': 'Sarah Johnson-Large Box',
        'name': 'Sarah Johnson',
        'title': 'Guest',
        'size': 'Large',
      },
      {
        'imagePath': 'assets/images/holding3.png',
        'heading': 'Michael Brown-Small Box',
        'name': 'Michael Brown',
        'title': 'Host',
        'size': 'Small',
      },
      {
        'imagePath': 'assets/images/holding4.png',
        'heading': 'Emily Davis-Medium Box',
        'name': 'Emily Davis',
        'title': 'Guest',
        'size': 'Medium',
      },
      {
        'imagePath': 'assets/images/holding5.png',
        'heading': 'David Wilson-Large Box',
        'name': 'David Wilson',
        'title': 'Host',
        'size': 'Large',
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Package Holding\nDashboard',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF404040),
                      height: 1.2,
                    ),
                  ),

                  Image.asset(
                    'assets/icons/settings.png',
                    height: 32,
                    width: 32,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Manage your held packages and\npreferences',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF666666),
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 30),
              CustomGridviewWidget(controller: controller),
              SizedBox(height: 40),
              CustomLargeButton(
                onPressed: () {
                  Get.to(PackagesHoldingScreen());
                },
                text: "All Packages",
                imagePath: 'assets/icons/package.png',
              ),
              SizedBox(height: 40),
              Text(
                'Package Holding Requests',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  height: 1.2,
                  color: Color(0xFF404040),
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: holdings.length,
                itemBuilder: (context, index) {
                  final hold = holdings[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(PackageHolding());
                      },
                      child: HoldingReqContainer(
                        heading: hold['heading']!,
                        name: hold['name']!,
                        title: hold['title']!,
                        size: hold['size']!,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
