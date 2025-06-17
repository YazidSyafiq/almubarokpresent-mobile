import 'package:almubarok_present/pages/about/about_binding.dart';
import 'package:almubarok_present/pages/about/about_page.dart';
import 'package:almubarok_present/pages/change_password/change_password_binding.dart';
import 'package:almubarok_present/pages/change_password/change_password_page.dart';
import 'package:almubarok_present/pages/login/login_binding.dart';
import 'package:almubarok_present/pages/login/login_page.dart';
import 'package:almubarok_present/pages/onboarding/on_boarding_binding.dart';
import 'package:almubarok_present/pages/onboarding/on_boarding_page.dart';
import 'package:almubarok_present/pages/profile/edit_profile/edit_profile_binding.dart';
import 'package:almubarok_present/pages/profile/edit_profile/edit_profile_page.dart';
import 'package:almubarok_present/pages/profile/personal_data/personal_data_page.dart';
import 'package:almubarok_present/pages/profile/profile_binding.dart';
import 'package:almubarok_present/pages/profile/profile_page.dart';
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
    GetPage(
      name: PageName.profile,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.personalData,
      page: () => PersonalDataPage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: PageName.editProfile,
      page: () => EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: PageName.about,
      page: () => AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: PageName.changePassword,
      page: () => ChangePasswordPage(),
      binding: ChangePasswordBinding(),
    ),
  ];
}
