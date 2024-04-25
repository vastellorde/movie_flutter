import 'package:movie/core/infrastructure/logger/logger_wrapper.dart';
import 'package:talker_flutter/talker_flutter.dart';

final class ConsoleLoggerWrapper implements LoggerWrapper {
  final Talker _talker;

  const ConsoleLoggerWrapper({required Talker talker}) : _talker = talker;

  @override
  void debug(Object message, {Object? exception, StackTrace? stackTrace}) {
    _talker.debug(message, exception, stackTrace);
  }

  @override
  void error(Object message, {Object? exception, StackTrace? stackTrace}) {
    _talker.error(message, exception, stackTrace);
  }

  @override
  void info(Object message, {Object? exception, StackTrace? stackTrace}) {
    _talker.info(message, exception, stackTrace);
  }

  @override
  void warning(Object message, {Object? exception, StackTrace? stackTrace}) {
    _talker.warning(message, exception, stackTrace);
  }
}
