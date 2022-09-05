import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/firestore_ref.dart';
import '../../../models/task.dart';
import '../../../models/user.dart';
import '../../home/controllers/home_controller.dart';
import '../models/taskMembers.dart';

import '../../../models/team.dart';
import '../../../utils/snackbar.dart';

class TaskController extends GetxController {
  RxList<TeamModel> listOfTeams = (<TeamModel>[]).obs;
  RxList<TaskMemberModel> listOfTaskMembers = (<TaskMemberModel>[]).obs;
  final HomeController homeController = Get.find();

  Future<void> getMyTeams() async {
    final QuerySnapshot querySnapshot = await FirestoreCollection.task.where("membersId", arrayContains: homeController.user.value?.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      listOfTeams.value = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot queryDocumentSnapshot) => TeamModel.fromMap(queryDocumentSnapshot.data() as Map<String, dynamic>),
          )
          .toList();
    }
    debugPrint(listOfTeams.toString());
  }

  addMemberToTask(TaskModel taskModel, UserModel userModel) async {
    TaskMemberModel taskMember = TaskMemberModel(id: userModel.id, name: userModel.name, email: userModel.email, taskSerial: taskModel.taskMembers?.length ?? 0, isTaskdone: false);
    for (TaskMemberModel user in taskModel.taskMembers ?? []) {
      if (user.id == taskMember.id) {
        errorSnack("Already Having this user");
        return;
      }
    }
    taskModel.membersId?.add(taskMember.id);
    taskModel.taskMembers?.add(taskMember);
    await FirestoreCollection.task
            .doc(taskModel.id)
            .set(taskModel.toMap())
            .then((_) => successSnack('Members added Successfully'))

            // .then((_) => Get.offNamedUntil(Routes.MYJOBS, ModalRoute.withName(Routes.HOME)))
            //.then((_) => Services.counterModify('total_jobs', true))
            .catchError((error) => errorSnack('Failed to add Task'))
        //.then((value) => Get.back())
        ;
  }

  setTaskDoneToTaskStatus(TaskModel taskModel, TaskMemberModel taskMember) async {
    TaskMemberModel taskMemberModel = taskMember.copyWith(isTaskdone: !taskMember.isTaskdone);
    taskModel.taskMembers?[taskMember.taskSerial] = taskMemberModel;
    await FirestoreCollection.task
            .doc(taskModel.id)
            .set(taskModel.toMap())
            .then((_) => successSnack('Task Status Updated Successfully'))

            // .then((_) => Get.offNamedUntil(Routes.MYJOBS, ModalRoute.withName(Routes.HOME)))
            //.then((_) => Services.counterModify('total_jobs', true))
            .catchError((error) => errorSnack('Failed to add Task'))
        //.then((value) => Get.back())
        ;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
