import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemes {
  static const Color PrimaryColor = Color(0xffE67E22);
  static const Color PrimaryDarkColor = Color(0xFFD35400);
  static const Color AccentColor = Color(0xffF1C40F);
  static const Color bgColor = Color(0xFFE9EBF0);
  static const Color lebelTxtColor = Color(0xFF595D69);

  static ThemeData lightTheme() => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppThemes.PrimaryDarkColor,
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          elevation: 0,
          backgroundColor: PrimaryColor,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        scaffoldBackgroundColor: PrimaryColor,
        primaryColor: PrimaryColor,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: PrimaryColor),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          labelStyle: TextStyle(color: lebelTxtColor, fontSize: 14),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppThemes.PrimaryColor),
            textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      );
}
