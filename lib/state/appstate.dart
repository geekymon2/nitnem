import 'package:nitnem/constants/appconstants.dart';

import 'appoptions.dart';

class AppState {
  AppState(
      {required this.options,
      required this.showReaderOptions,
      required this.pathData,
      required this.pathFilePrefix,
      required this.pathTitle,
      required this.statusTime,
      required this.batteryPerc,
      required this.pathId});

  final AppOptions options;
  final bool showReaderOptions;
  final String pathData;
  final String pathFilePrefix;
  final String pathTitle;
  final String statusTime;
  final int batteryPerc;
  final int pathId;

  factory AppState.initial() => AppState(
        options: AppOptions.initial(),
        showReaderOptions: false,
        pathData: AppConstants.EMPTY_STRING,
        pathFilePrefix: AppConstants.EMPTY_STRING,
        pathTitle: AppConstants.EMPTY_STRING,
        statusTime: AppConstants.EMPTY_STRING,
        batteryPerc: 0,
        pathId: 1, // default to Japji Sahib Ji path.
      );

  AppState copyWith({
    AppOptions? options,
    bool? showReaderOptions,
    String? pathData,
    String? pathFilePrefix,
    String? pathTitle,
    double? scrollPerc,
    String? statusTime,
    int? batteryPerc,
    int? pathId,
  }) {
    return AppState(
      options: options ?? this.options,
      showReaderOptions: showReaderOptions ?? this.showReaderOptions,
      pathData: pathData ?? this.pathData,
      pathFilePrefix: pathFilePrefix ?? this.pathFilePrefix,
      pathTitle: pathTitle ?? this.pathTitle,
      statusTime: statusTime ?? this.statusTime,
      batteryPerc: batteryPerc ?? this.batteryPerc,
      pathId: pathId ?? this.pathId,
    );
  }

  //TODO: not sure if this is needed.
  // @override
  // bool operator ==(dynamic other) {
  //   if (runtimeType != other.runtimeType) return false;
  //   final AppState typedOther = other;
  //   return options == typedOther.options &&
  //       showReaderOptions == typedOther.showReaderOptions &&
  //       pathData == typedOther.pathData &&
  //       pathFilePrefix == typedOther.pathFilePrefix &&
  //       pathTitle == typedOther.pathTitle &&
  //       statusTime == typedOther.statusTime &&
  //       batteryPerc == typedOther.batteryPerc &&
  //       pathId == typedOther.pathId;
  // }

  @override
  int get hashCode => Object.hashAll([
        options,
        showReaderOptions,
        pathData,
        pathFilePrefix,
        pathTitle,
        statusTime,
        batteryPerc,
        pathId
      ]);

  @override
  String toString() {
    return 'AppState{$options, readeropts: $showReaderOptions, filepfx: $pathFilePrefix, title: $pathTitle, time: $statusTime, battery: $batteryPerc, id: $pathId }';
  }
}
