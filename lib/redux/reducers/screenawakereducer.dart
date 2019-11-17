import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final screenAwakeReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleScreenAwakeAction>(_activeScreenAwakeReducer),
]);

bool _activeScreenAwakeReducer(bool isAwake, ToggleScreenAwakeAction action) {
  return action.isAwake;
}