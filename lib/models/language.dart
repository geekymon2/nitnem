import 'package:flutter/material.dart';
import 'package:nitnem/data/languagedata.dart';

class LanguageMenuItem {
  LanguageMenuItem({this.title, this.icon, this.langCode, this.fontName, this.fontSize});
 
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


