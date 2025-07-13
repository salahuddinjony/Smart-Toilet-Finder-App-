import 'package:get/get.dart';

class BookingsController extends GetxController {
  var selectedTimeIndex = 0.obs;
  var selectedRating = 4.5.obs;
  var ratingsList = [1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0];

  void selectRating(double rating) {
    selectedRating.value = rating;
  }

  void selectTime(int index) {
    selectedTimeIndex.value = index;
  }
}
