import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/more_time_container.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/progress_container.dart';

class ToiletInUseScreen extends StatelessWidget {
  const ToiletInUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: Color(0xFFECECEC),
                      ),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        'Bathroom in Use',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          height: 1.2,
                          color: Color(0xFF404040),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Urban Comfort - Private Bathroom',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.5,
                          color: Color(0xFF7F7F7F),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 21),
              ProgressContainer(),
              SizedBox(height: 24),
              Text(
                'Charges will be applied automatically based on any additional usage.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  height: 1.5,
                  color: Color(0xFF7F7F7F),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              MoreTimeContainer(),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Material(
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFC70E0E),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '🧻 Finish/ Exit Bathroom',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
