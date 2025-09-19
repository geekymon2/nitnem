import 'package:flutter/material.dart';

class AppNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/home');
  }

  static void goToReader(BuildContext context) {
    Navigator.pushNamed(context, '/reader');
  }

  static void goToIntro(BuildContext context) {
    Navigator.pushNamed(context, '/intro');
  }

  static void goToBaaniOrder(BuildContext context) {
    Navigator.pushNamed(context, '/order');
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
