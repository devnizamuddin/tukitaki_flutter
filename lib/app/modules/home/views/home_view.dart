import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/components/drawer.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        drawer: const TukiTakiDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text('Create New Team')),
            const SizedBox(height: 10),
            TextButton(onPressed: () {}, child: const Text('Join A Team'))
          ],
        ));
  }
}
