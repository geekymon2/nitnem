import 'package:redux/redux.dart';

import '../../data/pathtiledata.dart';
import '../actions/actions.dart';

final baaniOrderIdReducer = combineReducers<List<dynamic>>([
  TypedReducer<List<dynamic>, BaaniOrderChangeAction>(
    _activeBaaniOrderChangeReducer,
  ),
]);

List<dynamic> _activeBaaniOrderChangeReducer(
  List<dynamic> itemIds,
  BaaniOrderChangeAction action,
) {
  return PathTileData.items.map((item) => item.id).toList();
}
