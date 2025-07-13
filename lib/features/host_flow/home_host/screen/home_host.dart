import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/features/host_flow/home_host/controller/home_host_Controller.dart';
import 'package:mrweekes229/features/host_flow/home_host/widget/coustom_container.dart';
import 'package:mrweekes229/features/host_flow/home_host/widget/coustom_gridview.dart';
import 'package:mrweekes229/features/host_flow/home_host/widget/earn_package_widget.dart';

class HomeHost extends StatelessWidget {
  final HomeHostController controller = Get.put(HomeHostController());
  HomeHost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hi, Terry',
                      style: getTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff00C2CB),
                      ),
                    ),
                    SizedBox(width: 14),
                    Image.asset(IconPath.hand, width: 24),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 12),
                  child: Text(
                    "Here's how your Bathrooms are doing",
                    style: getTextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff666666),
                    ),
                  ),
                ),

                CoustomGridview(controller: controller),
                SizedBox(height: 32),
                EarnPackageWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 24),
                  child: Center(
                    child: Text(
                      'Live sessions',
                      style: getTextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF91404),
                      ),
                    ),
                  ),
                ),
                CoustomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
