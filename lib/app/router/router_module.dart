import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class RouterModule extends Module {
  RouterModule()
      : super(
          dependencies: [
            _RouterModuleDependencies(),
          ],
        );
}

final class _RouterModuleDependencies implements ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {
    di.singleton(AppRouter());
    di.factory<NavigatorObserver>(
      () => TalkerRouteObserver(
        di.get<Talker>(),
      ),
    );
  }
}
