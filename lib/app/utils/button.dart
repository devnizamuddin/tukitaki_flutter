import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ElevatedButton PrimaryButton({required VoidCallback? onPressed, required String text}) {
  return ElevatedButton(onPressed: onPressed, child: Text(text));
}

// ignore: non_constant_identifier_names
Widget OutlineButton({required Function onPressed, required String text}) {
  return ElevatedButton(
      onPressed: () async {
        onPressed;
      },
      child: Text(text));
}
