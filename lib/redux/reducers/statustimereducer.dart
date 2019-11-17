import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final statusTimeReducer = combineReducers<String>([
  TypedReducer<String, UpdateStatusTimeAction>(_activeStatusTimeReducer),
]);

String _activeStatusTimeReducer(String timeString, UpdateStatusTimeAction action) {
  return action.timeString;
}