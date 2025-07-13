import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.1),
      child: Row(
        children: [
          Image(
            image: AssetImage(IconPath.leftarrow),
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
          SizedBox(width: screenWidth * 0.3),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: const Color(0xff333333),
            ),
          ),
        ],
      ),
    );
  }
}
