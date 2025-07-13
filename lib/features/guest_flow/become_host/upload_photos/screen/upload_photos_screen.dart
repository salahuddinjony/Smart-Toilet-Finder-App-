import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/become_host/upload_photos/controller/upload_screen_controller.dart';
import '../widgets/navigation_button.dart';
import '../widgets/progress_step_widgets.dart';
import '../widgets/upload_photo_card_widget.dart';

// ignore: must_be_immutable
class UploadPhotosScreen extends StatelessWidget {
  UploadScreenController controller = Get.put(UploadScreenController());
  UploadPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              // Title
              Center(
                child: Text(
                  'List Your Bathroom',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF404040),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Progress Steps
              buildProgressSteps(),

              SizedBox(height: 30),

              // Upload Photos Card
              buildUploadPhotosCard(),

              const SizedBox(height: 40),

              // Navigation Buttons
              buildNavigationButtons(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
