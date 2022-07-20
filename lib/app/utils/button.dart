import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ElevatedButton PrimaryButton({required VoidCallback? onPressed, required String text}) {
  return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(text),
      ));
}

// ignore: non_constant_identifier_names
OutlinedButton COutlineButton({required VoidCallback? onPressed, required String text}) {
  return OutlinedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(text),
      ));
}
