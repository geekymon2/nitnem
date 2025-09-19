import 'dart:async';

import 'package:flutter/services.dart' show rootBundle;
import 'package:nitnem/data/pathtiledata.dart';
import 'package:nitnem/models/language.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:redux/redux.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../persistence/persistence.dart';

void storeOptionsMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  AppState state = store.state;

  if (action is ToggleScreenAwakeAction) {
    WakelockPlus.toggle(enable: action.isAwake);

    state = state.copyWith(
      options: state.options.copyWith(screenAwake: action.isAwake),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is BaaniOrderSaveAction) {
    state = state.copyWith(
      options: state.options.copyWith(baaniOrderedIds: action.baaniOrder),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is BaaniOrderResetAction) {
    state = state.copyWith(
      options: state.options.copyWith(
        baaniOrderedIds: PathTileData.defaultOrderIds,
      ),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleBoldAction) {
    state = state.copyWith(
      options: state.options.copyWith(bold: action.isBold),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is UpdateStatusScrollPercentageAction) {
    Map<String, ScrollInfo> scrollPos = state.options.scrollOffset;
    scrollPos.update(
      action.scrollInfo.id.toString(),
      (ScrollInfo val) => action.scrollInfo,
    );
    state = state.copyWith(
      options: state.options.copyWith(scrollOffset: scrollPos),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleStatusAction) {
    state = state.copyWith(
      options: state.options.copyWith(showStatus: action.showStatus),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is ToggleReadingPositionSaveAction) {
    state = state.copyWith(
      options: state.options.copyWith(saveScrollPosition: action.savePos),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is TextScaleAction) {
    state = state.copyWith(
      options: state.options.copyWith(textScaleValue: action.scale),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is ChangeLanguageAction) {
    state = state.copyWith(
      options: state.options.copyWith(languageName: action.language),
    );
    saveOptionsToPrefs(state.options);
  }

  if (action is ChangeLanguageAndFetchNitnemPathAction) {
    loadAsset(
      action.pathFilePrefix +
          '_' +
          getLanguageMenuItemValueByName(action.language).langCode,
    ).then((pathData) {
      state = state.copyWith(
        pathData: pathData,
        options: state.options.copyWith(languageName: action.language),
      );
      saveOptionsToPrefs(state.options);
      store.dispatch(NitnemPathLoadedAction(pathData));
    });
  }

  if (action is ChangeThemeAction) {
    state = state.copyWith(
      options: state.options.copyWith(themeName: action.themeName),
    );
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
    //Sort the baani order based on the stored preferences
    PathTileData.items.sort(
      (a, b) => action.options.baaniOrderedIds
          .indexOf(a.id)
          .compareTo(action.options.baaniOrderedIds.indexOf(b.id)),
    );
    //Apply wakelock settings based on the stored preferences
    WakelockPlus.toggle(enable: action.options.screenAwake);
  }

  next(action);
}

Future<String> loadAsset(String assetPath) async {
  return await rootBundle.loadString('assets/path/' + assetPath + '.txt');
}
