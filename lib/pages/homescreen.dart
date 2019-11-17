import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:nitnem/data/themedata.dart';
import 'package:nitnem/models/pathtile.dart';
import 'package:nitnem/data/pathtiledata.dart';
import 'package:nitnem/navigation/appnavigator.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:redux/redux.dart';

import 'backdrop.dart';

const Duration _kFrontLayerSwitchDuration = Duration(milliseconds: 300);
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key key, 
    @required this.optionsPage,
  }) : super(key: key);

  final Widget optionsPage;

  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static const AnimatedSwitcherLayoutBuilder _centerHomeLayout = AnimatedSwitcher.defaultLayoutBuilder;

  static Widget _topHomeLayout(Widget currentChild, List<Widget> previousChildren) {
    List<Widget> children = previousChildren;
    if (currentChild != null)
      children = children.toList()..add(currentChild);
    return Stack(
      children: children,
      alignment: Alignment.topCenter,
    );
  }

  ///Determine title size based on resolution
  double getTitleFontSize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width <= AppConstants.DEVICE_SMALL_RES) {
      return AppConstants.HOME_TITLE_FONT_SIZE_SMALL;
    }
    else {
      return AppConstants.HOME_TITLE_FONT_SIZE;
    }
  }


  ///Builds a nitnem paath line entry
  Widget buildNitnemTile(BuildContext context, PathTile item, _ViewModel vm) {
    var listTile = ListTile(
        onTap: () => vm.onPathClickAction(context, item),
        dense: false,
        leading: new Image.asset('assets/images/book.png', fit: BoxFit.fill,width: 36),
        title: Text(
          item.title,
            style: new TextStyle(
              fontFamily: AppConstants.HOME_LISTITEM_FONT,
              fontSize: AppConstants.HOME_LISTITEM_FONT_SIZE,
              fontWeight: FontWeight.w700
            ),
          
          ),
        trailing: Icon(Icons.keyboard_arrow_right),
        subtitle: Text(
          item.gurmukhi,
          style: new TextStyle(
            fontFamily: AppConstants.HOME_LISTSUBITEM_FONT,
            fontSize: AppConstants.HOME_LISTSUBITEM_FONT_SIZE,
            fontWeight: FontWeight.w700
          )
        )
      );
    return MergeSemantics(
      child: listTile,
    );
  }

  @override
  Widget build(BuildContext context) {
    printInfoMessage('[BUILD] HomeScreen');
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final MediaQueryData media = MediaQuery.of(context);
    final bool centerHome = media.orientation == Orientation.portrait && media.size.height < 800.0;
    
    const Curve switchOutCurve = Interval(0.4, 1.0, curve: Curves.fastOutSlowIn);
    const Curve switchInCurve = Interval(0.4, 1.0, curve: Curves.fastOutSlowIn);
    
    var result = StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        Iterable<Widget> listTiles = PathTileData.items.map<Widget>((PathTile item) => buildNitnemTile(context, item, vm));
        listTiles = ListTile.divideTiles(context: context, tiles: listTiles);        
        return Scaffold(
        key: scaffoldKey,
        backgroundColor: isDark ? kFlutterBlue : theme.primaryColor,     
        body: Backdrop (
          backTitle: const Text('Options'),
          backLayer: optionsPage,
          frontAction: AnimatedSwitcher(
            duration: _kFrontLayerSwitchDuration,
            switchOutCurve: switchOutCurve,
            switchInCurve: switchInCurve
          ),
          frontTitle: 
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              children: [
                new Image.asset('assets/images/floral-left.png', fit: BoxFit.fill,width: AppConstants.HOME_FLORAL_WIDTH),
                Text(AppConstants.HOME_TITLE_TEXT,
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontFamily: AppConstants.HOME_TITLE_FONT,
                    fontSize: getTitleFontSize(context),
                    fontWeight: FontWeight.bold
                  ),
                ),
                new Image.asset('assets/images/floral-right.png', fit: BoxFit.fill, width: AppConstants.HOME_FLORAL_WIDTH)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ),
          frontHeading: Container(height: 24.0),
          frontLayer: AnimatedSwitcher(
            duration: _kFrontLayerSwitchDuration,
            switchOutCurve: switchOutCurve,
            switchInCurve: switchInCurve,
            layoutBuilder: centerHome ? _centerHomeLayout : _topHomeLayout,
            child: Scrollbar(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                children: listTiles.toList(),
              ),
            ),
          ),
        ),
      );
    });
    return result;
  }
}

class _ViewModel {
  final void Function(BuildContext, PathTile) onPathClickAction;

  _ViewModel({
    @required this.onPathClickAction,
    });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onPathClickAction: (BuildContext ctx, PathTile path){
        store.dispatch(FetchNitnemPathAction(path, store.state.options.languageName));
        AppNavigator.goToReader(ctx);  
      },
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}