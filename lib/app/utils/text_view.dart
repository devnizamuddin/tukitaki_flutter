import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Text BigTitleText(String text, {TextAlign? aign, Color? color, double? fontSize}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 32,
      color: color ?? Colors.black,
      shadows: const <Shadow>[
        Shadow(
          offset: Offset(10.0, 10.0),
          blurRadius: 3.0,
          color: Color.fromARGB(255, 170, 170, 170),
        ),
        Shadow(
          offset: Offset(10.0, 10.0),
          blurRadius: 8.0,
          color: Color.fromARGB(122, 242, 242, 255),
        ),
      ],
    ),
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

Text SmallText(String text, {TextAlign? aign, TextStyle? style}) {
  return Text(
    text,
    textAlign: aign ?? TextAlign.center,
    style: style ?? const TextStyle(fontSize: 16),
  );
}
