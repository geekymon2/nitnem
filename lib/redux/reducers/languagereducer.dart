import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final languageReducer = combineReducers<String>([
  TypedReducer<String, ChangeLanguageAndFetchNitnemPathAction>(_activeLanguageFromReaderReducer),
  TypedReducer<String, ChangeLanguageAction>(_activeLanguageReducer),
]);

String _activeLanguageFromReaderReducer(String language, ChangeLanguageAndFetchNitnemPathAction action) {
  return action.language;
}

String _activeLanguageReducer(String language, ChangeLanguageAction action) {
  return action.language;
}