import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'message.g.dart';

///
@immutable
@JsonSerializable()
class Message {
  ///
  final String id;

  ///
  final String name;

  ///
  final String picture;

  ///
  final String title;

  ///
  final String text;

  ///
  Message(
    this.id,
    this.name,
    this.picture,
    this.title,
    this.text,
  );

  ///
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
