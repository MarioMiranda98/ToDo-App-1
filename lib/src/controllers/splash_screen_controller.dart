import 'package:get/get.dart';

import 'package:to_do_app_1/src/pages/home_page/home_page.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToLoginPage();
  }

  void _goToLoginPage() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(HomePage(), transition: Transition.cupertino);
    });
  }
}