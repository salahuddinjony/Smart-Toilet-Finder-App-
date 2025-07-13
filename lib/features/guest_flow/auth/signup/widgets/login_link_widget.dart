import 'package:flutter/material.dart';

Widget buildLoginLink({required VoidCallback goToLogin}) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Do not have an account? ',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        GestureDetector(
          onTap: goToLogin,
          child: const Text(
            'Login',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF6B6B),
            ),
          ),
        ),
      ],
    ),
  );
}
