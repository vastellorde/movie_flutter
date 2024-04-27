// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_dto.json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagedDto<T> _$PagedDtoFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PagedDto<T>(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );
