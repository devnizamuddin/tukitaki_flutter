import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/firestore_ref.dart';
import 'package:tukitaki_flutter/app/modules/home/controllers/home_controller.dart';

import '../../../models/team.dart';

class TaskController extends GetxController {
  RxList<TeamModel> listOfTeams = (<TeamModel>[]).obs;
  final HomeController _homeController = Get.find();

  Future<void> getMyTeams() async {
    final QuerySnapshot querySnapshot = await FirestoreCollection.task.where("membersId", arrayContains: _homeController.user.value?.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      listOfTeams.value = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot queryDocumentSnapshot) => TeamModel.fromMap(queryDocumentSnapshot.data() as Map<String, dynamic>),
          )
          .toList();
    }
    debugPrint(listOfTeams.toString());
  }

  @override
  void onInit() {
    super.onInit();
  }
}
