import 'package:flutter/material.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/features/host_flow/home_host/controller/home_host_Controller.dart';

class CoustomGridview extends StatelessWidget {
  const CoustomGridview({super.key, required this.controller});

  final HomeHostController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.gridViewItems.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 15,
        childAspectRatio: 8 / 6,
      ),
      itemBuilder: (context, index) {
        final item = controller.gridViewItems[index];
        return Card(
          color: Color(0xffFFFFFF),
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: Color(0xffFFFFFF),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(item["image"] ?? '', width: 24),
                Text(
                  item["value"] ?? '',
                  style: getTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff00C2CB),
                  ),
                ),
                Text(
                  item["title"] ?? '',
                  style: getTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff666666),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
