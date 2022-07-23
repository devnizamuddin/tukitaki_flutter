import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/team_controller.dart';

class TeamView extends GetView<TeamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TeamView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TeamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
