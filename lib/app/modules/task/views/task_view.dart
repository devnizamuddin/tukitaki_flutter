import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_themes.dart';
import '../../../models/task.dart';
import '../../../models/team.dart';
import '../controllers/task_controller.dart';
import '../models/taskMembers.dart';
import 'add_people_view.dart';

class TaskView extends GetView<TaskController> {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TaskModel taskModel = Get.arguments[0];
    controller.listOfTaskMembers.value = taskModel.taskMembers ?? [];
    final TeamModel teamModel = Get.arguments[1];
    return Scaffold(
      backgroundColor: AppThemes.bgColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(taskModel.name),
            if (taskModel.ownerId == controller.homeController.user.value?.id)
              IconButton(
                  onPressed: () {
                    Get.to(const AddPeopleView(), arguments: [
                      taskModel,
                      teamModel
                    ]);
                  },
                  icon: const Icon(Icons.group_add_outlined))
            else
              Container()
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() => ReorderableListView.builder(
              // itemBuilder: (context, index) => buildMembers(controller.listOfTaskMembers[index], controller, taskModel),
              itemBuilder: (context, index) {
                TaskMemberModel taskMember = controller.listOfTaskMembers[index];
                return ListTile(
                  onTap: () {
                    controller.setTaskDoneToTaskStatus(taskModel, taskMember);
                  },
                  key: ValueKey(taskMember),
                  title: Text(taskMember.name),
                  leading: Text(taskMember.isTaskdone ? 'Completed' : 'Yet to Complete'),
                );
              },
              itemCount: controller.listOfTaskMembers.length,
              onReorder: (oldIndex, newIndex) {
                controller.onReOrderTask(oldIndex, newIndex);
              },
            )),
      ),
    );
  }
}

Widget buildMembers(TaskMemberModel taskMember, TaskController taskController, TaskModel taskModel) {
  return ListTile(
    onTap: () {
      taskController.setTaskDoneToTaskStatus(taskModel, taskMember);
    },
    key: ValueKey(taskMember),
    title: Text(taskMember.name),
    leading: Text(taskMember.isTaskdone ? 'Completed' : 'Yet to Complete'),
  );
}
