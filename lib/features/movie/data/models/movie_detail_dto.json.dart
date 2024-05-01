import 'package:json_annotation/json_annotation.dart';
import 'package:movie/features/genre_list/data/models/genre_dto.json.dart';

part 'movie_detail_dto.json.g.dart';

@JsonSerializable()
class MovieDetailDto {
  const MovieDetailDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailDtoFromJson(json);

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<GenreDto> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompanyDto> productionCompanies;
  final List<ProductionCountryDto> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageDto> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
}

@JsonSerializable()
class ProductionCompanyDto {
  ProductionCompanyDto({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyDtoFromJson(json);

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;
}

@JsonSerializable()
class ProductionCountryDto {
  const ProductionCountryDto({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryDtoFromJson(json);

  final String iso31661;
  final String name;
}

@JsonSerializable()
class SpokenLanguageDto {
  const SpokenLanguageDto({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory SpokenLanguageDto.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageDtoFromJson(json);

  final String englishName;
  final String iso6391;
  final String name;
}
