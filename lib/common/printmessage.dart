import 'package:nitnem/constants/appconstants.dart';

void printInfoMessage(String message) {
  if (AppConstants.LOGGING_ENABLED)
    print("INFO: " + message);
}

void printWarnMessage(String message) { 
  if (AppConstants.LOGGING_ENABLED)
    print("WARN: " + message);
}