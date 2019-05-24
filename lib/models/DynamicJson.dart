import 'package:json_annotation/json_annotation.dart';
import 'package:movie/models/AuthorJson.dart';

part 'DynamicJson.g.dart';

@JsonSerializable()

// 动态
class DynamicJson {
  DynamicJson(this.id, this.title, this.content, this.comment, this.star, this.rep, this.author);
  String id;
  String title;
  String content;
  AuthorJson author;
  int star;
  int comment;
  int rep;

  factory DynamicJson.fromJson(Map<String, dynamic> json) => _$DynamicJsonFromJson(json);
  Map<String, dynamic> toJson() => _$DynamicJsonToJson(this);
}