import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PathTile {
  int _id;
  String _title;
  String _gurmukhi;
  String _filePrefix;

  PathTile(this._id, this._title, this._gurmukhi, this._filePrefix);

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  String get gurmukhi {
    return _gurmukhi;
  }

  String get filePrefix {
    return _filePrefix;
  }

  @override
  String toString() {
    return 'PathTile{id: $_id, title: $_title}';
  }
}
