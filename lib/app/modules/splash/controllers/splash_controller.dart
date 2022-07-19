import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void navigator() {
    if (FirebaseAuth.instance.currentUser != null) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.HOME);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
