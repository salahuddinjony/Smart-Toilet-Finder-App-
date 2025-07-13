import 'package:flutter/material.dart';
import 'package:mrweekes229/features/guest_flow/become_host/pricing/widgets/progress_steps_widget.dart';
import 'package:mrweekes229/features/guest_flow/become_host/rules/widgets/navigation_button_widget_rules.dart';
import 'package:mrweekes229/features/guest_flow/become_host/rules/widgets/rulesbox_widget.dart';

class BathroomRulesScreen extends StatelessWidget {
  final List<String> rules = [
    "No smoking allowed.",
    "No pets allowed.",
    "No drugs or alcohol permitted.",
    "No unaccompanied minors.",
    "Only one individual allowed at a time.",
    "Please leave the bathroom as you found it.",
    "No loud music.",
  ];

  BathroomRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'List Your Private Bathroom',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF404040),
                          ),
                        ),
                      ),

                      const SizedBox(height: 54),

                      const ProgressStepsWidget(currentStep: 6, totalSteps: 7),

                      const SizedBox(height: 20),

                      RulesBoxWidget(rules: rules),

                      const SizedBox(height: 20),

                      NavigationButtonWidgetRules(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
