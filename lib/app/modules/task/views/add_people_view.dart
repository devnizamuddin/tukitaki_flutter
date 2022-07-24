import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';

import '../controllers/task_controller.dart';

class AddPeopleView extends GetView<TaskController> {
  const AddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: const Text('Add Task Members'),
      ),
    );
  }
}
