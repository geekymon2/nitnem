import 'package:flutter/material.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/data/themedata.dart';

enum ThemeName {
  Default,
  Stars,
  Forest,
  Ethnic,
  Floral,
  Wood
}

class NitnemTheme {
  NitnemTheme(this.name, this.data);

  final ThemeName name;
  final ThemeData data;
}

NitnemTheme getThemeByName(String name) {

  try {
    ThemeName enumName = ThemeName.values.firstWhere((e) => e.toString() == name);

    switch (enumName) {
      case ThemeName.Default: return defaultTheme;
      break;
      case ThemeName.Stars: return starsTheme;
      break;
      case ThemeName.Forest: return forestTheme;
      break;
      case ThemeName.Ethnic: return ethnicTheme;
      break;
      case ThemeName.Floral: return floralTheme;
      break;
      case ThemeName.Wood: return woodTheme;
      break;
      default: return defaultTheme;
    }
  }
  on StateError catch (e) {
    printWarnMessage("Unable to load theme $name, reverting to default. Error message is - " + e.toString());
    return defaultTheme;
  }
}
