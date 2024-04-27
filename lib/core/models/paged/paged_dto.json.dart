import 'package:json_annotation/json_annotation.dart';
import 'package:movie/core/models/paged/paged.dart';

part 'paged_dto.json.g.dart';

@JsonSerializable(genericArgumentFactories: true)
final class PagedDto<T> {
  const PagedDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PagedDto.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>? json) fromJsonT,
  ) =>
      _$PagedDtoFromJson(
        json,
        (json) => fromJsonT(json as Map<String, dynamic>?),
      );

  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  Paged<P> toDomain<P>(P Function(T model) toDomainFunc) {
    return Paged(
      page: page,
      results: results
          .map(
            (e) => toDomainFunc(e),
          )
          .toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
