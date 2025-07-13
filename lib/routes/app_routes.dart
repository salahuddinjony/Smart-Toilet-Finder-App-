import 'package:get/get.dart';
import 'package:mrweekes229/features/guest_flow/splasho_screen/screen/splasho_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";

  static String getLoginScreen() => loginScreen;
  static String splashoScreen = '/splashscreen';

  static List<GetPage> routes = [
    GetPage(name: splashoScreen, page: () => const SplashoScreen()),
  ];
}
