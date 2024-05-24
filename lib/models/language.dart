import 'package:flutter/material.dart';
import 'package:nitnem/data/languagedata.dart';

class LanguageMenuItem {
  LanguageMenuItem(
      {required this.title,
      required this.icon,
      required this.langCode,
      required this.fontName,
      required this.fontSize});

  String title;
  IconData icon;
  String langCode;
  String fontName;
  double fontSize;

  String toString() {
    return this.title;
  }
}

LanguageMenuItem getLanguageMenuItemValueByName(String name) {
  return languages.firstWhere((e) => e.title == name);
}
