import 'package:get/get.dart';

class RestroomDetailsController extends GetxController {
  // Observable variables.
  var selectedDuration = 15.obs;
  var isShowerSelected = false.obs;
  RxString additionalItemName = ''.obs;

  // Base prices.
  final double basePricePerMinute = 0.5;
  final double showerPrice = 3.5;

  void selectDuration(int minutes) {
    selectedDuration.value = minutes;
  }

  void toggleShower() {
    isShowerSelected.value = !isShowerSelected.value;
  }

  double getTotalPrice() {
    double total = selectedDuration.value * basePricePerMinute;
    if (isShowerSelected.value) {
      additionalItemName.value = 'Shower';
      total += showerPrice;
    }
    return total;
  }

  void makeRequest() {
    // Handle booking request.
  }
}
