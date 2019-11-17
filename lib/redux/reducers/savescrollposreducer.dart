import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final saveScrollPosReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleReadingPositionSaveAction>(_activeSaveScrollPosReducer),
]);

bool _activeSaveScrollPosReducer(bool savePos, ToggleReadingPositionSaveAction action) {
  return action.savePos;
}