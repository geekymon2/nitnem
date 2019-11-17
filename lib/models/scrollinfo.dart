import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: true)
class ScrollInfo {
  int _id;
  double _scrollOffset;
  double _maxOffset;

  ScrollInfo(this._id, this._scrollOffset, this._maxOffset);

  int get id {
    return _id;
  }

  double get scrollOffset {
    return _scrollOffset;
  }

  double get maxOffset {
    return _maxOffset;
  }

  ScrollInfo.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _scrollOffset = json['scrollOffset'],
        _maxOffset = json['maxOffset'];

  Map<String, dynamic> toJson() { 
    Map<String, dynamic> map = new Map();
    map["id"] = this.id;
    map["scrollOffset"] = this.scrollOffset;
    map["maxOffset"] = this.maxOffset;

    return map;
  }
}