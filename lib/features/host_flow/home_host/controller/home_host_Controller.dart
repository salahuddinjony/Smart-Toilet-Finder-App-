// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:mrweekes229/core/utils/constants/icon_path.dart';

class HomeHostController extends GetxController {
  List<Map<String, String>> gridViewItems = [
    {"image": IconPath.calander, "title": "Bookings Today", "value": "05"},
    {"image": IconPath.earning, "title": "Todays Earning", "value": "\$134.4"},
    {"image": IconPath.toilet, "title": "Active Bathrooms", "value": "02"},
    {"image": IconPath.ratings, "title": "Average Ratings", "value": "4.5"},
  ];
}
