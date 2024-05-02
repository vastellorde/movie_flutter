import 'package:movie/core/infrastructure/logger/logger_wrapper.dart';
import 'package:movie/core/infrastructure/logger/wrappers/console_logger_wrapper.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class LoggerModule extends Module {
  LoggerModule()
      : super(
          scope: DIGetItScope(scopeName: _id),
          id: _id,
          dependencies: [
            _TalkerLoggerModuleDependencies(),
          ],
        );

  static const String _id = 'LoggerModule';
}

final class _TalkerLoggerModuleDependencies implements ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {
    di
      ..factory<Talker>(_createTalker)
      ..lazySingleton<LoggerWrapper>(
        () => ConsoleLoggerWrapper(
          talker: di.get<Talker>(),
        ),
      );
  }

  Talker _createTalker() {
    return TalkerFlutter.init();
  }
}
