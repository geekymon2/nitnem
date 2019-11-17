import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final readerOptionsReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleReaderOptionsAction>(_activeReaderOptionsReducer),
  TypedReducer<bool, ClearReaderOptionsToggleAction>(_activeClearReaderOptionsReducer),
]);

bool _activeReaderOptionsReducer(bool status, ToggleReaderOptionsAction action) {
  return !status;
}

bool _activeClearReaderOptionsReducer(bool status, ClearReaderOptionsToggleAction action) {
  return false;
}