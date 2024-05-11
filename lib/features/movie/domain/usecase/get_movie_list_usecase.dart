import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/models/paged/paged.dart';
import 'package:movie/core/usecase/usecase.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/domain/repository/movie_list_repository.dart';

final class GetMovieListUsecase
    implements FetchUsecase<GetMovieListUsecaseParams, Paged<Movie>> {
  const GetMovieListUsecase({required MovieListRepository repository})
      : _repository = repository;

  final MovieListRepository _repository;

  @override
  HttpResult<Paged<Movie>> invoke(GetMovieListUsecaseParams params) {
    return _repository.getMovieList(params.page);
  }
}

final class GetMovieListUsecaseParams {
  const GetMovieListUsecaseParams(this.page);

  final int page;
}
