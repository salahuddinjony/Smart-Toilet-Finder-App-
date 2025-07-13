import 'package:flutter/material.dart';

class CustomOutlineButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  const CustomOutlineButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:
          onPressed ??
          () {
            debugPrint('Button "$buttonText" pressed');
          },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.redAccent,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        side: const BorderSide(color: Colors.redAccent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(buttonText, style: TextStyle(fontSize: 18.0)),
    );
  }
}
