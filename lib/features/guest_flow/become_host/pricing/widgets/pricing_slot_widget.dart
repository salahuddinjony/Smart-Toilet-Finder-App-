import 'package:flutter/material.dart';
import 'dropdown_field_widget.dart';

class PricingSlotWidget extends StatelessWidget {
  final String timeValue;
  final String priceValue;
  final Function(String) onTimeChanged;
  final Function(String) onPriceChanged;
  final VoidCallback? onRemove;

  const PricingSlotWidget({
    super.key,
    required this.timeValue,
    required this.priceValue,
    required this.onTimeChanged,
    required this.onPriceChanged,
    this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Time Section (60%)
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              DropdownFieldWidget(
                value: timeValue,
                items: _getTimeOptions(),
                onChanged: onTimeChanged,
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // Price Section (40%)
        Flexible(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 8),
              DropdownFieldWidget(
                value: priceValue,
                items: _getPriceOptions(),
                onChanged: onPriceChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<String> _getTimeOptions() {
    return [
      '5 min',
      '10 min',
      '15 min',
      '20 min',
      '25 min',
      '30 min',
      '45 min',
      '60 min',
      '90 min',
      '120 min',
    ];
  }

  List<String> _getPriceOptions() {
    return [
      '\$1.00',
      '\$1.50',
      '\$2.00',
      '\$2.50',
      '\$3.00',
      '\$3.50',
      '\$4.00',
      '\$4.50',
      '\$5.00',
      '\$5.50',
      '\$6.00',
      '\$7.00',
      '\$8.00',
      '\$9.00',
      '\$10.00',
    ];
  }
}
