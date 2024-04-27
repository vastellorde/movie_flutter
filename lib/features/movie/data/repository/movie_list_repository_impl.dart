import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/models/paged/paged.dart';
import 'package:movie/features/movie/data/datasource/movie_list_remote_datasource.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/domain/repository/movie_list_repository.dart';

final class MovieListRepositoryImpl implements MovieListRepository {
  const MovieListRepositoryImpl({
    required MovieListRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;
  final MovieListRemoteDatasource _remoteDatasource;
  @override
  HttpResult<Paged<Movie>> getMovieList() async {
    final response = await _remoteDatasource.getMovieList();

    return response.fold(
      onFailure: Result.failure,
      onSuccess: (success) {
        return Result.success(
          success.toDomain(
            (model) => model.toDomain(),
          ),
        );
      },
    );
  }
}
