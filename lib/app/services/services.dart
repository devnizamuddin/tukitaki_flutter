import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../utils/snackbar.dart';

import '../config/app_config.dart';
import '../config/firestore_ref.dart';
import '../modules/home/controllers/home_controller.dart';
import '../modules/login/models/user_model.dart';
import '../routes/app_pages.dart';

class Services {
  ///FETCH A USER DATA FROM USER COLLECTION
  static Future<UserModel?> fetchProfileData({String? uid}) async {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      final DocumentSnapshot documentSnapshot = await FirestoreCollection.user.doc(uid ?? FirebaseAuth.instance.currentUser?.uid).get();
      if (documentSnapshot.exists) {
        final user = UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        debugPrint(user.toString());
        return user;
      }
    }
  }

  // static Future sendFCM({required String userID, required String title, required String body}) async {
  //   final HomeController _homeController = Get.find();

  //   var data = jsonEncode(<String, dynamic>{
  //     "to": userID,
  //     "priority": "high",
  //     "notification": {
  //       "title": title,
  //       "body": body,
  //       "sound": "default"
  //     }
  //   });
  //   debugPrint(data.toString());
  //   try {
  //     await Dio().post(
  //       'https://fcm.googleapis.com/fcm/send',
  //       options: Options(
  //         headers: <String, String>{
  //           'Content-Type': 'application/json',
  //           'Authorization': 'key=${_homeController.settings.value?.serverKey ?? AppConfig.FCM_SERVER_KEY}',
  //         },
  //       ),
  //       data: data,
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  static counterModify(String key, bool isAddition) async {
    EasyLoading.show();
    await FirestoreCollection.settings.doc('counter').get().then((DocumentSnapshot snapshot) async {
      if (snapshot.exists) {
        var data = snapshot.data() as Map<String, dynamic>;
        await FirestoreCollection.settings.doc('counter').update({
          key: isAddition ? (data[key] as int) + 1 : (data[key] as int) - 1,
        }).catchError((error) => errorSnack('Counter error'));
      }
    });
    EasyLoading.dismiss();
  }

  static Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
