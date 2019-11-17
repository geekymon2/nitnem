import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final statusReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleStatusAction>(_activeStatusReducer),
]);

bool _activeStatusReducer(bool status, ToggleStatusAction action) {
  return action.showStatus;
}