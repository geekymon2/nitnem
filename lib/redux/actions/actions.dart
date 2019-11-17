import 'package:nitnem/models/pathtile.dart';
import 'package:nitnem/models/scrollinfo.dart';
import 'package:nitnem/state/appoptions.dart';

class ChangeThemeAction {
  final String themeName;

  ChangeThemeAction(this.themeName);
}

class ChangeLanguageAction {
  final String language;
  ChangeLanguageAction(this.language);  
}

class ChangeLanguageAndFetchNitnemPathAction {
  final String language;
  final String pathFilePrefix;
  ChangeLanguageAndFetchNitnemPathAction(this.language, this.pathFilePrefix);  
}

class TextScaleAction {
  final double scale;
  TextScaleAction(this.scale);  
}

class ToggleBoldAction {
  final bool isBold;
  ToggleBoldAction(this.isBold);
}

class ToggleStatusAction {
  final bool showStatus;
  ToggleStatusAction(this.showStatus);
}

class OptionsNotLoadedAction {}

class OptionsLoadedAction {
  final AppOptions options;

  OptionsLoadedAction(this.options);
}

class FetchOptionsAction {}

class ToggleReaderOptionsAction {}

class ClearReaderOptionsToggleAction {}

class NitnemPathLoadedAction{
  final String pathData;

  NitnemPathLoadedAction(this.pathData);
}

class FetchNitnemPathAction {
  final PathTile path;
  final String languageName;
  FetchNitnemPathAction(this.path, this.languageName);  
}

class SendFeedbackAction{}

class UpdateStatusScrollPercentageAction {
  ScrollInfo scrollInfo;
  UpdateStatusScrollPercentageAction(this.scrollInfo);
}

class UpdateStatusTimeAction {
  final String timeString;
  UpdateStatusTimeAction(this.timeString);
}

class UpdateStatusBatteryPercAction {
  final int batteryLevel;
  UpdateStatusBatteryPercAction(this.batteryLevel);
}

class ToggleScreenAwakeAction {
  final bool isAwake;
  ToggleScreenAwakeAction(this.isAwake);
}

class ToggleReadingPositionSaveAction {
  final bool savePos;
  ToggleReadingPositionSaveAction(this.savePos);
}