import 'package:nitnem/redux/middleware/middleware.dart';
import 'package:nitnem/redux/reducers/app_state_reducer.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:redux/redux.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: new AppState.initial(),
    middleware: [storeOptionsMiddleware],
  );
}
