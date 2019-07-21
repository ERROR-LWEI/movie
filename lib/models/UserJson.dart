import 'package:json_annotation/json_annotation.dart';
part 'UserJson.g.dart';

@JsonSerializable()
class AccountJson {
  AccountJson(this.id, this.account, this.password, this.createDate, this.updateDate);
  int id;
  String account;
  String password;
  String createDate;
  String updateDate;

  factory AccountJson.fromJson(Map<String, dynamic> json) => _$AccountJsonFromJson(json);
  Map<String, dynamic> toJson() => _$AccountJsonToJson(this);
}

@JsonSerializable()
class UserJson {
  UserJson();
  int id;
  String name;

  factory UserJson.fromJson(Map<String, dynamic> json) => _$UserJsonFromJson(json);
  Map<String, dynamic> toJson() => _$UserJsonToJson(this);
}