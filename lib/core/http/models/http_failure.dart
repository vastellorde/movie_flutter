import 'package:movie/core/failure/app_failure.dart';

sealed class HttpFailure extends AppFailure {
  HttpFailure({required super.reason});
}
