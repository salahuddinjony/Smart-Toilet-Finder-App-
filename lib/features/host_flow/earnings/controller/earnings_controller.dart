import 'package:get/get.dart';

class EarningsController extends GetxController {
  final RxString selectedTimePeriod = 'This Week'.obs;
  final List<String> timePeriodOptions = [
    'This Week',
    'This Month',
    'This Year',
    'Last Month',
    'Last 3 Months',
    'Last 6 Months',
    'Last Year',
  ];

  void selectTimePeriod(String period) {
    selectedTimePeriod.value = period;
  }
}
