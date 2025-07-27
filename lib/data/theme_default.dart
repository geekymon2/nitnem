import 'package:flutter/material.dart';

import 'themetextbuilder.dart';

ThemeData buildLightTheme() {
  const Color primaryColor = Color(0xFF0175c2);
  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: Colors.blue,
    error: const Color(0xFFB00020),
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    highlightColor: Colors.blueGrey,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color(0xffbbdefb),
      inactiveTrackColor: Color(0xff1565c0),
      disabledActiveTrackColor: Color(0x52303f9f),
      disabledInactiveTrackColor: Color(0x1f303f9f),
      activeTickMarkColor: Color(0x8a0d47a1),
      inactiveTickMarkColor: Color(0x8a3f51b5),
      disabledActiveTickMarkColor: Color(0x1fc5cae9),
      disabledInactiveTickMarkColor: Color(0x1f303f9f),
      thumbColor: Color(0xff64b5f6),
      disabledThumbColor: Color(0x52303f9f),
      thumbShape: RoundSliderThumbShape(),
      overlayColor: Color(0x293f51b5),
      valueIndicatorColor: Color(0xff3f51b5),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xff0000ff),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ), tabBarTheme: TabBarThemeData(indicatorColor: Colors.white),
  );
  return base.copyWith(
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
  );
}
