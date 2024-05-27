import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:nitnem/data/languagedata.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:nitnem/data/pathtiledata.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/models/themes.dart';
import 'dart:convert';

@immutable
@JsonSerializable()
class AppOptions {
  AppOptions(
      {required this.themeName,
      required this.bold,
      required this.showStatus,
      required this.textScaleValue,
      required this.languageName,
      required this.screenAwake,
      required this.saveScrollPosition,
      required this.scrollOffset,
      required this.doNotDisturb,
      required this.hasNPAccess});

  final String themeName;
  final bool bold;
  final bool showStatus;
  final double textScaleValue;
  final String languageName;
  final bool screenAwake;
  final bool saveScrollPosition;
  final Map<String, ScrollInfo> scrollOffset;
  final bool doNotDisturb;
  final bool hasNPAccess;

  factory AppOptions.initial() => AppOptions(
      themeName: ThemeName.Default.toString(),
      bold: false,
      showStatus: false,
      textScaleValue: 1.0,
      languageName: languages[0].toString(),
      screenAwake: false,
      saveScrollPosition: false,
      scrollOffset: new Map.fromIterable(PathTileData.items,
          key: (v) => v.id.toString(),
          value: (v) => new ScrollInfo(v.id, 0.0, 0.0)),
      doNotDisturb: false,
      hasNPAccess: false);

  AppOptions copyWith(
      {String? themeName,
      bool? bold,
      bool? showStatus,
      double? textScaleValue,
      String? languageName,
      bool? screenAwake,
      bool? saveScrollPosition,
      Map<String, ScrollInfo>? scrollOffset,
      bool? doNotDisturb,
      bool? hasNPAccess}) {
    return AppOptions(
        themeName: themeName ?? this.themeName,
        bold: bold ?? this.bold,
        showStatus: showStatus ?? this.showStatus,
        textScaleValue: textScaleValue ?? this.textScaleValue,
        languageName: languageName ?? this.languageName,
        screenAwake: screenAwake ?? this.screenAwake,
        saveScrollPosition: saveScrollPosition ?? this.saveScrollPosition,
        scrollOffset: scrollOffset ?? this.scrollOffset,
        doNotDisturb: doNotDisturb ?? this.doNotDisturb,
        hasNPAccess: hasNPAccess ?? this.hasNPAccess);
  }

  @override
  bool operator ==(Object other) {
    if (runtimeType != other.runtimeType) return false;
    final AppOptions typedOther = other as AppOptions;
    return themeName == typedOther.themeName &&
        bold == typedOther.bold &&
        showStatus == typedOther.showStatus &&
        textScaleValue == typedOther.textScaleValue &&
        languageName == typedOther.languageName &&
        screenAwake == typedOther.screenAwake &&
        saveScrollPosition == typedOther.saveScrollPosition &&
        scrollOffset == typedOther.scrollOffset &&
        doNotDisturb == typedOther.doNotDisturb &&
        hasNPAccess == typedOther.hasNPAccess;
  }

  @override
  int get hashCode => Object.hashAll([
        themeName,
        bold,
        showStatus,
        textScaleValue,
        languageName,
        screenAwake,
        saveScrollPosition,
        scrollOffset,
        doNotDisturb,
        hasNPAccess
      ]);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map();
    map["themeName"] = this.themeName;
    map["bold"] = this.bold;
    map["showStatus"] = this.showStatus;
    map["textScaleValue"] = this.textScaleValue;
    map["languageName"] = this.languageName;
    map["screenAwake"] = this.screenAwake;
    map["saveScrollPosition"] = this.saveScrollPosition;
    map["scrollOffset"] = json.encode(this.scrollOffset);
    map["doNotDisturb"] = this.doNotDisturb;
    return map;
  }

  @override
  String toString() {
    //construct scroll position offsets
    String pos = "";
    scrollOffset.forEach((k, v) => pos += "$k: ${v.scrollOffset}, ");

    return '[theme: $themeName, bold: $bold, status: $showStatus, scale: $textScaleValue, lang: $languageName, awake: $screenAwake, savepos: $saveScrollPosition, pos: $pos], dnd: $doNotDisturb';
  }
}
