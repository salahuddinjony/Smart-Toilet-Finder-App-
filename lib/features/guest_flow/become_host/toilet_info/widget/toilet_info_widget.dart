import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mrweekes229/core/common/styles/global_text_style.dart';
import 'package:mrweekes229/features/guest_flow/become_host/toilet_info/controller/toilet_info_controller.dart';

class ToiletInfoWidget extends StatelessWidget {
  ToiletInfoWidget({super.key});

  final ToiletInfoController controller = Get.put(ToiletInfoController());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final horizontalPadding = screenWidth * 0.04; // 4% of screen width
    final titleFontSize = screenWidth * 0.045; // Responsive font size
    final labelFontSize = screenWidth * 0.03;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: mediaQuery.size.height * 0.02),
          Text(
            'Bathroom & Host Info',
            style: getTextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.w500,
              color: const Color(0xff00C2CB),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          Text(
            'Title',
            style: getTextStyle(
              fontSize: labelFontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xff7F7F7F),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.018),
          SizedBox(
            height: mediaQuery.size.height * 0.07,
            child: TextField(
              controller: controller.titleController,
              style: const TextStyle(color: Colors.black),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.03,
                  vertical: mediaQuery.size.height * 0.025,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xffC4C4C4),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xffC4C4C4),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xffC4C4C4),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          Text(
            'Description',
            style: getTextStyle(
              fontSize: labelFontSize,
              fontWeight: FontWeight.w400,
              color: const Color(0xff7F7F7F),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.018),
          TextField(
            controller: controller.descriptionController,
            style: const TextStyle(color: Colors.black),
            textAlignVertical: TextAlignVertical.top,
            maxLines: null,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: mediaQuery.size.height * 0.045,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xffC4C4C4),
                  width: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.018),
        ],
      ),
    );
  }
}
