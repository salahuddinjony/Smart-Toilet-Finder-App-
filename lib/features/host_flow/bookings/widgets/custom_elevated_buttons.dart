import 'package:flutter/material.dart';

class CustomElevatedButtons extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomElevatedButtons({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          onPressed ??
          () {
            debugPrint('Button "$buttonText" pressed');
          },
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: Colors.transparent),
        backgroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 18.0, color: Colors.white),
      ),
    );
  }
}
