import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/task.dart';
import 'package:tukitaki_flutter/app/models/team.dart';
import 'package:tukitaki_flutter/app/modules/task/views/add_people_view.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskModel taskModel = Get.arguments[0];
    final TeamModel teamModel = Get.arguments[1];
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskModel.name),
            IconButton(
                onPressed: () {
                  Get.to(const AddPeopleView(), arguments: [
                    taskModel,
                    teamModel
                  ]);
                },
                icon: const Icon(Icons.group_add_outlined))
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: taskModel.members?.length,
          itemBuilder: (BuildContext context, int index) {
            final member = taskModel.members?[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(member?.name ?? ''),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
