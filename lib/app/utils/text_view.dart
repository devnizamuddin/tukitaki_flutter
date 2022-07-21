import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Text BigTitleText(String text, {TextAlign? aign, Color? myColor}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: myColor ?? Colors.black),
  );
}

// ignore: non_constant_identifier_names
Text MediumTitleText(String text, {TextAlign? aign, TextStyle? style}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: style ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
  );
}

// ignore: non_constant_identifier_names
Text SmallTitleText(String text, {TextAlign? aign, TextStyle? style}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: style ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );
}
