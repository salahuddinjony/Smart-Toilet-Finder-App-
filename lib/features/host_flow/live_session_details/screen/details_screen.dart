import 'package:flutter/material.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/activity_widget.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/amount_paid_widget.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/appbar_widget.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/button_widget.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/direct_message_button.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/indicator_widget.dart';
import 'package:mrweekes229/features/host_flow/live_session_details/widgets/user_info_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            UserInfo(),
            const SizedBox(height: 32),
            const DirectMessageButton(),
            const SizedBox(height: 32),
            const IndicatorWidget(),
            const SizedBox(height: 20),
            const AmountPaidWidget(),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '10% Platform fee applies',
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    letterSpacing: -.2,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            const ActivityWidget(),
            const SizedBox(height: 48),
            const ButtonWidget(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
