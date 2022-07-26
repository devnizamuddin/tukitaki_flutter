import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/user.dart';
import '../../../routes/app_pages.dart';
import 'package:uuid/uuid.dart';

import '../../../config/firestore_ref.dart';
import '../../../services/services.dart';
import '../../../utils/dialog.dart';
import '../../../utils/snackbar.dart';
import '../../../utils/textfield.dart';
import '../../../models/team.dart';

class HomeController extends GetxController {
  final Uuid _uuid = const Uuid();
  TextEditingController? _teamNameController;
  TextEditingController? _teamDescController;
  TextEditingController? _teamIdController;

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  RxList<TeamModel> listOfTeams = (<TeamModel>[]).obs;

  Future<void> setProfile() async {
    user.value = await Services.fetchProfileData();
    debugPrint(user.value.toString());
  }

  Future<void> getMyTeams() async {
    final QuerySnapshot querySnapshot = await FirestoreCollection.team.where("membersId", arrayContains: user.value?.id).get();

    if (querySnapshot.docs.isNotEmpty) {
      listOfTeams.value = querySnapshot.docs
          .map(
            (QueryDocumentSnapshot queryDocumentSnapshot) => TeamModel.fromMap(queryDocumentSnapshot.data() as Map<String, dynamic>),
          )
          .toList();
    }
    debugPrint(listOfTeams.toString());
  }

  onTapTeam(TeamModel teamModel) {
    debugPrint(teamModel.toString());

    Get.toNamed(Routes.TEAM, arguments: teamModel);
  }

  showCreateNewTeamDialog() async {
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

  Future<void> createNewTeam() async {
    final String uuid = _uuid.v4();

    if (_teamNameController!.text.isEmpty) {
      errorSnack('Team name is required');
      return;
    }

    await FirestoreCollection.team
            .doc(uuid)
            .set(
              TeamModel(
                id: uuid,
                ownerId: user.value?.id ?? '',
                code: '',
                name: _teamNameController!.text,
                description: _teamDescController!.text,
                membersId: [
                  user.value?.id ?? ''
                ],
                members: [
                  user.value!
                ],
              ).toMap(),
            )
            .then((_) => successSnack('Team Created Successfully'))

            // .then((_) => Get.offNamedUntil(Routes.MYJOBS, ModalRoute.withName(Routes.HOME)))
            //.then((_) => Services.counterModify('total_jobs', true))
            .catchError((error) => errorSnack('Failed to add Team'))
        //.then((value) => Get.back())
        ;
    await getMyTeams();
  }

  Future<void> createJoinATeamDialog() async {
    await getDialog(
      title: 'Join A Team',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          DialogTextField(hintText: 'Team Id', controller: _teamIdController, textAlign: TextAlign.center),
        ],
      ),
      cancelButton: 'Back',
      acceptButtonFunc: () async {
        Get.back();
        await joinATeam();
      },
      acceptButton: 'Join',
    );
  }

  Future<void> joinATeam() async {
    if (_teamIdController!.text.isEmpty) {
      errorSnack('Team id is required');
      return;
    }
    final DocumentSnapshot documentSnapshot = await FirestoreCollection.team.doc(_teamIdController!.text).get();
    if (documentSnapshot.exists) {
      final team = TeamModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
      team.membersId?.add(user.value?.id ?? '');
      List<String> membersId = team.membersId?.toSet().toList() ?? [];
      team.membersId = membersId;
      team.members?.add(user.value!);
      List<UserModel> members = team.members?.toSet().toList() ?? [];
      team.members = members;
      await FirestoreCollection.team.doc(team.id).set(team.toMap()).then((_) {
        successSnack('Join in Team Successfully');
        getMyTeams();
      }).catchError((error) => errorSnack('Failed to join Team'));
    }
  }

  @override
  void onInit() async {
    _teamNameController = TextEditingController();
    _teamDescController = TextEditingController();
    _teamIdController = TextEditingController();
    await setProfile();
    await getMyTeams();
    super.onInit();
  }

  @override
  void onClose() {
    _teamNameController?.dispose();
    _teamDescController?.dispose();
  }
}
