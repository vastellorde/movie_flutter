import 'package:movie/core/failure/app_failure.dart';

sealed class HttpFailure extends AppFailure {
  const HttpFailure({required super.reason});
}

final class NoConnectionFailure extends HttpFailure {
  const NoConnectionFailure() : super(reason: 'No connection');
}

final class HttpDataParseFailure extends HttpFailure {
  const HttpDataParseFailure({required super.reason});
}

final class UnAuthorizedFailure extends HttpFailure {
  const UnAuthorizedFailure({required super.reason});
}

final class UnknownFailure extends HttpFailure {
  const UnknownFailure({required super.reason});
}

final class ClientFailure extends HttpFailure {
  const ClientFailure({required super.reason});
}

final class ServerFailure extends HttpFailure {
  const ServerFailure({required super.reason});
}
