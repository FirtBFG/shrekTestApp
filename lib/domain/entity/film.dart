import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  final String name;
  final int id;
  final int quotes_length;
  final int top_cast_length;
  final int year;

  Film({
    required this.name,
    required this.id,
    required this.quotes_length,
    required this.top_cast_length,
    required this.year,
  });

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
  Map<String, dynamic> toJson() => _$FilmToJson(this);
}
