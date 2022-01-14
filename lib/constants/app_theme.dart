import 'package:flutter/material.dart';
import 'package:my_lettutor_app/constants/colors.dart';

final ThemeData themeDataLight = ThemeData(
  primarySwatch: MyColor.white,
//   colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.blue),
  disabledColor: Colors.grey[50],
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline2: TextStyle(
      color: Color(0XFF0071F0),
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: const Color(0xFF0E78EF),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: const Color(0XFF0071F0),
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.blue,
    selectionHandleColor: Colors.blue,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.blue, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
);

final ThemeData themeDataPink = ThemeData(
  primarySwatch: Colors.pink,
//   colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.pink),
  disabledColor: Colors.grey[50],
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    headline2: TextStyle(
      color: Colors.pink,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontSize: 18,
    ),
    subtitle1: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.normal,
      fontSize: 16,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: Colors.pink,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.pink,
      onPrimary: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.pink,
    selectionHandleColor: Colors.pink,
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 15,
    ),
    
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.pink, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.red),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
);
