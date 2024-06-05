//import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final dndReducer = combineReducers<bool>([
  TypedReducer<bool, ToggleDNDAction>(_activeDNDReducer),
]);

bool _activeDNDReducer(bool isDND, ToggleDNDAction action) {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (action.isDnd) {
    if (action.hasNPAccess) {
      flutterLocalNotificationsPlugin.cancelAll();
    } else {
      //Does not have access for Notifications
    }
  }

  return action.isDnd;
}
