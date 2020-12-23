import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/data/themedata.dart';
import 'package:nitnem/models/language.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/pages/options.dart';
import 'package:nitnem/redux/actions/actions.dart';
import 'package:nitnem/redux/selectors/selectors.dart';
import 'package:nitnem/state/appstate.dart';
import 'package:redux/redux.dart';
import 'package:battery/battery.dart';

class ReaderScreen extends StatefulWidget {
  ReaderScreen({
    Key key,
  }) : super(key: key);

  @override
  _MyReaderPageState createState() => _MyReaderPageState();
}

class _MyReaderPageState extends State<ReaderScreen> {
  ScrollController _controller;
  Timer _statusTimer;
  Battery _battery;
  Timer _timer;

  void initReaderScreen(Store<AppState> store) {
    //init status bar time.
    _statusTimer = Timer.periodic(
        Duration(seconds: AppConstants.STATUS_TIME_UPDATE_INTERVAL_SECONDS),
        (Timer t) => _updateStatusTime());

    //init status bar battery indicator
    _battery = Battery();
    _battery.batteryLevel.then((level) {
      store.dispatch(UpdateStatusBatteryPercAction(level));
    });

    _battery.onBatteryStateChanged.listen((BatteryState state) {
      _battery.batteryLevel.then((level) {
        store.dispatch(UpdateStatusBatteryPercAction(level));
      });
    });

    //init the scroll controller, lets set the initial state to beginning.
    //wait a bit to let all async actions to finish before scrolling to position.
    _controller = ScrollController(initialScrollOffset: 0.0);
    Timer(Duration(milliseconds: 500), () {
      _navigateToScrollPositionForFirstTime();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateStatusTime();
    });
  }

  _navigateToScrollPositionForFirstTime() {
    final int id = StoreProvider.of<AppState>(context).state.pathId;
    final bool savePos =
        StoreProvider.of<AppState>(context).state.options.saveScrollPosition;
    final double loadedScrollOffset = StoreProvider.of<AppState>(context)
        .state
        .options
        .scrollOffset[id.toString()]
        .scrollOffset;
    final double offset = savePos ? loadedScrollOffset : 0.0;
    _controller.animateTo(offset,
        duration: new Duration(milliseconds: 500), curve: Curves.ease);
    StoreProvider.of<AppState>(context).dispatch(
        UpdateStatusScrollPercentageAction(
            ScrollInfo(id, offset, _controller.position.maxScrollExtent)));
  }

  _updateScrollPosition() {
    final int id = StoreProvider.of<AppState>(context).state.pathId;
    //distpatch action to update scroll position indicator
    final double maxOffset = _controller.position.maxScrollExtent;
    final double offset = _controller.offset;
    StoreProvider.of<AppState>(context).dispatch(
        UpdateStatusScrollPercentageAction(ScrollInfo(id, offset, maxOffset)));
  }

  _onEndScroll(ScrollMetrics metrics) {
    _updateScrollPosition();
  }

  bool _checkTopActionVisibility() {
    if (_controller.hasClients && _controller.position.maxScrollExtent > 0.0) {
      return _controller.offset == _controller.position.maxScrollExtent;
    } else {
      return false;
    }
  }

  String _calculateScrollPerc(double offset, double maxoffset) {
    final double scrollPerc =
        (offset != 0.0) ? (offset / maxoffset) * 100 : 0.0;
    return scrollPerc.toStringAsFixed(2);
  }

