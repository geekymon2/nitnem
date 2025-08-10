import 'package:flutter_test/flutter_test.dart';
import 'package:nitnem/redux/selectors/selectors.dart';
import 'package:nitnem/state/appstate.dart';

void main() {
  group('Selectors', () {
    test('themeSelector returns themeName', () {
      final state = AppState.initial().copyWith(
        options: AppState.initial().options.copyWith(themeName: 'Light'),
      );
      expect(themeSelector(state), 'Light');
    });

    test('isBoldSelector returns bold', () {
      final state = AppState.initial().copyWith(
        options: AppState.initial().options.copyWith(bold: true),
      );
      expect(isBoldSelector(state), true);
    });

    test('showStatusSelector returns showStatus', () {
      final state = AppState.initial().copyWith(
        options: AppState.initial().options.copyWith(showStatus: true),
      );
      expect(showStatusSelector(state), true);
    });
  });
}
