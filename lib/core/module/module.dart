import 'package:movie/core/module/di.dart';
import 'package:movie/core/module/di_get_it_registrator.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/di_scope.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class Module {
  Module({
    required DIScope scope,
    required this.id,
    this.includes = const [],
    this.dependencies = const [],
  }) : _scope = scope;

  final List<Module> includes;
  final List<ModuleDependencies> dependencies;
  final String id;

  final DIRegistrator _diRegistrator = DIGetItRegistrator();
  final DIScope _scope;

  bool _isInitialized = false;

  final Talker _talker = TalkerFlutter.init();

  DI get di => _diRegistrator;
  bool get isInitialized => _isInitialized;

  void _initScope() {
    _scope.register();
    _talker.info('$id: init scope');
  }

  Future<bool> init() async {
    _initScope();

    for (final module in includes) {
      await module.init();
    }
    for (final dependency in dependencies) {
      await dependency.register(_diRegistrator);
    }

    _talker.info('$id: init dependencies');

    _isInitialized = true;

    return true;
  }

  Future<void> dispose() async {
    for (final module in includes) {
      await module.dispose();
    }
    await _scope.dispose();
    _talker.info('$id: dispose');
  }
}
