import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/models/task.dart';
import 'package:tukitaki_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:uuid/uuid.dart';

import '../../../config/firestore_ref.dart';
import '../../../utils/dialog.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/textfield.dart';

class TeamController extends GetxController {
  final _homeController = Get.find<HomeController>();
  TextEditingController? _taskNameController;
  TextEditingController? _taskDescController;
  final Uuid _uuid = const Uuid();

  RxList<TaskModel> listOfTask = (<TaskModel>[]).obs;

  Future<void> getMyTasks() async {
    final QuerySnapshot querySnapshot = await FirestoreCollection.task.get();

    //  final user = UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
    if (querySnapshot.docs.isNotEmpty) {
      listOfTask.value = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot queryDocumentSnapshot) => TaskModel.fromMap(queryDocumentSnapshot.data() as Map<String, dynamic>),
          )
          .toList();
    }
    debugPrint(listOfTask.toString());
  }

  onTapTask(TaskModel taskModel) {}

  createNewTaskDialog() async {
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
        await createNewTask();
      },
      acceptButton: 'Create',
    );
  }

  createNewTask() async {
    final String uuid = _uuid.v4();

    if (_taskNameController!.text.isEmpty) {
      errorSnack('Task name is required');
      return;
    }

    await FirestoreCollection.task
            .doc(uuid)
            .set(
              TaskModel(
                id: uuid,
                name: _taskNameController!.text,
                description: _taskDescController!.text,
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
  void onInit() {
    getMyTasks();
    _taskNameController = TextEditingController();
    _taskDescController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {}
}
