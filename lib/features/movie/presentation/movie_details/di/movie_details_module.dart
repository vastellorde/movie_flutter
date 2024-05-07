import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:movie/features/movie/domain/repository/movie_detail_repository.dart';
import 'package:movie/features/movie/domain/usecase/get_movie_detail_usecase.dart';
import 'package:movie/features/movie/presentation/movie_details/state/movie_details_bloc.dart';

final class MovieDetailsModule extends Module {
  MovieDetailsModule()
      : super(
          scope: DIGetItScope(scopeName: _id),
          id: _id,
          dependencies: const [
            _MovieDetailsDomainModuleDependencies(),
            _MovieDetailsPresentationModuleDependencies(),
          ],
        );

  static const String _id = 'MovieDetailsModule';
}

final class _MovieDetailsDomainModuleDependencies
    implements ModuleDependencies {
  const _MovieDetailsDomainModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<GetMovieDetailUsecase>(
      () => GetMovieDetailUsecase(
        repository: di.get<MovieDetailRepository>(),
      ),
    );
  }
}

final class _MovieDetailsPresentationModuleDependencies
    implements ModuleDependencies {
  const _MovieDetailsPresentationModuleDependencies();

  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<MovieDetailsBloc>(
      () => MovieDetailsBloc(
        getMovieDetailUsecase: di.get<GetMovieDetailUsecase>(),
      ),
    );
  }
}
