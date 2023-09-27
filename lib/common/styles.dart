import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white              = Color(0xffffffff);
const black              = Color(0xff000000);
const blue               = Color(0xff1b5a90);
const pink               = Color(0xffc14b7f);
const lightGrey          = Color(0xffe6e6e6);
const bgColor            = Color(0xfff8f9fb);
const green              = Color(0xff6ed8aa);
const skyblue            = Color(0xff00d1f2);
const yellow             = Colors.yellow;
Color? grey200           = Colors.grey[200];
Color? grey300           = Colors.grey[300];
Color? grey400           = Colors.grey[400];
Color? grey500           = Colors.grey[500];
Color? grey600           = Colors.grey[600];
Color? grey700           = Colors.grey[700];
Color? grey800           = Colors.grey[800];
Color? grey900           = Colors.grey[900];

ralewayRegular(color,double fontsize,double letterSpacing) => GoogleFonts.raleway(fontSize: fontsize, fontWeight: FontWeight.normal, color: color, letterSpacing: letterSpacing,);
ralewaySemiBold(color,double fontsize) => GoogleFonts.raleway(fontSize: fontsize, fontWeight: FontWeight.w600, color: color,);
ralewayBold(color,double fontsize) => GoogleFonts.raleway(fontSize: fontsize, fontWeight: FontWeight.bold, color: color);
ralewayLight(color,double fontsize, double letterSpacing) => GoogleFonts.raleway(fontSize: fontsize, fontWeight: FontWeight.w300, color: color, letterSpacing: letterSpacing,);
ralewayMedium(color, double fontsize) => GoogleFonts.raleway(fontSize : fontsize,fontWeight:  FontWeight.w500,color: color,letterSpacing: 0,);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: blue,
  scaffoldBackgroundColor: bgColor,
  dialogBackgroundColor: white,
  indicatorColor: blue,
  appBarTheme:  const AppBarTheme(
    backgroundColor: bgColor,
    foregroundColor: blue,
    iconTheme: IconThemeData(
      color: black,
    ),
    elevation: 3,
  ),
  iconTheme: const IconThemeData(
    color: black,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: blue, // Change button color here
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(blue),
      backgroundColor: MaterialStateProperty.all<Color>(blue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        )
      )
    )
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all<Color?>(white),
    fillColor:MaterialStateProperty.all<Color?>(green),
    overlayColor:MaterialStateProperty.all<Color?>(black),
    splashRadius: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0), // You can adjust the radius as needed
    ),
  ),
  dividerTheme: DividerThemeData(
    color: black.withOpacity(0.2),
    thickness: 0.4
  ),
  inputDecorationTheme: InputDecorationTheme(
    iconColor: grey500,
    suffixIconColor: grey500,
    prefixIconColor: grey500,
    errorMaxLines: 2,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: pink, 
        width: 1.0
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    filled: true,
    fillColor : white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
  ),
  radioTheme:  RadioThemeData(
    fillColor: MaterialStateProperty.all<Color?>(black),
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: blue,
  scaffoldBackgroundColor: bgColor,
  dialogBackgroundColor: white,
  indicatorColor: blue,
  appBarTheme:  const AppBarTheme(
    backgroundColor: white,
    shadowColor: black,
    surfaceTintColor: white,
    iconTheme: IconThemeData(
      color: black,
    ),
    elevation: 0.5,
  ),
  iconTheme: const IconThemeData(
    color: black,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: blue, // Change button color here
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(blue),
      foregroundColor: MaterialStateProperty.all<Color>(blue),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        )
      )
    )
  ),
  checkboxTheme: CheckboxThemeData(
    checkColor: MaterialStateProperty.all<Color?>(white),
    fillColor:MaterialStateProperty.all<Color?>(green),
    overlayColor:MaterialStateProperty.all<Color?>(black),
    splashRadius: 0.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0), // You can adjust the radius as needed
    ),
  ),
  dividerTheme: DividerThemeData(
    color: black.withOpacity(0.2),
    thickness: 0.4
  ),
  inputDecorationTheme:  InputDecorationTheme(
    iconColor: grey500,
    suffixIconColor: grey500,
    prefixIconColor: grey500,
    errorMaxLines: 2,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: pink, 
        width: 1.0
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: grey500!, 
        width: 1.0
      ),
    ),
    filled: true,
    fillColor : white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
  ),
  radioTheme:  RadioThemeData(
    fillColor: MaterialStateProperty.all<Color?>(black),
  ),
);