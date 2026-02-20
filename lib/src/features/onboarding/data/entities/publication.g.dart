// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Publication _$PublicationFromJson(Map<String, dynamic> json) => _Publication(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$PublicationToJson(_Publication instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'url': instance.url,
    };
