import 'package:flutter/material.dart';
import 'package:nitnem/data/themetextbuilder.dart';

ThemeData buildDarkTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    highlightColor: Colors.grey,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    tabBarTheme: TabBarThemeData(indicatorColor: Colors.white),
  );
  return base.copyWith(
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildPrimaryTextTheme(
      base.primaryTextTheme,
      Colors.black,
    ),
  );
}