  void _updateStatusTime() {
    var now = new DateTime.now();
    String timeString = new DateFormat().add_jm().format(now);
    StoreProvider.of<AppState>(context)
        .dispatch(UpdateStatusTimeAction(timeString));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    printInfoMessage('[BUILD] ReaderScreen');
    //Only the bottom UI overlay is enabled, hiding the system status bar when in reading pane
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    var result = WillPopScope(
        onWillPop: () {
          StoreProvider.of<AppState>(context)
              .dispatch(ClearReaderOptionsToggleAction());
          return new Future.value(true);
        },
        child: StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            onInit: (store) => initReaderScreen(store),
            builder: (context, vm) {
              return Scaffold(
                  body: Container(
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(
                              AppConstants.READERTHEME_BACK_OPACITY),
                          BlendMode.dstATop),
                      image: new AssetImage("assets/themes/" +
                          StoreProvider.of<AppState>(context)
                              .state
                              .options
                              .themeName +
                          ".jpg"),
                      repeat: ImageRepeat.repeat,
                    )),
                    child: Scrollbar(
                      child: NotificationListener<ScrollNotification>(
                        child: CustomScrollView(
                            controller: _controller,
                            slivers: <Widget>[
                              SliverAppBar(
                                backgroundColor:
                                    isDark ? kFlutterBlue : theme.primaryColor,
                                actions: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.settings),
                                    onPressed: vm.onToggleReaderOptions,
                                  )
                                ],
                                pinned: false,
                                snap: false,
                                floating: true,
                                expandedHeight: vm.showReaderOptions
                                    ? AppConstants.EXPANDED_APP_BAR
                                    : AppConstants.COLLAPSED_APP_BAR,
                                flexibleSpace: FlexibleSpaceBar(
                                  title: Text((vm.showReaderOptions)
                                      ? AppConstants.EMPTY_STRING
                                      : vm.nitnemPathTitle),
                                  background: OptionsPage(readerMode: true),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Scrollbar(
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                        AppConstants.READER_PADDING),
                                    child: MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                        textScaleFactor: vm.textScaleValue,
                                      ),
                                      child: Text(
                                        vm.pathData,
                                        textAlign: TextAlign.left,
                                        style: new TextStyle(
                                          height: 2.0,
                                          fontFamily:
                                              getLanguageMenuItemValueByName(
                                                      vm.languageName)
                                                  .fontName,
                                          fontSize:
                                              getLanguageMenuItemValueByName(
                                                      vm.languageName)
                                                  .fontSize,
                                          fontWeight: (vm.isBold)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollEndNotification) {
                            _onEndScroll(scrollNotification.metrics);
                          }
                          return false;
                        },
                      ),
                    ),
                  ),
                  bottomNavigationBar: vm.showStatus
                      ? MediaQuery(
                          data: MediaQuery.of(context).copyWith(
                            textScaleFactor: 1.0,
                          ),
                          child: new Container(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  AppConstants.STATUSBAR_PADDING),
                              child: new Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: new Row(
                                        children: <Widget>[
                                          Icon(Icons.battery_std, size: 12),
                                          Text(
                                            vm.batteryPerc.toString() + "%",
                                            textAlign: TextAlign.left,
                                            style: new TextStyle(
                                              fontFamily: AppConstants
                                                  .STATUSBAR_FONT_FAMILY,
                                              fontSize: AppConstants
                                                  .STATUSBAR_FONT_SIZE,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        vm.statusTime,
                                        textAlign: TextAlign.left,
                                        style: new TextStyle(
                                          fontFamily: AppConstants
                                              .STATUSBAR_FONT_FAMILY,
                                          fontSize:
                                              AppConstants.STATUSBAR_FONT_SIZE,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      vm.nitnemPathTitle,
                                      textAlign: TextAlign.center,
                                      style: new TextStyle(
                                        fontFamily:
                                            AppConstants.STATUSBAR_FONT_FAMILY,
                                        fontSize:
                                            AppConstants.STATUSBAR_FONT_SIZE,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      (vm.dnd) ? "DND" : "",
                                      textAlign: TextAlign.right,
                                      style: new TextStyle(
                                        fontFamily:
                                            AppConstants.STATUSBAR_FONT_FAMILY,
                                        fontSize: AppConstants
                                            .STATUSBAR_FONT_SIZE_SMALL,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      _calculateScrollPerc(
                                              vm.scrollOffset, vm.maxOffset) +
                                          "%",
                                      textAlign: TextAlign.right,
                                      style: new TextStyle(
                                        fontFamily:
                                            AppConstants.STATUSBAR_FONT_FAMILY,
                                        fontSize:
                                            AppConstants.STATUSBAR_FONT_SIZE,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            color: AppConstants.STATUSBAR_BACK_COLOR,
                          ))
                      : null,
                  floatingActionButton: Visibility(
                      visible: _checkTopActionVisibility(),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: FloatingActionButton(
                          onPressed: () {
                            _controller.animateTo(0.0,
                                duration: new Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          child: Icon(Icons.vertical_align_top_rounded),
                          backgroundColor: Colors.blue,
                        ),
                      )));
            }));
    return result;
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    //All overlays are enabled with the system status bar when in home screen
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    _statusTimer?.cancel();
    _statusTimer = null;
    _timer?.cancel();
    _timer = null;
    _battery = null;
    super.dispose();
  }
}

class _ViewModel {
  final void Function() onToggleReaderOptions;
  final String languageName;
  final bool showReaderOptions;
  final double textScaleValue;
  final bool isBold;
  final bool showStatus;
  final String pathData;
  final String nitnemPathTitle;
  final double scrollOffset;
  final double maxOffset;
  final String statusTime;
  final int batteryPerc;
  final bool saveScrollPosition;
  final bool dnd;

  _ViewModel(
      {@required this.onToggleReaderOptions,
      @required this.languageName,
      @required this.showReaderOptions,
      @required this.textScaleValue,
      @required this.isBold,
      @required this.showStatus,
      @required this.pathData,
      @required this.nitnemPathTitle,
      @required this.scrollOffset,
      @required this.maxOffset,
      @required this.statusTime,
      @required this.batteryPerc,
      @required this.saveScrollPosition,
      @required this.dnd});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onToggleReaderOptions: () {
        store.dispatch(ToggleReaderOptionsAction());
      },
      languageName: languageSelector(store.state),
      showReaderOptions: showReaderOptionSelector(store.state),
      textScaleValue: textScaleValueSelector(store.state),
      isBold: isBoldSelector(store.state),
      showStatus: showStatusSelector(store.state),
      pathData: pathDataSelector(store.state),
      nitnemPathTitle: pathTitleSelector(store.state),
      scrollOffset: scrollOffsetSelector(store.state),
      maxOffset: maxOffsetSelector(store.state),
      statusTime: timeStringSelector(store.state),
      batteryPerc: batteryPercSelector(store.state),
      saveScrollPosition: saveScrollPositionSelector(store.state),
      dnd: dndStatusSelector(store.state),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ViewModel &&
          runtimeType == other.runtimeType &&
          languageName == other.languageName &&
          showReaderOptions == other.showReaderOptions &&
          textScaleValue == other.textScaleValue &&
          isBold == other.isBold &&
          showStatus == other.showStatus &&
          pathData == other.pathData &&
          nitnemPathTitle == other.nitnemPathTitle &&
          scrollOffset == other.scrollOffset &&
          statusTime == other.statusTime &&
          batteryPerc == other.batteryPerc &&
          saveScrollPosition == other.saveScrollPosition;

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      languageName.hashCode ^
      showReaderOptions.hashCode ^
      textScaleValue.hashCode ^
      isBold.hashCode ^
      showStatus.hashCode ^
      pathData.hashCode ^
      nitnemPathTitle.hashCode ^
      scrollOffset.hashCode ^
      statusTime.hashCode ^
      batteryPerc.hashCode ^
      saveScrollPosition.hashCode;
}
