import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/models/language.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/state/appoptions.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../data/pathtiledata.dart';

void storeOptionsMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher next) {
  AppState state = store.state;

  if (action is ToggleScreenAwakeAction) {
    WakelockPlus.toggle(enable: action.isAwake);

    state = state.copyWith(
        options: state.options.copyWith(screenAwake: action.isAwake));
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleBoldAction) {
    state =
        state.copyWith(options: state.options.copyWith(bold: action.isBold));
    saveOptionsToPrefs(state.options);
  }

  if (action is UpdateStatusScrollPercentageAction) {
    Map<String, ScrollInfo> scrollPos = state.options.scrollOffset;
    scrollPos.update(
        action.scrollInfo.id.toString(), (ScrollInfo val) => action.scrollInfo);
    state = state.copyWith(
        options: state.options.copyWith(scrollOffset: scrollPos));
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleStatusAction) {
    state = state.copyWith(
        options: state.options.copyWith(showStatus: action.showStatus));
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleReadingPositionSaveAction) {
    state = state.copyWith(
        options: state.options.copyWith(saveScrollPosition: action.savePos));
    saveOptionsToPrefs(state.options);
  }

  if (action is TextScaleAction) {
    state = state.copyWith(
        options: state.options.copyWith(textScaleValue: action.scale));
    saveOptionsToPrefs(state.options);
  }

  if (action is ChangeLanguageAction) {
    state = state.copyWith(
        options: state.options.copyWith(languageName: action.language));
    saveOptionsToPrefs(state.options);
  }

  if (action is ChangeLanguageAndFetchNitnemPathAction) {
    loadAsset(action.pathFilePrefix +
            '_' +
            getLanguageMenuItemValueByName(action.language).langCode)
        .then((pathData) {
      state = state.copyWith(
          pathData: pathData,
          options: state.options.copyWith(languageName: action.language));
      saveOptionsToPrefs(state.options);
      store.dispatch(NitnemPathLoadedAction(pathData));
    });
  }

  if (action is ChangeThemeAction) {
    state = state.copyWith(
        options: state.options.copyWith(themeName: action.themeName));
    saveOptionsToPrefs(state.options);
  }

  if (action is FetchOptionsAction) {
    loadOptionsFromPrefs().then((options) {
      store.dispatch(OptionsLoadedAction(options));
    });
  }

  if (action is FetchNitnemPathAction) {
    final String? langCode =
        getLanguageMenuItemValueByName(action.languageName).langCode;

    loadAsset(action.path.filePrefix + '_' + langCode!).then((pathData) {
      state = state.copyWith(pathData: pathData);
      store.dispatch(NitnemPathLoadedAction(pathData));
    });
  }

  if (action is OptionsLoadedAction) {
    WakelockPlus.toggle(enable: action.options.screenAwake);
  }

  next(action);
}

void saveOptionsToPrefs(AppOptions options) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var optionsString = json.encode(options.toJson());
  await preferences.setString(
      AppConstants.OPTIONS_SHAREDPREF_KEY, optionsString);
  printInfoMessage('[OPTIONS SAVED]: ${options.toString()}');
}

Future<AppOptions> loadOptionsFromPrefs() async {
  AppOptions options = AppOptions.initial();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(AppConstants.OPTIONS_SHAREDPREF_KEY);
  if (stateString != null) {
    dynamic prefs = json.decode(stateString);

    options = options.copyWith(
        themeName: prefs["themeName"],
        bold: prefs["bold"],
        showStatus: prefs["showStatus"],
        textScaleValue: prefs["textScaleValue"],
        languageName: prefs["languageName"],
        screenAwake: prefs["screenAwake"],
        saveScrollPosition: prefs["saveScrollPosition"],
        scrollOffset: constructScrollPosMap(prefs["scrollOffset"]));
  }

  printInfoMessage('[OPTIONS LOADED: ${options.toString()}');

  return options;
}

Map<String, ScrollInfo> constructScrollPosMap(String scrollPosString) {
  Map<String, dynamic> rawInfo;
  Map<String, ScrollInfo> scrollInfo = new Map<String, ScrollInfo>();

  if (scrollPosString != '') {
    //Raw data contains maps, convert map info into ScrollInfo
    rawInfo = json.decode(scrollPosString);
    rawInfo.forEach((k, v) => scrollInfo.putIfAbsent(
        k, () => new ScrollInfo(v["id"], v["scrollOffset"], v["maxOffset"])));
  } else {
    scrollInfo = new Map.fromIterable(PathTileData.items,
        key: (v) => v.id.toString(),
        value: (v) => new ScrollInfo(v.id, 0.0, 0.0));
  }

  return scrollInfo;
}

Future<String> loadAsset(String assetPath) async {
  return await rootBundle.loadString('assets/path/' + assetPath + '.txt');
}
