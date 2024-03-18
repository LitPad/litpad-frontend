import 'package:flutter/material.dart';

class AppColors {
  static const white = Colors.white;
  static const transparent = Colors.transparent;
  static const grey = Colors.grey;
  static const red = Colors.red;
  static const black = Color(0xFF000000);
  static const primaryPurple = Color(0xFF9255DD);

  static const black600 = Color(0xFF5B5B5B);
  static const black700 = Color(0xFF292D32);

  static const purple900 = Color(0xFF2B1744);
  static const purple100 = Color(0xFFD7BAF3);
  static const purple800 = Color(0xFF3E1E65);

  static const grey900 = Color(0xFF120024);
  static const grey800 = Color(0xFF2C1C3C);
  static const grey600 = Color(0xFF7F7589);
  static const grey400 = Color(0xFFC4BFC8);
  static const grey500 = Color(0xFF727272);
  static const grey300 = Color(0xFFEDEDED);
  static const grey200 = Color(0xFFF6F5F6);

  static const magneta100 = Color(0xFFFFCDF5);
  static const magneta900 = Color(0xFF5A1F52);

  static const green = Color(0xFF00C041);
  static const green100 = Color(0xFFEBFFF2);

  // Linear gradient
  static const avaterContainerLG = LinearGradient(
    colors: [
      Color(0xFFC198EC), // Color #C198EC
      Color(0xFFFB98EA), // Color #FB98EA
    ],
    stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
