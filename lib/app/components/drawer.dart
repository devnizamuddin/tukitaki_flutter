import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class TukiTakiDrawer extends StatelessWidget {
  const TukiTakiDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(child: SizedBox()),
          ListTile(
            onTap: () => () {},
            leading: const Icon(Icons.share, color: Colors.white),
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
            leading: const Icon(Icons.exit_to_app, color: Colors.white),
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
