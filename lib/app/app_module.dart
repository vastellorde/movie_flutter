import 'package:movie/app/router/router_module.dart';
import 'package:movie/core/http/http_module.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';

final class AppModule extends Module {
  AppModule()
      : super(
          includes: [
            RouterModule(),
            HttpModule(),
          ],
          dependencies: [
            _AppModuleDependencies(),
          ],
        );
}

final class _AppModuleDependencies implements ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {}
}
