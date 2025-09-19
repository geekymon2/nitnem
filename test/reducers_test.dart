import 'package:flutter_test/flutter_test.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/redux/reducers/app_state_reducer.dart';
import 'package:nitnem/state/appstate.dart';

void main() {
  group('AppState Reducer', () {
    test('ChangeThemeAction updates themeName', () {
      final initialState = AppState.initial();
      final action = ChangeThemeAction('Dark');
      final newState = appReducer(initialState, action);
      expect(newState.options.themeName, 'Dark');
    });

    test('ToggleBoldAction updates bold', () {
      final initialState = AppState.initial();
      final action = ToggleBoldAction(true);
      final newState = appReducer(initialState, action);
      expect(newState.options.bold, true);
    });

    test('ToggleStatusAction updates showStatus', () {
      final initialState = AppState.initial();
      final action = ToggleStatusAction(true);
      final newState = appReducer(initialState, action);
      expect(newState.options.showStatus, true);
    });
  });
}
