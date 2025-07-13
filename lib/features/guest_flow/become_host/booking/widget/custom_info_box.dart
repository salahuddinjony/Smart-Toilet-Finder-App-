import 'package:flutter/material.dart';
import 'package:mrweekes229/core/common/styles/global_text_style.dart';

class CustomInfoBox extends StatelessWidget {
  final String text;
  final String iconPath;
  final Alignment alignment;
  const CustomInfoBox({
    super.key,
    required this.text,
    required this.iconPath,
    this.alignment = Alignment.centerLeft, 
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment:alignment,
      child: Container(
        width: screenWidth*0.7,
        height: 72,
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
         borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image(image: AssetImage(iconPath),
            width: 24,
            height: 24,
            fit: BoxFit.cover,),
            SizedBox(width: 12,),
            Text(
              text,
              style: getTextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),

            )

          ],
        ),
        ),
      ),
    );
  }
}