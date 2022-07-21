import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/modules/home/models/team.dart';
import 'package:tukitaki_flutter/app/utils/dialog.dart';
import 'package:tukitaki_flutter/app/utils/snackbar.dart';
import 'package:uuid/uuid.dart';

import '../../../config/firestore_ref.dart';
import '../../../utils/textfield.dart';

class HomeController extends GetxController {
  final Uuid _uuid = const Uuid();
  TextEditingController? _teamNameController;
  TextEditingController? _teamDescController;

  showCreateNewTeamDialog() async {
    // noteFnode.unfocus();
    await getDialog(
      title: 'Create New Team',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Name:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DialogTextField(hintText: 'Team Name', controller: _teamNameController),
          const SizedBox(height: 10),
          const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          DialogTextField(hintText: 'Team Description', controller: _teamDescController, maxLine: 4),
          const SizedBox(height: 10),
        ],
      ),
      cancelButton: 'Back',
      acceptButtonFunc: () async {
        Get.back();
        await createNewTeam();
      },
      acceptButton: 'Create',
    );
  }

  createNewTeam() async {
    final String uuid = _uuid.v4();

    if (_teamNameController!.text.isEmpty) {
      errorSnack('Ream name is required');
      return;
    }

    await FirestoreCollection.team
            .doc(uuid)
            .set(
              TeamModel(
                id: uuid,
                name: _teamNameController!.text,
                description: _teamDescController!.text,
              ).toMap(),
            )
            .then((_) => successSnack('Team Created Successfully'))

            // .then((_) => Get.offNamedUntil(Routes.MYJOBS, ModalRoute.withName(Routes.HOME)))
            //.then((_) => Services.counterModify('total_jobs', true))
            .catchError((error) => errorSnack('Failed to add Team'))
        //.then((value) => Get.back())
        ;
  }

  @override
  void onInit() {
    _teamNameController = TextEditingController();
    _teamDescController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _teamNameController?.dispose();
    _teamDescController?.dispose();
  }
}
