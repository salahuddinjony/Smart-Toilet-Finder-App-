import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 146,
                    height: 146,
                    child: CircularProgressIndicator(
                      value: 0.4,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      color: Color(0xff00C2CB),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '12:00',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff00C2CB),
                        ),
                      ),
                      Text(
                        'Left',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff00C2CB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Started:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xffA7A7A7),
                    ),
                  ),
                  Text(
                    '12:59',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      color: Color(0xff00C2CB),
                    ),
                  ),
                  SizedBox(width: 40),
                  Text(
                    'End:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Color(0xffA7A7A7),
                    ),
                  ),
                  Text(
                    ' 01:19',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.3,
                      color: Color(0xff00C2CB),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(0xff11B32A),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  'Active',
                  style: TextStyle(
                    color: Color(0xff11B32A),
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
