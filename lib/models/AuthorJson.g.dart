// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthorJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorJson _$AuthorJsonFromJson(Map<String, dynamic> json) {
  return AuthorJson(json['id'] as String, json['name'] as String,
      json['age'] as String, json['site'] as String);
}

Map<String, dynamic> _$AuthorJsonToJson(AuthorJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'site': instance.site
    };
