import 'package:dio/dio.dart';
import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/http/models/base_error.json.dart';
import 'package:movie/core/http/models/http_failure.dart';
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
    required HttpDataParser<T> parser,
    Object? data,
    Map<String, dynamic>? params,
  }) async {
    final response = await _processRequest(
        makeRequest: () => _dio.get<Map<String, dynamic>>(
              url,
              data: data,
              queryParameters: params,
            ),
        parser: parser);

    return response;
  }

  @override
  HttpResult<T> post<T>(
    String url, {
    Object? data,
    required HttpDataParser<T> parser,
    Map<String, dynamic>? params,
  }) async {
    final response = await _processRequest(
        makeRequest: () => _dio.post<Map<String, dynamic>>(
              url,
              data: data,
              queryParameters: params,
            ),
        parser: parser);

    return response;
  }

  HttpResult<T> _processRequest<T>({
    required DioRequest makeRequest,
    required HttpDataParser<T> parser,
  }) async {
    try {
      final request = await makeRequest();

      final parsed = parser.parse(request.data ?? {});

      return Result.success(parsed);
    } on DioException catch (e) {
      return Result.failure(await _processDioException(e));
    } on FormatException catch (e) {
      return Result.failure(
        HttpDataParseFailure(reason: e.message),
      );
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<HttpFailure> _processDioException(DioException exception) async {
    final errorModel =
        BaseError.fromJson(exception.response?.data as Map<String, dynamic>);

    final statusCode = exception.response?.statusCode;
    if (statusCode == null) {
      return UnknownFailure(reason: exception.message ?? 'Unknown error');
    }
    return switch (statusCode) {
      401 => UnAuthorizedFailure(reason: errorModel.statusMessage),
      >= 400 && < 500 => ClientFailure(reason: errorModel.statusMessage),
      >= 500 => ServerFailure(reason: errorModel.statusMessage),
      _ => UnknownFailure(reason: exception.message ?? 'Unknown error')
    };
  }
}
