import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/restrooom_details/widgets/usage_row.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFC4C4C4), width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UsageRow(title: "Washroom", time: "15 Min", cost: "\$2.5"),
          UsageRow(title: "Shower", time: "10 Min", cost: "\$1"),
          UsageRow(title: "Hold", time: "", cost: "\$2"),
          SizedBox(height: 16),
          Center(
            child: Text(
              "We only charge for your actual usage. If you don’t use extra time, the unused amount from your hold  will be automatically released after your session.",
              style: TextStyle(fontSize: 12, color: Colors.grey[700]),
            ),
          ),
          Divider(height: 42),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Total Cost",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("25 Min", style: TextStyle(fontSize: 16)),
              Text(
                "\$5.5",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
