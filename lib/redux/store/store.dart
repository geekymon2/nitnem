import 'package:nitnem/redux/middleware/middleware.dart';
import 'package:nitnem/model/appstate.dart';
import 'package:redux/redux.dart';
import 'package:nitnem/redux/reducers/app_state_reducer.dart';


Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: new AppState.initial(),
    middleware: [storeOptionsMiddleware],
  );
}