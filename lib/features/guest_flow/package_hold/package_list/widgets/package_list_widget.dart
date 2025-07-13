import 'package:flutter/material.dart';
import '../controller/packages_controller.dart';
import '../model/package_model.dart';
import 'package_card_widget.dart';

class PackageListWidget extends StatelessWidget {
  final List<PackageModel> packages;
  final PackagesController controller;

  const PackageListWidget({
    super.key,
    required this.packages,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: packages.length,
      itemBuilder: (context, index) {
        final package = packages[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: PackageCardWidget(
            package: package,
            onTap: () => controller.viewPackageDetails(package),
            onStatusTap: () => controller.updatePackageStatus(package),
          ),
        );
      },
    );
  }
}
