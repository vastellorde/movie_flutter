import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:movie/features/movie/data/datasource/movie_detail_remote_datasource.dart';
import 'package:movie/features/movie/data/datasource/movie_list_remote_datasource.dart';
import 'package:movie/features/movie/data/repository/movie_detail_repository_impl.dart';
import 'package:movie/features/movie/data/repository/movie_list_repository_impl.dart';
import 'package:movie/features/movie/domain/repository/movie_detail_repository.dart';
import 'package:movie/features/movie/domain/repository/movie_list_repository.dart';

class MovieModule extends Module {
  MovieModule()
      : super(
          scope: DIGetItScope(scopeName: _id),
          id: _id,
          dependencies: const [
            _MovieDataModuleDependencies(),
            _MovieDomainModuleDependencies(),
          ],
        );

  static const String _id = 'MovieModule';
}

final class _MovieDataModuleDependencies implements ModuleDependencies {
  const _MovieDataModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di
      ..factory<MovieListRemoteDatasource>(
        () => MovieListRemoteDatasourceImpl(
          client: di.get<HttpClientWrapper>(),
        ),
      )
      ..factory<MovieDetailRemoteDatasource>(
        () => MovieDetailRemoteDatasourceImpl(
          client: di.get<HttpClientWrapper>(),
        ),
      );
  }
}

final class _MovieDomainModuleDependencies implements ModuleDependencies {
  const _MovieDomainModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di
      ..factory<MovieListRepository>(
        () => MovieListRepositoryImpl(
          remoteDatasource: di.get<MovieListRemoteDatasource>(),
        ),
      )
      ..factory<MovieDetailRepository>(
        () => MovieDetailRepositoryImpl(
          remoteDatasource: di.get<MovieDetailRemoteDatasource>(),
        ),
      );
  }
}
