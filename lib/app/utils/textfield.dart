import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TextField DialogTextField({String? hintText, TextEditingController? controller, int? maxLine, TextAlign? textAlign}) {
  return TextField(
    controller: controller,
    maxLines: maxLine,
    textAlign: textAlign ?? TextAlign.start,
    decoration: InputDecoration(
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 1.0),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      hintText: hintText ?? '',
    ),
  );
}
