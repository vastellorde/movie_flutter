import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/http/parser/http_data_parser.dart';

abstract interface class HttpClientWrapper {
  HttpResult<T> get<T>(
    String url, {
    Object? data,
    required HttpDataParser<T> parser,
    Map<String, dynamic>? params,
  });

  HttpResult<T> post<T>(
    String url, {
    Object? data,
    required HttpDataParser<T> parser,
    Map<String, dynamic>? params,
  });
}
