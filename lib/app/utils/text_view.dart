import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Text AppTitleText(String text, {TextAlign? aign, TextStyle? style}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: style ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
  );
}
