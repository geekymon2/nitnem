import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final pathFilePrefixReducer = combineReducers<String>([
  TypedReducer<String, FetchNitnemPathAction>(_activePathDataReducer),
]);

String _activePathDataReducer(String pathData, FetchNitnemPathAction action) {
  return action.path.filePrefix;
}