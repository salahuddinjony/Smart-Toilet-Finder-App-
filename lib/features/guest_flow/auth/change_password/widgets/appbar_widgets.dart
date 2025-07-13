import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: const Color(0xFFF9F9F9),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Get.back(),
    ),
    title: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
  );
}
