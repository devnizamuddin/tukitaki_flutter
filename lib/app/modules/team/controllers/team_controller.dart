import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/task.dart';
import '../../../models/team.dart';
import '../../../models/user.dart';
import '../../home/controllers/home_controller.dart';
import '../../task/models/taskMembers.dart';
import '../../../routes/app_pages.dart';
import 'package:uuid/uuid.dart';

import '../../../config/firestore_ref.dart';
import '../../../utils/dialog.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/textfield.dart';

class TeamController extends GetxController {
  late TextEditingController _taskNameController;
  late TextEditingController _taskDescController;
  final Uuid _uuid = const Uuid();
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  final HomeController _homeController = Get.find();

  RxList<TaskModel> listOfTask = (<TaskModel>[]).obs;

  Future<void> getMyTasks(String teamId) async {
    final QuerySnapshot querySnapshot = await FirestoreCollection.task.where("teamId", isEqualTo: teamId).where('membersId', arrayContains: userId).get().catchError(
      (error) {
        debugPrint(error.toString());
      },
    );

    //  final user = UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    if (querySnapshot.docs.isNotEmpty) {
      listOfTask.value = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot queryDocumentSnapshot) => TaskModel.fromMap(queryDocumentSnapshot.data() as Map<String, dynamic>),
          )
          .toList();
    } else {}
    debugPrint(listOfTask.toString());
  }

  onTapTask(TaskModel taskModel, TeamModel teamModel) {
    Get.toNamed(Routes.TASK, arguments: [
      taskModel,
      teamModel
    ]);
  }

  createNewTaskDialog(String teamId) async {
    await getDialog(
      title: 'Create New Task',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Name:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DialogTextField(hintText: 'Task Name', controller: _taskNameController),
          const SizedBox(height: 10),
          const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DialogTextField(hintText: 'Task Description', controller: _taskDescController, maxLine: 4),
          const SizedBox(height: 10),
        ],
      ),
      cancelButton: 'Back',
      acceptButtonFunc: () async {
        Get.back();
        await createNewTask(teamId);
      },
      acceptButton: 'Create',
    );
  }

  createNewTask(String teamId) async {
    final String uuid = _uuid.v4();

    if (_taskNameController.text.isEmpty) {
      errorSnack('Task name is required');
      return;
    }
    UserModel userModel = _homeController.user.value!;

    TaskMemberModel taskMemberModel = TaskMemberModel(id: userModel.id, name: userModel.name, email: userModel.email, taskSerial: 0, isTaskdone: false);
    await FirestoreCollection.task
            .doc(uuid)
            .set(
              TaskModel(
                id: uuid,
                teamId: teamId,
                ownerId: userId,
                taskMembers: [
                  taskMemberModel
                ],
                membersId: [
                  _homeController.user.value!.id
                ],
                name: _taskNameController.text,
                description: _taskDescController.text,
                type: 1,
              ).toMap(),
            )
            .then((_) => successSnack('Task Created Successfully'))

            // .then((_) => Get.offNamedUntil(Routes.MYJOBS, ModalRoute.withName(Routes.HOME)))
            //.then((_) => Services.counterModify('total_jobs', true))
            .catchError((error) => errorSnack('Failed to add Task'))
        //.then((value) => Get.back())
        ;
  }

  @override
  void onInit() async {
    _taskNameController = TextEditingController();
    _taskDescController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {}
}
