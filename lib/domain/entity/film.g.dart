// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      quotes_length: (json['quotes_length'] as num).toInt(),
      top_cast_length: (json['top_cast_length'] as num).toInt(),
      year: (json['year'] as num).toInt(),
    );

Map<String, dynamic> _$FilmToJson(Film instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'quotes_length': instance.quotes_length,
      'top_cast_length': instance.top_cast_length,
      'year': instance.year,
    };
