import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/redux/reducers/pathdatareducer.dart';
import 'package:nitnem/redux/reducers/pathfileprefixreducer.dart';
import 'package:nitnem/redux/reducers/pathidreducer.dart';
import 'package:nitnem/redux/reducers/pathtitlereducer.dart';
import 'package:nitnem/redux/reducers/readoptionsreducer.dart';
import 'package:nitnem/redux/reducers/savescrollposreducer.dart';
import 'package:nitnem/redux/reducers/screenawakereducer.dart';
import 'package:nitnem/redux/reducers/scrollpercreducer.dart';
import 'package:nitnem/redux/reducers/statustimereducer.dart';
import 'package:nitnem/state/appoptions.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:url_launcher/url_launcher.dart';

import 'batterypercreducer.dart';
import 'boldreducer.dart';
import 'languagereducer.dart';
import 'statusreducer.dart';
import 'textscalereducer.dart';
import 'themereducer.dart';
import 'dndreducer.dart';

AppState appReducer(AppState state, dynamic action) {
  AppState newState;

  printInfoMessage('[ACTION] ${action.runtimeType}');
  if (action is TextScaleAction ||
      action is ToggleBoldAction ||
      action is ToggleStatusAction ||
      action is ChangeThemeAction ||
      action is ChangeLanguageAndFetchNitnemPathAction ||
      action is ToggleReaderOptionsAction ||
      action is NitnemPathLoadedAction ||
      action is FetchOptionsAction ||
      action is FetchNitnemPathAction ||
      action is ChangeLanguageAction ||
      action is UpdateStatusScrollPercentageAction ||
      action is UpdateStatusTimeAction ||
      action is UpdateStatusBatteryPercAction ||
      action is ToggleScreenAwakeAction ||
      action is ClearReaderOptionsToggleAction ||
      action is ToggleReadingPositionSaveAction ||
      action is ToggleDNDAction) {
    newState = AppState(
      options: AppOptions(
        themeName: themeReducer(state.options.themeName, action),
        bold: boldReducer(state.options.bold, action),
        showStatus: statusReducer(state.options.showStatus, action),
        textScaleValue: textScaleReducer(state.options.textScaleValue, action),
        languageName: languageReducer(state.options.languageName, action),
        screenAwake: screenAwakeReducer(state.options.screenAwake, action),
        saveScrollPosition:
            saveScrollPosReducer(state.options.saveScrollPosition, action),
        scrollOffset: scrollPercReducer(state.options.scrollOffset, action),
        doNotDisturb: dndReducer(state.options.doNotDisturb, action),
      ),
      showReaderOptions: readerOptionsReducer(state.showReaderOptions, action),
      pathData: pathDataReducer(state.pathData, action),
      pathFilePrefix: pathFilePrefixReducer(state.pathFilePrefix, action),
      pathTitle: pathTitleReducer(state.pathTitle, action),
      pathId: pathIdReducer(state.pathId, action),
      statusTime: statusTimeReducer(state.statusTime, action),
      batteryPerc: batteryPercReducer(state.batteryPerc, action),
    );
    printInfoMessage('Option Changed');
  }

  if (action is OptionsLoadedAction) {
    newState = state.copyWith(options: action.options);
    printInfoMessage('Options Loaded');
  }

  if (action is SendFeedbackAction) {
    newState = state;
    launch(AppConstants.FEEDBACK_URL, forceSafariVC: false);
    printInfoMessage('Sending feedback');
  }

  printInfoMessage('[STATE] ${newState.toString()}');
  return newState;
}
