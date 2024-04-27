import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:movie/features/movie/domain/repository/movie_list_repository.dart';
import 'package:movie/features/movie/domain/usecase/get_movie_list_usecase.dart';
import 'package:movie/features/movie/presentation/movie_list/state/movie_list_bloc.dart';

final class MovieListModule extends Module {
  MovieListModule()
      : super(
          dependencies: const [
            _MovieListDomainModuleDependencies(),
            _MovieListPresentationModuleDependencies(),
          ],
        );
}

final class _MovieListDomainModuleDependencies implements ModuleDependencies {
  const _MovieListDomainModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<GetMovieListUsecase>(
      () => GetMovieListUsecase(
        repository: di.get<MovieListRepository>(),
      ),
    );
  }
}

final class _MovieListPresentationModuleDependencies
    implements ModuleDependencies {
  const _MovieListPresentationModuleDependencies();
  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<MovieListBloc>(
      () => MovieListBloc(
        getMovieListUsecase: di.get<GetMovieListUsecase>(),
      ),
    );
  }
}
