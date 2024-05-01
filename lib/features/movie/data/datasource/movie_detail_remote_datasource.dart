import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/http/parser/http_data_parser.dart';
import 'package:movie/features/movie/data/models/movie_detail_dto.json.dart';

abstract interface class MovieDetailRemoteDatasource {
  HttpResult<MovieDetailDto> getMovieDetail(int movieId);
}

final class MovieDetailRemoteDatasourceImpl
    implements MovieDetailRemoteDatasource {
  const MovieDetailRemoteDatasourceImpl({required HttpClientWrapper client})
      : _client = client;

  final HttpClientWrapper _client;
  @override
  HttpResult<MovieDetailDto> getMovieDetail(int movieId) {
    return _client.get(
      'movie/$movieId',
      parser: HttpDataParser(MovieDetailDto.fromJson),
      params: {'language': 'en-US'},
    );
  }
}
