import 'package:almubarok_present/pages/login/login_binding.dart';
import 'package:almubarok_present/pages/login/login_page.dart';
import 'package:almubarok_present/pages/onboarding/on_boarding_binding.dart';
import 'package:almubarok_present/pages/onboarding/on_boarding_page.dart';
import 'package:almubarok_present/pages/splash/splash_binding.dart';
import 'package:almubarok_present/pages/splash/splash_page.dart';
import 'package:almubarok_present/routes/page_names.dart';
import 'package:get/get.dart';

class PageRoutes {
  static final pages = [
    GetPage(
      name: PageName.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PageName.onboarding,
      page: () => OnBoardingPage(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: PageName.login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
