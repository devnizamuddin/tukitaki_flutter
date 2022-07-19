import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future<void> loader({String? msg}) => EasyLoading.show(
      status: msg ?? 'Please wait',
      maskType: EasyLoadingMaskType.none,
      indicator: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          // SvgPicture.asset(AppAssets.ASSET_ERP_LOGO, color: Colors.white),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(child: CircularProgressIndicator(color: Colors.yellow)),
          ),
        ],
      ),
    );

loaderDismiss() => EasyLoading.dismiss();
