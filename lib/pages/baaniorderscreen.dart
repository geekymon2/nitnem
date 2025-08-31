import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/models/pathtile.dart';
import 'package:nitnem/navigation/appnavigator.dart';
import 'package:redux/redux.dart';

import '../data/pathtiledata.dart';
import '../redux/actions/actions.dart';
import '../state/appstate.dart';

class BaaniOrderScreen extends StatelessWidget {
  BaaniOrderScreen({required Key key}) : super(key: key);

  static final GlobalKey<ScaffoldState> _baaniOrderScreenScaffoldKey =
      GlobalKey<ScaffoldState>();

  Widget buildNitnemTile(BuildContext context, PathTile item) {
    var listTile = ListTile(
      key: UniqueKey(),
      onTap: () => (),
      dense: false,
      leading: new Image.asset(
        'assets/images/book.png',
        fit: BoxFit.fill,
        width: 36,
      ),
      title: Text(
        item.title,
        style: new TextStyle(
          fontFamily: AppConstants.HOME_LISTITEM_FONT,
          fontSize: AppConstants.HOME_LISTITEM_FONT_SIZE,
          fontWeight: FontWeight.w700,
        ),
      ),
      trailing: Icon(Icons.drag_indicator),
      subtitle: Text(
        item.gurmukhi,
        style: new TextStyle(
          fontFamily: AppConstants.HOME_LISTSUBITEM_FONT,
          fontSize: AppConstants.HOME_LISTSUBITEM_FONT_SIZE,
          fontWeight: FontWeight.w700,
        ),
      ),
    );

    return listTile;
  }

  @override
  Widget build(BuildContext context) {
    printInfoMessage('[BUILD] HomeScreen');
    final ThemeData theme = Theme.of(context);

    Iterable<Widget> listTiles = PathTileData.items.map<Widget>(
      (PathTile item) => buildNitnemTile(context, item),
    );

    var result = StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return Scaffold(
          key: _baaniOrderScreenScaffoldKey,
          appBar: AppBar(
            backgroundColor: theme.primaryColor,
            centerTitle: true,
            title: Text("Change Baani Order"),
            leading: IconButton(
              onPressed: () {
                AppNavigator.goBack(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  vm.onOrderSaveAction(context);
                },
              ),
            ],
          ),
          body: Scrollbar(
            child: ReorderableListView(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              onReorder: (int oldIndex, int newIndex) {
                printInfoMessage("Old: $oldIndex, New: $newIndex");
              },
              children: listTiles.toList(),
            ),
          ),
        );
      },
    );

    return result;
  }
}

class _ViewModel {
  final void Function(BuildContext) onOrderSaveAction;

  _ViewModel({required this.onOrderSaveAction});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onOrderSaveAction: (BuildContext ctx) {
        StoreProvider.of<AppState>(ctx).dispatch(SaveBaaniOrderChangeAction());
        AppNavigator.goBack(ctx);
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
