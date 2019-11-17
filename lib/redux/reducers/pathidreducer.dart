import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final pathIdReducer = combineReducers<int>([
  TypedReducer<int, FetchNitnemPathAction>(_activePathIdReducer),
]);

int _activePathIdReducer(int id, FetchNitnemPathAction action) {
  return action.path.id;
}