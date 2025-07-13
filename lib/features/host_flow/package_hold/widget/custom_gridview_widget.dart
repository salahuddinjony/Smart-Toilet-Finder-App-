import 'package:flutter/material.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/features/host_flow/package_hold/controller/package_hold_controller.dart';

class CustomGridviewWidget extends StatelessWidget {
  const CustomGridviewWidget({super.key, required this.controller});

  final PackageHoldController controller;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      itemCount: controller.gridViewItems.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: screenWidth > 600 ? 220 : 180,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.05,
      ),
      itemBuilder: (context, index) {
        final item = controller.gridViewItems[index];
        return Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          shadowColor: Colors.black12,
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(item["image"] ?? '', width: 24),
                  const SizedBox(height: 6),
                  Text(
                    item["value"] ?? '',
                    style: getTextStyle(
                      fontSize: screenWidth < 400 ? 16 : 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff00C2CB),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      item["title"] ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: getTextStyle(
                        fontSize: screenWidth < 400 ? 10 : 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff666666),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
