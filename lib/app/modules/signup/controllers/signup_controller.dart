import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../config/firestore_ref.dart';
import '../../../models/user.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/helper.dart';
import '../../../utils/snackbar.dart';

class SignupController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late FocusNode nameFnode;
  late FocusNode emailFnode;
  late FocusNode passFnode;

  RxBool obscurePassField = true.obs;
  //final _box = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signupWithEmailAndPassword() async {
    nameFnode.unfocus();
    emailFnode.unfocus();
    passFnode.unfocus();
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text.trim(),
        );
        EasyLoading.dismiss();
        String? current = userCredential.user?.email;
        helloSnack('Login', current ?? 'Successful');
        await addUserToFireStore(userCredential.user!.uid);
        Get.offAllNamed(Routes.HOME);
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

  Future<void> addUserToFireStore(String uid) async {
    return FirestoreCollection.user
        .doc(uid)
        .set(
          UserModel(
            id: uid,
            email: emailController.text,
            name: nameController.text,
            password: passwordController.text,
          ).toMap(),
        )
        .then((_) => helloSnack('Success', 'Successfully registerd!'))
        .catchError((error) => helloSnack('Error', '$error!'));
  }

  Future<void> onObscureTap() async {
    obscurePassField.value = !obscurePassField.value;
  }

  // Future<void> saveLoginInfo() async {
  //   _box.write(AppGetStorages.KEY_EMAIL, emailController.text);
  //   _box.write(AppGetStorages.KEY_PASSWORD, passwordController.text);
  // }

  goToSignUpPage() {
    Get.toNamed(Routes.SIGNUP);
  }

  requestPermission() async {
    // if (GetPlatform.isAndroid && !await Permission.phone.request().isGranted) {
    //   await errorSnack('You have to accept permission to run the app properly');
    // }
  }

  @override
  void onInit() async {
    nameFnode = FocusNode();
    emailFnode = FocusNode();
    passFnode = FocusNode();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    //text editing controller
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    //focus node
    nameFnode.dispose();
    emailFnode.dispose();
    passFnode.dispose();
    loaderDismiss();
    super.onClose();
  }
}
