import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/utils/button.dart';

import '../../../config/app_themes.dart';
import '../../../utils/text_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppThemes.bgColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            AppTitleText('TukiTaki'),
            const SizedBox(height: 50),
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    focusNode: controller.emailFnode,
                    keyboardType: TextInputType.name,
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.person),
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter user email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => TextFormField(
                      focusNode: controller.passFnode,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: controller.obscurePassField.value,
                      controller: controller.passwordController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(CupertinoIcons.lock),
                        labelText: 'Password',
                        suffixIcon: IconButton(onPressed: controller.onObscureTap, icon: Icon(controller.obscurePassField.value ? CupertinoIcons.eye : CupertinoIcons.eye_slash)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(onPressed: controller.login, text: 'LOGIN'),
                  COutlineButton(
                      onPressed: () {
                        //s Get.to(() => const SignupView());
                      },
                      text: 'SIGN UP'),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Utility Management\nSoftware for any Organization',
                      style: TextStyle(letterSpacing: 1, height: 2, fontWeight: FontWeight.bold, color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
