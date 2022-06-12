import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBlusish = Color(0xff403b58);
  static Color lightBlusish = Vx.indigo500;
  static final lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightBlusish,
    ),
    accentColor: darkBlusish,
    iconTheme: IconThemeData(color: Colors.black),
    buttonColor: darkBlusish,
    canvasColor: creamColor,
    cardColor: Colors.white,
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: Colors.deepPurple,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
  );
  static final darkThemeData = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: lightBlusish,
    ),
    brightness: Brightness.dark,
    accentColor: Colors.white,
    buttonColor: lightBlusish,
    canvasColor: darkcreamColor,
    cardColor: Colors.black,
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: Colors.deepPurple,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
  );
}
