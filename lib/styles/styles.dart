import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = const Color(0xFF9DB2CE);
Color subColor50 = const Color(0x80383636);
Color subColor75 = const Color(0xBF383636);
Color subColor85 = const Color(0xD9383636);
Color otherColor = const Color(0xFF545454);
Color otherColor50 = const Color(0x80545454);
Color otherColor85 = const Color(0xD9545454);
Color black10 = const Color(0x1A000000);
Color black15 = const Color(0x26000000);
Color black25 = const Color(0x40000000);
Color black35 = const Color(0x59000000);
Color black50 = const Color(0x80000000);
Color black75 = const Color(0xBF000000);
Color black85 = const Color(0xD9000000);
Color errorColor = const Color(0xFFCC3300);
Color successColor = const Color(0xFF00CC33);

TextStyle text9(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 12, fontWeight: weight, color: color);
TextStyle text10(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 13.3, fontWeight: weight, color: color);
TextStyle text11(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 14.6, fontWeight: weight, color: color);
TextStyle text12(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 16, fontWeight: weight, color: color);
TextStyle text13(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 17.3, fontWeight: weight, color: color);
TextStyle text14(
        {FontWeight weight = FontWeight.normal, Color color = Colors.black}) =>
    GoogleFonts.poppins(fontSize: 18.6, fontWeight: weight, color: color);

// Cannot mix 2018 and 2021 terms in call to TextTheme() constructor.
final kTextTheme = TextTheme(
  bodySmall: GoogleFonts.poppins(),
  bodyMedium: GoogleFonts.poppins(),
  bodyLarge: GoogleFonts.poppins(),
  headlineSmall: GoogleFonts.poppins(),
  headlineMedium: GoogleFonts.poppins(),
  headlineLarge: GoogleFonts.poppins(),
  titleSmall: GoogleFonts.poppins(),
  titleMedium: GoogleFonts.poppins(),
  titleLarge: GoogleFonts.poppins(),
);
