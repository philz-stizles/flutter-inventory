import 'package:flutter/material.dart';

class Palette {
  static const Color transparent = Color(0x00000000);
  static const Color scaffold = Color(0xffffffff);
  static const Color primary = Color(0xff6247AA);
  static const Color lightPrimary = Color(0xffae372d);
  static const Color lightGrey = Color(0xffe9ebf5);
  static const Color lightBlue = Color(0xffcfd5ea);
  static const Color white = Color(0xffffffff);
  static const Color green = Color(0xff447604);
  static const Color lightGreen = Color(0xff7eb36e);

  static const Color kprimary = Color(0xFFFF7643);
  static const Color klightPrimary = Color(0xFFFFECDF);
  static const Color secondary = Color(0xff979797);
  static const Color textColor = Color(0xff757575);

  static const Map<int, Color> _swatch = {
    50: Color.fromRGBO(98, 71, 170, .1),
    100: Color.fromRGBO(98, 71, 170, .2),
    200: Color.fromRGBO(98, 71, 170, .3),
    300: Color.fromRGBO(98, 71, 170, .4),
    400: Color.fromRGBO(98, 71, 170, .5),
    500: Color.fromRGBO(98, 71, 170, .6),
    600: Color.fromRGBO(98, 71, 170, .7),
    700: Color.fromRGBO(98, 71, 170, .8),
    800: Color.fromRGBO(98, 71, 170, .9),
    900: Color.fromRGBO(98, 71, 170, 1),
  };

  MaterialColor get primarySwatch {
    return MaterialColor(0xff6247AA, _swatch);
  }

  static const Gradient = LinearGradient(
      colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
}
