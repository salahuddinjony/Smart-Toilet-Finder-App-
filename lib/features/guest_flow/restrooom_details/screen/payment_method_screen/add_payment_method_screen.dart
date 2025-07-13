import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/core/common/widgets/custom_large_button.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';
import 'package:mrweekes229/core/utils/constants/image_path.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/screen/payment_method_screen/add_card_details_screen.dart';

class AddPaymentMethodPage extends StatelessWidget {
  const AddPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: const Text(
                  "Add a payment method",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 30),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    _buildPaymentTile(
                      imagePath: IconPath.stripeIcon,
                      title: "",
                    ),
                  ],
                ),
              ),

              Spacer(),

              CustomLargeButton(
                onPressed: () {
                  Get.to(() => AddCardDetailsScreen());
                },
                text: "Continue",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentTile({required String imagePath, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
          Padding(
            padding: const EdgeInsets.only(right: 130, top: 3, bottom: 3),
            child: Image.asset(ImagePath.stripe, width: 67, height: 30),
          ),
        ],
      ),
    );
  }
}
