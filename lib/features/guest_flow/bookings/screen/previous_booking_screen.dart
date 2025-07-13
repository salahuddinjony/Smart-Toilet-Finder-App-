import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_small_button.dart';
import 'package:mrweekes229/features/guest_flow/bookings/controller/bookings_controller.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/custom_submit_button.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/thanks_screen_widget.dart';

class PreviousBookingScreen extends StatelessWidget {
  const PreviousBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 68, left: 16, right: 16, bottom: 20),
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
                  Text(
                    'Previous\nBooking Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      height: 1.2,
                      color: Color(0xFF404040),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),

              SizedBox(height: 24),
              Center(
                child: CustomSmallButton(
                  onPressed: () {
                    Get.to(PreviousBookingScreen());
                  },
                  text: 'Request Again',
                ),
              ),
              SizedBox(height: 24),
              ThanksScreenWidget(
                title: 'User Summery',
                leftsubject1: 'Booked Time',
                leftsubject2: 'Actual Time Used',
                leftsubject3: 'Extra Time',
                rightsubject1: '15 min',
                rightsubject2: '19 min',
                rightsubject3: '+4 min',
              ),
              SizedBox(height: 16),
              ThanksScreenWidget(
                title: 'Payment Breakdown',
                leftsubject1: 'Base Cost',
                leftsubject2: 'Extra Time',
                leftsubject3: 'Total',
                rightsubject1: '\$3.00',
                rightsubject2: '\$.50',
                rightsubject3: '\$3.50',
              ),
              SizedBox(height: 24),
              Center(
                child: Text(
                  ' 💳 Good news!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF404040),
                    fontSize: 16.0,
                    height: 1.2,
                  ),
                ),
              ),
              Text(
                'Your unused hold amount has been automatically released and will return to your account shortly.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7F7F7F),
                  fontSize: 15.0,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(8),
                    child: Image.asset(
                      'assets/images/restroom.png',
                      height: 70,
                      width: 70,
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Urban Comfort – Private\nBathroom',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          height: 1.2,
                          color: Color(0xFF404040),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/ratings.png',
                            height: 16,
                            width: 16,
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                color: Color(0xFF404040),
                                height: 1.5,
                                fontSize: 12.0,
                              ),
                              children: [
                                TextSpan(text: '4.5'),
                                TextSpan(
                                  text: ' (344)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    height: 1.5,
                                    color: Color(0xFF7F7F7F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xFFE6F9FA),
                    ),
                    child: Image.asset(
                      'assets/icons/location.png',
                      height: 16,
                      width: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    height: 45,
                    width: 92,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6F9FA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ratings.png',
                          height: 13,
                          width: 13,
                        ),
                        Obx(
                          () => Text(
                            ' ${Get.find<BookingsController>().selectedRating.value}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              height: 1.5,
                              color: Color(0xFF404040),
                            ),
                          ),
                        ),
                        Spacer(),
                        PopupMenuButton<double>(
                          onSelected: (double rating) {
                            Get.find<BookingsController>().selectRating(rating);
                          },
                          itemBuilder:
                              (BuildContext context) =>
                                  Get.find<BookingsController>().ratingsList
                                      .map(
                                        (rating) => PopupMenuItem<double>(
                                          value: rating,
                                          child: Text(rating.toString()),
                                        ),
                                      )
                                      .toList(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFBA4E4E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 233, 233, 233),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Leave a review',
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,

                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
