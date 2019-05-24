import 'package:json_annotation/json_annotation.dart';
part 'AuthorJson.g.dart';

// 用户信息
@JsonSerializable()
class AuthorJson {
  AuthorJson(this.id, this.name, this.age, this.site);
  String id;
  String name;
  String age;
  String site;

  factory AuthorJson.fromJson(Map<String, dynamic> json) => _$AuthorJsonFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorJsonToJson(this);
}