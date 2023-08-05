import 'package:flutter/material.dart';

import 'color.dart';

ThemeData appThemaEng = ThemeData(
  fontFamily: 'cairo',
  textTheme: const TextTheme(
      bodySmall: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.black3),
      headlineLarge: TextStyle(
          fontSize: 27, fontWeight: FontWeight.bold, color: AppColor.black),
      displayLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.black),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: AppColor.black),
      titleLarge: TextStyle(fontSize: 22, color: Colors.redAccent),
      labelLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.white),
      displaySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black),
      bodyLarge: TextStyle(fontSize: 12, color: AppColor.black2),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.black2),
      displayMedium: TextStyle(
        fontSize: 40,
        fontFamily: 'viga',
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
          fontSize: 14, fontFamily: 'intar', color: AppColor.hintcolor),
      bodyMedium: TextStyle(
          fontSize: 13,
          fontFamily: 'intar',
          fontWeight: FontWeight.bold,
          color: Colors.black)),
  primarySwatch: Colors.green,
);

ThemeData appThemaArb = ThemeData(
  fontFamily: 'cairo',
  textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.black),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(fontSize: 22, color: Colors.redAccent),
      labelLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: AppColor.white),
      displaySmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.black),
      bodyLarge: TextStyle(fontSize: 12, color: AppColor.black2),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.black2),
      displayMedium: TextStyle(
        fontSize: 40,
        fontFamily: 'viga',
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(fontSize: 14, color: AppColor.hintcolor),
      bodyMedium: TextStyle(
          fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black)),
  primarySwatch: Colors.green,
);
