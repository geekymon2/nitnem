import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final batteryPercReducer = combineReducers<int>([
  TypedReducer<int, UpdateStatusBatteryPercAction>(_activeBatteryPercReducer),
]);

int _activeBatteryPercReducer(int batteryLevel, UpdateStatusBatteryPercAction action) {
  return action.batteryLevel;
}