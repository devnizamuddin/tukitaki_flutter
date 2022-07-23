import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../components/drawer.dart';
import '../../../config/app_themes.dart';
import '../../../utils/button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppThemes.bgColor,
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        drawer: const TukiTakiDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // CustomContainer(),
              PrimaryButton(
                  onPressed: () {
                    controller.showCreateNewTeamDialog();
                  },
                  text: 'Create New Team'),
              const SizedBox(height: 10),
              COutlineButton(onPressed: () {}, text: 'Join A Team'),
              Expanded(
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
                  itemCount: controller.listOfTeams.length,
                  itemBuilder: (BuildContext context, int index) {
                    final team = controller.listOfTeams[index];
                    return Card(
                      elevation: 4,
                      child: InkWell(
                        splashColor: AppThemes.PrimaryColor.withOpacity(0.5),
                        onTap: () => controller.onTapTeam(),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.home, color: AppThemes.PrimaryColor, size: 50),
                              Text(
                                team.name ?? '',
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
            ],
          ),
        ));
  }
}
