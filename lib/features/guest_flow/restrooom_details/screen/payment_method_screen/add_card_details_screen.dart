import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_large_button.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/features/guest_flow/bookings/screen/bookings_screen.dart';

class AddCardDetailsScreen extends StatelessWidget {
  const AddCardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 54,
            left: 16,
            right: 16,
            bottom: 35,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(37),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add Card Details',
                    style: TextStyle(
                      height: 1.2,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF404040),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Image.asset(
                      IconPath.debitCardIcon,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  labelText: 'Card number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFFA7A7A7)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Expiration',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFA7A7A7)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0XFFA7A7A7)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Zip Code',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFFA7A7A7)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.buttonColor,
                    size: 32,
                  ),
                  labelText: 'Country/Region',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0XFFA7A7A7)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 292),

              CustomLargeButton(
                onPressed: () {
                  Get.to(BookingsScreen());
                },
                text: 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
