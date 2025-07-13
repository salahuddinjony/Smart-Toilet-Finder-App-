import 'package:get/get.dart';

class PackageHoldController extends GetxController {
  var isToggled = false.obs;

  void toggle() {
    isToggled.value = !isToggled.value;
  }
  List<Map<String, String>> gridViewItems = [
    {
      "image": 'assets/icons/icon1.png',
      "title": "Total Packages",
      "value": "123",
    },
    {"image": 'assets/icons/icon2.png', "title": "Pending", "value": "10"},
    {"image": 'assets/icons/icon3.png', "title": "Received", "value": "06"},
    {
      "image": 'assets/icons/icon4.png',
      "title": "Delivered(Handed over)",
      "value": "100",
    },
    {"image": 'assets/icons/icon5.png', "title": "Rejected", "value": "07"},
    {"image": 'assets/icons/icon6.png', "title": "Earnings", "value": "\$3456"},
  ];
}
