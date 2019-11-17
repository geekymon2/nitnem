import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final textScaleReducer = combineReducers<double>([
  TypedReducer<double, TextScaleAction>(_activeTextScaleReducer),
]);

double _activeTextScaleReducer(double scale, TextScaleAction action) {
  return action.scale;
}