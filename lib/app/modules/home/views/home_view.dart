import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/drawer.dart';
import '../../../config/app_themes.dart';
import '../../../utils/button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemes.bgColor,
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        drawer: const TukiTakiDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CustomContainer(),
              PrimaryButton(
                  onPressed: () {
                    controller.showCreateNewTeamDialog();
                  },
                  text: 'Create New Team'),
              const SizedBox(height: 10),
              COutlineButton(onPressed: () {}, text: 'Join A Team')
            ],
          ),
        ));
  }
}
