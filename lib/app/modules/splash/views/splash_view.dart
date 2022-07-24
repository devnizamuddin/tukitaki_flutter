import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tukitaki_flutter/app/config/app_themes.dart';
import 'package:tukitaki_flutter/app/utils/design.dart';
import '../../../utils/text_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.navigator();
    return Scaffold(
        backgroundColor: AppThemes.bgColor,
        body: SafeArea(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomPaint(
                  size: const Size(double.maxFinite, 160), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: CustomPainterTop(),
                ),
                Column(
                  children: [
                    BigTitleText('TukiTaki', fontSize: 48),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SmallTitleText('An apps for income and expenditure calculation and suduled task management'),
                    ),
                  ],
                ),
                CustomPaint(
                  size: const Size(double.maxFinite, 160), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                )
              ],
            ),
          ),
        ));
  }
}
