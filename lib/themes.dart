import 'package:flutter/material.dart';

import 'utils/palette.dart';

ThemeData buildThemeData() {
  return ThemeData(
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: Colors.white,
    textTheme: buildTextTheme(),
    appBarTheme: buildAppBarTheme(),
    inputDecorationTheme: buildInputDecorationTheme(),
    primaryColor: Palette.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

buildInputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Palette.primary),
    gapPadding: 10
  );

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20)
  );
}

AppBarTheme buildAppBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(headline6: TextStyle(color: Palette.lightGrey)));
}

TextTheme buildTextTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: Palette.textColor),
      bodyText2: TextStyle(color: Palette.textColor));
}
