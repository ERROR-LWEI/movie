// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DynamicJson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicJson _$DynamicJsonFromJson(Map<String, dynamic> json) {
  return DynamicJson(
      json['id'] as String,
      json['title'] as String,
      json['content'] as String,
      json['comment'] as int,
      json['star'] as int,
      json['rep'] as int,
      json['author'] == null
          ? null
          : AuthorJson.fromJson(json['author'] as Map<String, dynamic>));
}

Map<String, dynamic> _$DynamicJsonToJson(DynamicJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'author': instance.author,
      'star': instance.star,
      'comment': instance.comment,
      'rep': instance.rep
    };
