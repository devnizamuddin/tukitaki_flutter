import 'package:flutter/material.dart';
import '../config/app_themes.dart';

// ignore: non_constant_identifier_names
ElevatedButton PrimaryButton({required VoidCallback? onPressed, required String text}) {
  return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(letterSpacing: 1),
        ),
      ));
}

// ignore: non_constant_identifier_names
OutlinedButton COutlineButton({required VoidCallback? onPressed, required String text}) {
  return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shadowColor: AppThemes.AccentColor,
        side: const BorderSide(color: AppThemes.PrimaryColor, width: 2),
        primary: AppThemes.PrimaryDarkColor,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          text,
          style: const TextStyle(letterSpacing: 1, fontSize: 16, fontWeight: FontWeight.bold, color: AppThemes.PrimaryDarkColor),
        ),
      ));
}
