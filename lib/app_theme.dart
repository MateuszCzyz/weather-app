import 'package:flutter/material.dart';

const primaryColor = 0xFF2d3e50;
const secondaryColor = 0xFF74b8ff;
const primaryTextColor = 0xFFabb3bd;
const secondaryTextColor = 0xFF687687;
const weatherDialogColor = 0xFF44688c;
const weatherDialogSecondaryColor = 0xFFf1f2f6;
const weatherDialogTextColor = 0xFFf9fafe;

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(primaryColor),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        const Color(secondaryColor),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 3,
        color: Color(secondaryColor),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        width: 2,
        color: Color(secondaryColor),
      ),
    ),
  ),
  textTheme: const TextTheme(
      headline1: TextStyle(
        color: Color(primaryTextColor),
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
      headline2: TextStyle(
        color: Color(secondaryTextColor),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        color: Color(secondaryTextColor),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      )),
);
