import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/user.dart';
import 'package:tukitaki_flutter/app/utils/text_view.dart';

import '../routes/app_pages.dart';

// ignore: must_be_immutable
class TukiTakiDrawer extends StatelessWidget {
  TukiTakiDrawer({Key? key, required this.userModel}) : super(key: key);
  UserModel? userModel;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppThemes.bgColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTitleText('TukiTaki', color: AppThemes.PrimaryColor, fontSize: 48),
              const SizedBox(height: 20),
              SmallTitleText(userModel?.name ?? ''),
              SmallText(userModel?.email ?? ''),
            ],
          )),
          ListTile(
            onTap: () => () {},
            leading: const Icon(Icons.home, color: AppThemes.PrimaryDarkColor),
            title: const Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            leading: const Icon(Icons.exit_to_app, color: AppThemes.PrimaryDarkColor),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'App Version : 1.0.0',
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
