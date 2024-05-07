import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/usecase/usecase.dart';
import 'package:movie/features/movie/domain/models/movie_detail.dart';
import 'package:movie/features/movie/domain/repository/movie_detail_repository.dart';

final class GetMovieDetailUsecase
    implements FetchUsecase<GetMovieDetailUsecaseParams, MovieDetail> {
  const GetMovieDetailUsecase({required MovieDetailRepository repository})
      : _repository = repository;

  final MovieDetailRepository _repository;

  @override
  HttpResult<MovieDetail> invoke(GetMovieDetailUsecaseParams params) {
    return _repository.getMovieDetail(params.movieId);
  }
}

final class GetMovieDetailUsecaseParams {
  const GetMovieDetailUsecaseParams({required this.movieId});

  final int movieId;
}
