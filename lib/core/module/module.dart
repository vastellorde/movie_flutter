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
    _init();
  }

  final List<Module> includes;
  final List<ModuleDependencies> dependencies;

  final DIRegistrator _diRegistrator = DIGetItRegistrator();
  late final DIScope _scope;

  String get _id => '${toString()}Scope';

  DI get di => _diRegistrator;

  void _initScope() {
    _scope = DIGetItScope(scopeName: _id);
    _scope.register();
  }

  Future<void> _init() async {
    for (final dependency in dependencies) {
      await dependency.register(_diRegistrator);
    }
  }

  Future<void> dispose() async {
    for (final module in includes) {
      await module.dispose();
    }
    await _scope.dispose();
  }
}
