import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/state/appstate.dart';

//AppState Persistent Options
String themeSelector(AppState state) => state.options.themeName;
bool showReaderOptionSelector(AppState state) => state.showReaderOptions;
double textScaleValueSelector(AppState state) => state.options.textScaleValue;
bool isBoldSelector(AppState state) => state.options.bold;
bool showStatusSelector(AppState state) => state.options.showStatus;

//AppState Volatile Options
String languageSelector(AppState state) => state.options.languageName;
String pathDataSelector(AppState state) => state.pathData;
String pathTitleSelector(AppState state) => state.pathTitle;
double scrollOffsetSelector(AppState state) =>
    getScrollOffsetForThisPath(state.options.scrollOffset, state.pathId);
double maxOffsetSelector(AppState state) =>
    getMaxOffsetForThisPath(state.options.scrollOffset, state.pathId);
String timeStringSelector(AppState state) => state.statusTime;
int batteryPercSelector(AppState state) => state.batteryPerc;
bool saveScrollPositionSelector(AppState state) =>
    state.options.saveScrollPosition;
bool dndStatusSelector(AppState state) => state.options.doNotDisturb;

double getScrollOffsetForThisPath(Map<String, ScrollInfo> scrollPos, int id) {
  //set scroll position for path with does not exist previously in saved options.
  if (id > scrollPos.length) {
    scrollPos[id.toString()] = ScrollInfo(id, 0.0, 0.0);
  }

  return scrollPos[id.toString()]!.scrollOffset;
}

double getMaxOffsetForThisPath(Map<String, ScrollInfo> scrollPos, int id) {
  return scrollPos[id.toString()]!.maxOffset;
}
