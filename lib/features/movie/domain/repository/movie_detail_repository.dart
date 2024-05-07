import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/features/movie/domain/models/movie_detail.dart';

abstract interface class MovieDetailRepository {
  HttpResult<MovieDetail> getMovieDetail(int movieId);
}
