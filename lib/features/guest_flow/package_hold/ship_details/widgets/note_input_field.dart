import 'package:flutter/material.dart';
// Adjust path as needed
import '../controller/ship_details_controller.dart';

class NoteScreen extends StatelessWidget {
  final ShipDetailsController controller = ShipDetailsController();

  NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Important to shift UI with keyboard
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          reverse: true, // Scrolls to bottom when keyboard opens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Shipping Notes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              NoteInputField(controller: controller),
              const SizedBox(height: 300), // Simulate more content if needed
            ],
          ),
        ),
      ),
    );
  }
}

class NoteInputField extends StatelessWidget {
  final ShipDetailsController controller;

  const NoteInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.noteController,
      decoration: const InputDecoration(
        labelText: 'Enter your note',
        border: OutlineInputBorder(),
      ),
      maxLines: 5,
    );
  }
}
