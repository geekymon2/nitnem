import 'package:flutter/material.dart';
import 'package:nitnem/models/themes.dart';
import 'package:nitnem/themes/theme_ethnic.dart';
import 'package:nitnem/themes/theme_floral.dart';
import 'package:nitnem/themes/theme_forest.dart';
import 'package:nitnem/themes/theme_stars.dart';
import 'package:nitnem/themes/theme_wood.dart';

import 'theme_default.dart';

final NitnemTheme defaultTheme = NitnemTheme(
  ThemeName.Default,
  buildLightTheme(),
);
final NitnemTheme starsTheme = NitnemTheme(ThemeName.Stars, buildDarkTheme());
final NitnemTheme forestTheme = NitnemTheme(
  ThemeName.Forest,
  buildForestTheme(),
);
final NitnemTheme ethnicTheme = NitnemTheme(
  ThemeName.Ethnic,
  buildEthnicTheme(),
);
final NitnemTheme floralTheme = NitnemTheme(
  ThemeName.Floral,
  buildFloralTheme(),
);
final NitnemTheme woodTheme = NitnemTheme(ThemeName.Wood, buildWoodTheme());

final Color kFlutterBlue = Color(0xFF003D75);
