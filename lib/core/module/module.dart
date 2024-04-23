import 'package:movie/core/module/di_get_it_registrator.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/di_scope.dart';
import 'package:movie/core/module/module_dependencies.dart';

abstract class Module {
  Module({
    this.includes = const [],
    this.dependencies = const [],
  });

  final List<Module> includes;
  final List<ModuleDependencies> dependencies;

  final DIRegistrator di = DIGetItRegistrator();
  late final DIScope _scope;

  String get _id => '${toString()}Scope';

  Future<void> _initScope() async {
    _scope = DIGetItScope(scopeName: _id);
    _scope.register();
  }

  Future<void> init() async {
    await _initScope();

    for (var module in includes) {
      await module.init();
    }

    for (var dependency in dependencies) {
      await dependency.register(di);
    }
  }

  Future<void> dispose() async {
    for (var module in includes) {
      await module.dispose();
    }
    _scope.dispose();
  }
}
