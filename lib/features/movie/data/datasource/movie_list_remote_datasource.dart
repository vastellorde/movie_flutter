import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/http/parser/http_data_parser.dart';
import 'package:movie/core/models/paged/paged_dto.json.dart';
import 'package:movie/features/movie/data/models/movie_dto.json.dart';

abstract interface class MovieListRemoteDatasource {
  HttpResult<PagedDto<MovieDto>> getMovieList(int page);
}

final class MovieListRemoteDatasourceImpl implements MovieListRemoteDatasource {
  const MovieListRemoteDatasourceImpl({required HttpClientWrapper client})
      : _client = client;
  final HttpClientWrapper _client;

  @override
  HttpResult<PagedDto<MovieDto>> getMovieList(int page) {
    return _client.get<PagedDto<MovieDto>>(
      'discover/movie',
      parser: HttpDataParser(
        (json) => PagedDto.fromJson(
          json,
          (json1) => MovieDto.fromJson(json1 ?? {}),
        ),
      ),
      params: {
        'page': page,
      },
    );
  }
}
