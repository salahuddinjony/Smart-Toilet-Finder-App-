import 'package:flutter/material.dart';
import 'dropdown_field_widget.dart';

class LateFeeWidget extends StatelessWidget {
  final bool isEnabled;
  final String feeAmount;
  final Function(bool) onToggle;
  final Function(String) onFeeChanged;

  const LateFeeWidget({
    super.key,
    required this.isEnabled,
    required this.feeAmount,
    required this.onToggle,
    required this.onFeeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Checkbox and Label
        Row(
          children: [
            GestureDetector(
              onTap: () => onToggle(!isEnabled),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isEnabled
                            ? const Color(0xFF00BCD4)
                            : const Color(0xFFE57373),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                  color:
                      isEnabled ? const Color(0xFF00BCD4) : Colors.transparent,
                ),
                width: 24,
                height: 24,
                child:
                    isEnabled
                        ? const Icon(Icons.check, color: Colors.white, size: 14)
                        : null,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                'Late fee applies',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),

        // Fee Amount Dropdown (only show if enabled)
        if (isEnabled) ...[
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;
              // Use 40% of available width, min 120, max 220
              double dropdownWidth = width * 0.4;
              dropdownWidth = dropdownWidth.clamp(120.0, 220.0);
              return SizedBox(
                width: dropdownWidth,
                child: DropdownFieldWidget(
                  value: feeAmount,
                  items: _getFeeOptions(),
                  onChanged: onFeeChanged,
                ),
              );
            },
          ),
        ],
      ],
    );
  }

  List<String> _getFeeOptions() {
    return [
      '\$0.25',
      '\$0.50',
      '\$0.75',
      '\$1.00',
      '\$1.25',
      '\$1.50',
      '\$2.00',
      '\$2.50',
    ];
  }
}
