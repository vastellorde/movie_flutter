import 'package:movie/app/router/router.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';

final class RouterModule extends Module {
  RouterModule()
      : super(
          scope: DIGetItScope(scopeName: _id),
          id: _id,
          dependencies: [
            _RouterModuleDependencies(),
          ],
        );

  static const String _id = 'RouterModule';
}

final class _RouterModuleDependencies implements ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {
    di.singleton(AppRouter());
  }
}
