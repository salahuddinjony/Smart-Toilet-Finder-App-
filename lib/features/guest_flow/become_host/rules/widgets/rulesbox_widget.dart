import 'package:flutter/material.dart';

class RulesBoxWidget extends StatefulWidget {
  const RulesBoxWidget({super.key, required this.rules});

  final List<String> rules;

  @override
  State<RulesBoxWidget> createState() => _RulesBoxWidgetState();
}

class _RulesBoxWidgetState extends State<RulesBoxWidget> {
  late List<bool> _checkedStates;

  @override
  void initState() {
    super.initState();

    _checkedStates = List<bool>.filled(widget.rules.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rules",
            style: TextStyle(
              color: Color(0xFF00C2CB),
              fontWeight: FontWeight.w600,
              fontSize: 20,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(widget.rules.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _checkedStates[index] = !_checkedStates[index];
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      _checkedStates[index]
                          ? Icons.check_box_rounded
                          : Icons.check_box_outline_blank_rounded,
                      color:
                          _checkedStates[index]
                              ? Color(0xffBA4E4E)
                              : const Color(0xFFBA4E4E),
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.rules[index],
                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Color(0xFF404040),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFE6F9FA),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Add your rules  +",
              style: TextStyle(
                fontSize: 14,
                height: 1.3,
                color: Color(0xFF00C2CB),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
