
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/data/languagedata.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/models/themes.dart';
import 'package:nitnem/state/appstate.dart';

//AppState Persistent Options
String themeSelector(AppState state) => (state != null) ? state.options.themeName : ThemeName.Default.toString();
bool showReaderOptionSelector(AppState state) => (state != null) ? state.showReaderOptions : false;
double textScaleValueSelector(AppState state) => (state != null) ? state.options.textScaleValue : 1.0;
bool isBoldSelector(AppState state) => (state != null) ? state.options.bold : false;
bool showStatusSelector(AppState state) => (state != null) ? state.options.showStatus : false;

//AppState Volatile Options
String languageSelector(AppState state) => (state != null) ? state.options.languageName : languages[0].title;
String pathDataSelector(AppState state) => (state != null) ? state.pathData : AppConstants.EMPTY_STRING;
String pathTitleSelector(AppState state) => (state != null) ? state.pathTitle : 
AppConstants.EMPTY_STRING;
double scrollOffsetSelector(AppState state) => (state != null) ? getScrollOffsetForThisPath(state.options.scrollOffset, state.pathId): 0.0;
double maxOffsetSelector(AppState state) => (state != null) ? getMaxOffsetForThisPath(state.options.scrollOffset, state.pathId): 0.0;
String timeStringSelector(AppState state) => (state != null) ? state.statusTime : AppConstants.EMPTY_STRING;
int batteryPercSelector(AppState state) => (state != null) ? state.batteryPerc : 0.0;
bool saveScrollPositionSelector(AppState state) => (state != null) ? state.options.saveScrollPosition : false;

double getScrollOffsetForThisPath(Map<String, ScrollInfo> scrollPos, int id) {
  return scrollPos[id.toString()].scrollOffset;
}

double getMaxOffsetForThisPath(Map<String, ScrollInfo> scrollPos, int id) {
  return scrollPos[id.toString()].maxOffset;
}