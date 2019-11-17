import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final pathDataReducer = combineReducers<String>([
  TypedReducer<String, NitnemPathLoadedAction>(_activePathDataReducer),
]);

String _activePathDataReducer(String pathData, NitnemPathLoadedAction action) {
  return action.pathData;
}