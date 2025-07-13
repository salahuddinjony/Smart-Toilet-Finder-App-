//
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_small_button.dart';
import 'package:mrweekes229/features/guest_flow/bookings/controller/bookings_controller.dart';
import 'package:mrweekes229/features/guest_flow/bookings/screen/previous_booking_screen.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/custom_submit_button.dart';
import 'package:mrweekes229/features/guest_flow/bookings/widgets/thanks_screen_widget.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 400;

    double getResponsive(double small, double large) => isSmall ? small : large;

    EdgeInsets getPadding() => EdgeInsets.only(
      top: getResponsive(32, 68),
      left: getResponsive(8, 16),
      right: getResponsive(8, 16),
      bottom: getResponsive(10, 20),
    );

    double getFont(double small, double large) => isSmall ? small : large;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: getPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Thanks for',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: getFont(18, 24),
                            height: 1.2,
                            color: const Color(0xFF404040),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: getFont(18, 24),
                              height: 1.2,
                              color: const Color(0xFF404040),
                            ),
                            children: [
                              const TextSpan(text: 'using'),
                              TextSpan(
                                text: ' FreshGo!',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getFont(18, 24),
                                  height: 1.2,
                                  color: const Color(0xFFBA4E4E),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: getResponsive(32, 40),
                      width: getResponsive(32, 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(37),
                        color: const Color(0xFFECECEC),
                      ),
                      child: Icon(Icons.close, size: getResponsive(20, 24)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getResponsive(16, 24)),
              Center(
                child: CustomSmallButton(
                  onPressed: () {
                    Get.to(PreviousBookingScreen());
                  },
                  text: 'Request Again',
                ),
              ),
              SizedBox(height: getResponsive(16, 24)),
              ThanksScreenWidget(
                title: 'User Summery',
                leftsubject1: 'Booked Time',
                leftsubject2: 'Actual Time Used',
                leftsubject3: 'Extra Time',
                rightsubject1: '15 min',
                rightsubject2: '19 min',
                rightsubject3: '+4 min',
              ),
              SizedBox(height: getResponsive(8, 16)),
              ThanksScreenWidget(
                title: 'Payment Breakdown',
                leftsubject1: 'Base Cost',
                leftsubject2: 'Extra Time',
                leftsubject3: 'Total',
                rightsubject1: '\$3.00',
                rightsubject2: '\$.50',
                rightsubject3: '\$3.50',
              ),
              SizedBox(height: getResponsive(16, 24)),
              Center(
                child: Text(
                  ' 💳 Good news!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF404040),
                    fontSize: getFont(13, 16),
                    height: 1.2,
                  ),
                ),
              ),
              Text(
                'Your unused hold amount has been automatically released and will return to your account shortly.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF7F7F7F),
                  fontSize: getFont(12, 15),
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getResponsive(24, 40)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/restroom.png',
                      height: getResponsive(50, 70),
                      width: getResponsive(50, 70),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: getResponsive(8, 16)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Urban Comfort – Private\nBathroom',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: getFont(13, 16),
                            height: 1.2,
                            color: const Color(0xFF404040),
                          ),
                        ),
                        SizedBox(height: getResponsive(4, 8)),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/ratings.png',
                              height: getResponsive(12, 16),
                              width: getResponsive(12, 16),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: const Color(0xFF404040),
                                  height: 1.5,
                                  fontSize: getFont(10, 12),
                                ),
                                children: [
                                  const TextSpan(text: '4.5'),
                                  TextSpan(
                                    text: ' (344)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: getFont(10, 12),
                                      height: 1.5,
                                      color: const Color(0xFF7F7F7F),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: getResponsive(8, 0)),
                  Container(
                    padding: EdgeInsets.all(getResponsive(6, 8)),
                    height: getResponsive(24, 32),
                    width: getResponsive(24, 32),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFFE6F9FA),
                    ),
                    child: Image.asset(
                      'assets/icons/location.png',
                      height: getResponsive(12, 16),
                      width: getResponsive(12, 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getResponsive(24, 40)),

              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getResponsive(4, 6),
                        vertical: getResponsive(3, 5),
                      ),
                      height: getResponsive(36, 45),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F9FA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/ratings.png',
                            height: getResponsive(10, 13),
                            width: getResponsive(10, 13),
                          ),
                          Obx(
                            () => Text(
                              ' ${Get.find<BookingsController>().selectedRating.value}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: getFont(10, 12),
                                height: 1.5,
                                color: const Color(0xFF404040),
                              ),
                            ),
                          ),
                          const Spacer(),
                          PopupMenuButton<double>(
                            onSelected: (double rating) {
                              Get.find<BookingsController>().selectRating(
                                rating,
                              );
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
                              color: const Color(0xFFBA4E4E),
                              size: getResponsive(18, 24),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: getResponsive(6, 10)),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: getResponsive(36, 45),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9E9E9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Leave a review',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: getResponsive(10, 12),
                            vertical: getResponsive(8, 10),
                          ),
                        ),
                        style: TextStyle(fontSize: getFont(12, 14)),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: getResponsive(8, 16)),
              const CustomSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
