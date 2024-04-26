import 'package:json_annotation/json_annotation.dart';

part 'genre_dto.json.g.dart';

@JsonSerializable()
final class GenreDto {
  final int id;
  final String name;

  const GenreDto({
    required this.id,
    required this.name,
  });
}
