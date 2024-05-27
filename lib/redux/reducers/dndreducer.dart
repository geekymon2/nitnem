// import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';

final dndReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleDNDAction>(_activeDNDReducer),
]);

bool _activeDNDReducer(bool isDND, ToggleDNDAction action) {
  if (action.isDnd) {
    if (action.hasNPAccess) {
      // FlutterDnd.setInterruptionFilter(
      //     FlutterDnd.INTERRUPTION_FILTER_NONE); //Supress All Notifications
    } else {
      // FlutterDnd.gotoPolicySettings();
    }
  } else {
    // FlutterDnd.setInterruptionFilter(
    //     FlutterDnd.INTERRUPTION_FILTER_ALL); //No notifications are supressed
  }

  return action.isDnd;
}
