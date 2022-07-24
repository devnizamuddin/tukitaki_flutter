import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/task.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskModel taskModel = Get.arguments;
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskModel.name),
            IconButton(onPressed: () {}, icon: const Icon(Icons.group_add_outlined))
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
