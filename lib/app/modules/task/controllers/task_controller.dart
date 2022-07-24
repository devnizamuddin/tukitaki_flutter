import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/firestore_ref.dart';
import 'package:tukitaki_flutter/app/models/task.dart';
import 'package:tukitaki_flutter/app/models/user.dart';
import 'package:tukitaki_flutter/app/modules/home/controllers/home_controller.dart';

import '../../../models/team.dart';
import '../../../utils/snackbar.dart';

class TaskController extends GetxController {
  RxList<TeamModel> listOfTeams = (<TeamModel>[]).obs;
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
    for (UserModel user in taskModel.members ?? []) {
      if (user.id == userModel.id) {
        errorSnack("Already Having this user");
        return;
      }
    }
    taskModel.membersId?.add(userModel.id);
    taskModel.members?.add(userModel);
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

  @override
  void onInit() {
    super.onInit();
  }
}
