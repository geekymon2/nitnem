import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final pathTitleReducer = combineReducers<String>([
  TypedReducer<String, FetchNitnemPathAction>(_activePathTitleReducer),
]);

String _activePathTitleReducer(String pathTitle, FetchNitnemPathAction action) {
  return action.path.title;
}