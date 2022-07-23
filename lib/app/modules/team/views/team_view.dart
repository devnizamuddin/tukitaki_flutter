import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/models/team.dart';

import '../controllers/team_controller.dart';

class TeamView extends GetView<TeamController> {
  const TeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeamModel team = Get.arguments;
    debugPrint(team.toString());
    return Scaffold(
        backgroundColor: AppThemes.bgColor,
        appBar: AppBar(
          title: Text(team.name ?? 'Team'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.createNewTaskDialog();
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Obx(
                () => Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: context.isPhone
                          ? 2
                          : context.isSmallTablet
                              ? 3
                              : 4,
                      childAspectRatio: 4 / 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: controller.listOfTask.length,
                    itemBuilder: (BuildContext context, int index) {
                      final task = controller.listOfTask[index];
                      return Card(
                        elevation: 4,
                        child: InkWell(
                          splashColor: AppThemes.PrimaryColor.withOpacity(0.5),
                          onTap: () => controller.onTapTask(task),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.people, color: AppThemes.PrimaryColor, size: 50),
                                Text(
                                  task.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(color: AppThemes.PrimaryColor, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
