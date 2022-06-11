import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final lightThemeData = ThemeData(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    fontFamily: GoogleFonts.lato().fontFamily,
    primarySwatch: Colors.deepPurple,
    primaryTextTheme: GoogleFonts.latoTextTheme(),
  );
}
