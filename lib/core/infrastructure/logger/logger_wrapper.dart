abstract interface class LoggerWrapper {
  void debug(
    Object message, {
    Object? exception,
    StackTrace? stackTrace,
  });

  void info(
    Object message, {
    Object? exception,
    StackTrace? stackTrace,
  });

  void error(
    Object message, {
    Object? exception,
    StackTrace? stackTrace,
  });

  void warning(
    Object message, {
    Object? exception,
    StackTrace? stackTrace,
  });
}
