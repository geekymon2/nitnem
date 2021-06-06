
import 'package:flutter/material.dart';
import 'themetextbuilder.dart';

ThemeData buildEthnicTheme() {  
  const Color primaryColor = Color( 0xffffa726 );
  const Color secondaryColor = Color( 0xfffff3e0 );

 
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
        primary: primaryColor,
        primaryVariant: Color( 0xfff57c00 ),
        secondary: secondaryColor,
        secondaryVariant: Color( 0xfff57c00 ),
        surface: Color( 0xffffffff ),
        background: Color( 0xffffcc80 ),
        error: Color( 0xffd32f2f ),
        onPrimary: Color( 0xff000000 ),
        onSecondary: Color( 0xff000000 ),
        onSurface: Color( 0xff000000 ),
        onBackground: Color( 0xff000000 ),
        onError: Color( 0xffffffff ),
        brightness: Brightness.light,
  );
  
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xffffd54f),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    highlightColor: Colors.blueGrey,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Color( 0xffffecb3 ),
      inactiveTrackColor: Color( 0x3dff6f00 ),
      disabledActiveTrackColor: Color( 0x52303f9f ),
      disabledInactiveTrackColor: Color( 0x1f303f9f ),
      activeTickMarkColor: Color( 0x8ac5cae9 ),
      inactiveTickMarkColor: Color( 0x8a3f51b5 ),
      disabledActiveTickMarkColor: Color( 0x1fc5cae9 ),
      disabledInactiveTickMarkColor: Color( 0x1f303f9f ),
      thumbColor: Color( 0xffffca28 ),
      disabledThumbColor: Color( 0x52303f9f ),
      thumbShape: RoundSliderThumbShape(),
      overlayColor: Color( 0x293f51b5 ),
      valueIndicatorColor: Color( 0xff3f51b5 ),
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.onlyForDiscrete,
      valueIndicatorTextStyle: TextStyle(
        color: Color( 0xff0000ff ),
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
  return base.copyWith(
    textTheme: buildTextTheme(base.textTheme),
    primaryTextTheme: buildTextTheme(base.primaryTextTheme),
  );
}
