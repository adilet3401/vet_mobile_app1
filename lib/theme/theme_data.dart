import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xff01A560),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xff01A560)),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}
