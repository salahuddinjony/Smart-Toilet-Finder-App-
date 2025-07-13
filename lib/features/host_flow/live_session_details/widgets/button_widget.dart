import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mrweekes229/features/host_flow/toilets/screen/my_bathroom_screen.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(MyBathroomScreen());
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffBA4E4E),
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            'Report An Issue',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            minimumSize: Size(double.infinity, 50),
            side: BorderSide(color: Color(0xffBA4E4E)),
          ),
          child: Text(
            'Contact User',
            style: TextStyle(
              color: Color(0xffBA4E4E),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
