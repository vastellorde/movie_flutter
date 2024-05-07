import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/features/movie/data/datasource/movie_detail_remote_datasource.dart';
import 'package:movie/features/movie/domain/models/movie_detail.dart';
import 'package:movie/features/movie/domain/repository/movie_detail_repository.dart';

final class MovieDetailRepositoryImpl implements MovieDetailRepository {
  const MovieDetailRepositoryImpl(
      {required MovieDetailRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final MovieDetailRemoteDatasource _remoteDatasource;

  @override
  HttpResult<MovieDetail> getMovieDetail(int movieId) async {
    final response = await _remoteDatasource.getMovieDetail(movieId);

    return response.fold(
      onFailure: Result.failure,
      onSuccess: (success) {
        return Result.success(success.toDomain());
      },
    );
  }
}
