import 'package:flutter/material.dart';

class UsageRow extends StatelessWidget {
  final String title;
  final String time;
  final String cost;

  const UsageRow({
    super.key,
    required this.title,
    required this.time,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  if (time.isNotEmpty)
                    Text("$time ", style: TextStyle(fontSize: 14)),
                  Text(
                    cost,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
