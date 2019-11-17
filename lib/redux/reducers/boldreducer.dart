import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final boldReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleBoldAction>(_activeBoldReducer),
]);

bool _activeBoldReducer(bool bold, ToggleBoldAction action) {
  return action.isBold;
}