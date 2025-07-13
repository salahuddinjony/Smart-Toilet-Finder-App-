import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/restroom_controller/restroom_details_controller.dart';

class DurationSelectorWidget extends StatefulWidget {
  const DurationSelectorWidget({super.key});

  @override
  State<DurationSelectorWidget> createState() => _DurationSelectorWidgetState();
}

class _DurationSelectorWidgetState extends State<DurationSelectorWidget> {
  FixedExtentScrollController _scrollController = FixedExtentScrollController();

  final List<int> durations = [5, 10, 15, 20, 25, 30, 35, 40, 45];

  @override
  void initState() {
    super.initState();
    final controller = Get.find<RestroomDetailsController>();
    int initialIndex = durations.indexOf(controller.selectedDuration.value);
    _scrollController = FixedExtentScrollController(
      initialItem: initialIndex >= 0 ? initialIndex : 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestroomDetailsController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.access_time, color: Color(0XFF00C2CB), size: 16),
            SizedBox(width: 8),
            Text(
              "Select Duration",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Color(0xFF2D3748),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Carousel-style Scrollable Picker
        SizedBox(
          height: 120,
          child: ListWheelScrollView.useDelegate(
            controller: _scrollController,
            itemExtent: 40,
            perspective: 0.005,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              controller.selectDuration(durations[index]);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index >= durations.length) return null;

                final minutes = durations[index];

                return Obx(() {
                  final isSelected =
                      controller.selectedDuration.value == minutes;

                  return AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    style: TextStyle(
                      fontSize: isSelected ? 24 : 16,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color:
                          isSelected
                              ? const Color(0xFFFF6B6B)
                              : const Color(0XFF7F7F7F),
                    ),
                    child: Center(child: Text('$minutes Minute')),
                  );
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
