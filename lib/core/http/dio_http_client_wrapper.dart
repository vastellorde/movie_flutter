import 'package:dio/dio.dart';
import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/http/models/http_result.f.dart';
import 'package:movie/core/http/parser/http_data_parser.dart';

typedef DioRequestResult = Future<Response<Map<String, dynamic>>>;
typedef DioRequest = DioRequestResult Function();

final class DioHttpClientWrapper implements HttpClientWrapper {
  const DioHttpClientWrapper({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  HttpResult<T> get<T>(
    String url, {
    Object? data,
    HttpDataParser<T>? parser,
    Map<String, dynamic>? params,
  }) async {
    final response = await _processRequest(
      () => _dio.get<Map<String, dynamic>>(''),
    );

    return response.fold(
      onFailure: Result.failure,
      onSuccess: (value) {},
    );
  }

  @override
  HttpResult<T> post<T>(
    String url, {
    Object? data,
    HttpDataParser? parser,
    Map<String, dynamic>? params,
  }) {
    // TODO: implement post
    throw UnimplementedError();
  }

  HttpResult<Map<String, dynamic>> _processRequest(
      DioRequest makeRequest) async {}
}
