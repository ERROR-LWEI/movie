import 'package:json_annotation/json_annotation.dart';
part 'ResponseJson.g.dart';


@JsonSerializable()
class ResponseJson {
  ResponseJson(this.code, this.type, this.message, this.data);
  int code;
  String message;
  String type;
  dynamic data;

  factory ResponseJson.fromJson(Map<String, dynamic> json) => _$ResponseJsonFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseJsonToJson(this);
}