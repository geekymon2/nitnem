import 'package:flutter/foundation.dart' show TargetPlatform;

TargetPlatform getTargetPlatformByName(String name) {
  return TargetPlatform.values.firstWhere((e) => e.toString() == name);
}
