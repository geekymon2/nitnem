import 'package:flutter/material.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/themes/themedata.dart';

enum ThemeName { Default, Stars, Forest, Ethnic, Floral, Wood }

class NitnemTheme {
  NitnemTheme(this.name, this.data);

  final ThemeName name;
  final ThemeData data;
}

NitnemTheme getThemeByName(String name) {
  try {
    ThemeName enumName = ThemeName.values.firstWhere(
      (e) => e.toString() == name,
    );

    switch (enumName) {
      case ThemeName.Default:
        return defaultTheme;
      case ThemeName.Stars:
        return starsTheme;
      case ThemeName.Forest:
        return forestTheme;
      case ThemeName.Ethnic:
        return ethnicTheme;
      case ThemeName.Floral:
        return floralTheme;
      case ThemeName.Wood:
        return woodTheme;
    }
  } on StateError catch (e) {
    printWarnMessage(
      "Unable to load theme $name, reverting to default. Error message is - " +
          e.toString(),
    );
    return defaultTheme;
  }
}
