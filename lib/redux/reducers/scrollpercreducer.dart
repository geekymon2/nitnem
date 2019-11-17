import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final scrollPercReducer = combineReducers<Map<String, ScrollInfo>>([
  TypedReducer<Map<String, ScrollInfo>, UpdateStatusScrollPercentageAction>(_activeScrollPercReducer),
]);

Map<String, ScrollInfo> _activeScrollPercReducer(Map<String, ScrollInfo> info, UpdateStatusScrollPercentageAction action) {
  //construct the complete map from the info present in action ScrollInfo and return the map
  Map<String, ScrollInfo> newScrollPos = info;
  newScrollPos.update(action.scrollInfo.id.toString(), (ScrollInfo val) => action.scrollInfo);
  return newScrollPos;
}