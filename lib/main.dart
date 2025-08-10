import 'package:flutter/material.dart';
import 'package:nitnem/app.dart';
import 'package:nitnem/redux/store/store.dart';

import 'common/printmessage.dart';

void main() async {
  var store = await createStore();
  printInfoMessage('Initial state: ${store.state}');
  runApp(NitnemApp(store));
}
