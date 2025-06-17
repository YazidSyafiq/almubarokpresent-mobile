import 'package:almubarok_present/routes/page_names.dart';
import 'package:almubarok_present/services/local/first_install.dart';
import 'package:almubarok_present/services/local/token.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  Future<void> setup() async {
    bool? firstInstall = await FirstInstall.getFirstInstall();
    if (firstInstall == null || firstInstall == true) {
      Get.offAllNamed(PageName.onboarding);
    } else {
      await checkToken();
    }
  }

  Future<void> checkToken() async {
    String? token = await Token.getToken();
    bool? firstInstall = await FirstInstall.getFirstInstall();
    if (token == null && firstInstall == false) {
      Get.offAllNamed(PageName.login);
    } else {
      Get.offAllNamed(PageName.profile);
    }
  }

  Future<void> saveAuth(String token) async {
    Token.saveToken(token: token);
    checkToken();
  }

  Future<void> logout() async {
    Token.removeToken();
    checkToken();
  }
}
