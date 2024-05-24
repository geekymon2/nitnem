import 'package:flutter/widgets.dart';

class AppRoute {
  const AppRoute({
    required this.routeName,
    required this.buildRoute,
  });

  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($routeName)';
  }
}
