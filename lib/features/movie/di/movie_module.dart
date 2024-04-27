import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:movie/features/movie/data/datasource/movie_list_remote_datasource.dart';
import 'package:movie/features/movie/data/repository/movie_list_repository_impl.dart';
import 'package:movie/features/movie/domain/repository/movie_list_repository.dart';

class MovieModule extends Module {
  MovieModule()
      : super(
          dependencies: const [
            _MovieDataModuleDependencies(),
            _MovieDomainModuleDependencies(),
          ],
        );
}

final class _MovieDataModuleDependencies implements ModuleDependencies {
  const _MovieDataModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<MovieListRemoteDatasource>(
      () => MovieListRemoteDatasourceImpl(
        client: di.get<HttpClientWrapper>(),
      ),
    );
  }
}

final class _MovieDomainModuleDependencies implements ModuleDependencies {
  const _MovieDomainModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<MovieListRepository>(
      () => MovieListRepositoryImpl(
        remoteDatasource: di.get<MovieListRemoteDatasource>(),
      ),
    );
  }
}