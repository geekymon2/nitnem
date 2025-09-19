import 'package:flutter/material.dart';

TextTheme buildTextTheme(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(fontFamily: 'GoogleSans'),
  );
}

TextTheme buildPrimaryTextTheme(TextTheme base, Color textColor) {
  return base.copyWith(
    titleMedium: base.titleMedium!.copyWith(color: textColor),
  );
}
