import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nitnem/common/printmessage.dart';
import 'package:nitnem/navigation/appnavigator.dart';
import 'package:nitnem/constants/appconstants.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _splashTimer;
  String _versionName = ' ';

  @override
  void initState() {
    super.initState();
    _splashTimer = Timer(Duration(seconds: AppConstants.SPLASH_WAIT), () => AppNavigator.goToHome(context));
    _initGetPackageInfo();
  }

  @override
  void dispose() {
    _splashTimer.cancel();
    super.dispose();
  }

  _initGetPackageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String versionName = packageInfo.version;

    setState(() {
      _versionName = versionName;
    });
  }

  double getRadius() {
    double width = MediaQuery.of(context).size.width;
    if (width <= AppConstants.DEVICE_SMALL_RES) {
      return AppConstants.SPLASH_ICON_RADIUS_SMALL;
    }
    else {
      return AppConstants.SPLASH_ICON_RADIUS;
    }
  }

  @override
  Widget build(BuildContext context) {
    printInfoMessage('[BUILD] SplashScreen');
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.blue.shade900),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: getRadius(),
                          child: new SplashIcon()
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  AppConstants.SPLASH_TITLE_TEXT,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Kingthings',
                      fontSize: AppConstants.SPLASH_TITLE_TEXT_SIZE),
                )
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        AppConstants.SPLASH_MESSAGE,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: AppConstants.SPLASH_MESSAGE_FONT_SIZE,
                            fontFamily: 'Sansation',
                            color: Colors.white),
                      ),
                    ),

                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'v' + _versionName,
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: AppConstants.SPLASH_MESSAGE_FONT_SIZE,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SplashIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double size;
    if (width <= AppConstants.DEVICE_SMALL_RES) {
      size = AppConstants.SPLASH_ICON_SIZE_SMALL;
    }
    else {
      size = AppConstants.SPLASH_ICON_SIZE;
    }

    var assetImage = new AssetImage('assets/images/khanda.png');
    var image = new Image(image: assetImage, width:size, height: size);
    return new Container(child: image);
  }
}