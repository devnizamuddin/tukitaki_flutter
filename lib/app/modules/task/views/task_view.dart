import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/task.dart';
import 'package:tukitaki_flutter/app/models/team.dart';
import 'package:tukitaki_flutter/app/modules/task/models/taskMembers.dart';
import 'package:tukitaki_flutter/app/modules/task/views/add_people_view.dart';

import '../../../models/user.dart';
import '../controllers/task_controller.dart';

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
              itemBuilder: (context, index) => buildMembers(controller.listOfTaskMembers[index], controller, taskModel),
              itemCount: controller.listOfTaskMembers.length,
              onReorder: (oldIndex, newIndex) {
                final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
                final member = controller.listOfTaskMembers.removeAt(oldIndex);
                controller.listOfTaskMembers.insert(index, member);
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
