import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/models/paged/paged.dart';
import 'package:movie/features/movie/domain/models/movie.dart';

abstract interface class MovieListRepository {
  HttpResult<Paged<Movie>> getMovieList(int page);
}
