import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final themeReducer = combineReducers<String>([
  TypedReducer<String, ChangeThemeAction>(_activeThemeReducer),
]);

String _activeThemeReducer(String themeName, ChangeThemeAction action) {
  return action.themeName;
}