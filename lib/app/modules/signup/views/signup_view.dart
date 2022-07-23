import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../config/app_themes.dart';
import '../../../utils/button.dart';
import '../../../utils/text_view.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Container(
        margin: const EdgeInsets.only(top: 32),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppThemes.bgColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            BigTitleText('TukiTaki'),
            const SizedBox(height: 50),
            Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    focusNode: controller.nameFnode,
                    keyboardType: TextInputType.name,
                    controller: controller.nameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.person),
                      labelText: 'Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 20),
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
                  PrimaryButton(onPressed: controller.login, text: 'SIGN UP'),
                  const SizedBox(height: 32),
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
