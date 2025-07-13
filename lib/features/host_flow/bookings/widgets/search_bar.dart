// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mrweekes229/core/utils/constants/colors.dart';

class SearchBarW extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onFilterPressed;

  const SearchBarW({
    super.key,
    required this.controller,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search ...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search, size: 30),
                suffixIcon: IconButton(
                  color: AppColors.info,
                  icon: const Icon(Icons.tune, size: 30),
                  onPressed: () {
                    print('Filter button pressed');
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
