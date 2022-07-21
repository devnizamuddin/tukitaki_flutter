import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/app_getstorages.dart';
import '../../../utils/helper.dart';
import '../../../utils/snackbar.dart';
import '../../home/views/home_view.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late FocusNode emailFnode;
  late FocusNode passFnode;

  RxBool rememberPass = false.obs;
  RxBool obscurePassField = true.obs;
  final _box = GetStorage();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    emailFnode.unfocus();
    passFnode.unfocus();
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text.trim(),
        );
        EasyLoading.dismiss();
        String? current = userCredential.user?.email;
        helloSnack('Login', current ?? 'Successful');
        Get.to(() => HomeView());

        // if (userCredential.user != null) {
        //   final user = await Services.fetchProfileData();
        //   if (user != null) {
        //     if (!user.status) {
        //       errorSnack('Your account is inactive');
        //       await FirebaseAuth.instance.signOut();
        //     } else if (user.type != 'user') {
        //       errorSnack('You are not a user');
        //       await FirebaseAuth.instance.signOut();
        //     } else {
        //       Get.offAllNamed(Routes.HOME);
        //     }
        //   } else {
        //     errorSnack('Something went wrong');
        //     await FirebaseAuth.instance.signOut();
        //   }
        // }
      } on FirebaseAuthException catch (e) {
        EasyLoading.dismiss();
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
          errorSnack('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
          errorSnack('Wrong password provided for that user.');
        }
      } catch (e) {
        EasyLoading.dismiss();
        debugPrint(e.toString());
      }
    }
  }

  Future<void> onRememberPassTap(bool? v) async {
    if (v != null) {
      rememberPass.value = v;
      _box.write(AppGetStorages.KEY_REMEMBER_PASS_STATUS, v);
    }
  }

  Future<void> onObscureTap() async {
    obscurePassField.value = !obscurePassField.value;
  }

  Future<void> saveLoginInfo() async {
    _box.write(AppGetStorages.KEY_EMAIL, emailController.text);
    _box.write(AppGetStorages.KEY_PASSWORD, passwordController.text);
  }

  requestPermission() async {
    // if (GetPlatform.isAndroid && !await Permission.phone.request().isGranted) {
    //   await errorSnack('You have to accept permission to run the app properly');
    // }
  }

  @override
  void onInit() async {
    emailFnode = FocusNode();
    passFnode = FocusNode();
    rememberPass.value = _box.read(AppGetStorages.KEY_REMEMBER_PASS_STATUS) ?? false;
    emailController = TextEditingController(text: rememberPass.value ? _box.read(AppGetStorages.KEY_EMAIL) : '');
    passwordController = TextEditingController(text: rememberPass.value ? _box.read(AppGetStorages.KEY_PASSWORD) : '');
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    emailFnode.dispose();
    passFnode.dispose();
    loaderDismiss();
    super.onClose();
  }
}
