import 'package:json_annotation/json_annotation.dart';

part 'genre_dto.json.g.dart';

@JsonSerializable(createToJson: false)
final class GenreDto {
  const GenreDto({
    required this.id,
    required this.name,
  });

  factory GenreDto.fromJson(Map<String, dynamic> json) =>
      _$GenreDtoFromJson(json);

  final int id;
  final String name;
}
