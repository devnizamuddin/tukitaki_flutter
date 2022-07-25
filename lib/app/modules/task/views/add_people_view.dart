import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/team.dart';

import '../../../models/task.dart';
import '../controllers/task_controller.dart';

class AddPeopleView extends GetView<TaskController> {
  const AddPeopleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskModel taskModel = Get.arguments[0];
    final TeamModel teamModel = Get.arguments[1];
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: const Text('Add Task Members'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: teamModel.members?.length,
          itemBuilder: (BuildContext context, int index) {
            final member = teamModel.members?[index];
            return InkWell(
              onTap: () {
                controller.addMemberToTask(taskModel, member!);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(member?.name ?? ''),
                      IconButton(onPressed: () {}, icon: Icon(Icons.add))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
