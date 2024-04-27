import 'package:movie/core/module/di.dart';
import 'package:movie/core/module/di_get_it_registrator.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/di_scope.dart';
import 'package:movie/core/module/module_dependencies.dart';

abstract class Module {
  Module({
    this.includes = const [],
    this.dependencies = const [],
  }) {
    _initScope();
  }

  final List<Module> includes;
  final List<ModuleDependencies> dependencies;

  final DIRegistrator _diRegistrator = DIGetItRegistrator();
  late final DIScope _scope;

  bool _allreadyRegistered = false;

  String get _id => '${toString()}Scope';

  DI get di => _diRegistrator;

  void _initScope() {
    _scope = DIGetItScope(scopeName: _id);
    _allreadyRegistered = !_scope.register();
  }

  Future<bool> init() async {
    if (_allreadyRegistered) {
      return true;
    }
    for (final module in includes) {
      await module.init();
    }
    for (final dependency in dependencies) {
      await dependency.register(_diRegistrator);
    }

    return true;
  }

  Future<void> dispose() async {
    for (final module in includes) {
      await module.dispose();
    }
    await _scope.dispose();
  }
}
