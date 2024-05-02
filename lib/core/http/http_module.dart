import 'package:dio/dio.dart';
import 'package:movie/app/env/env.dart';
import 'package:movie/core/http/dio_http_client_wrapper.dart';
import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/module/di_get_it_scope.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

final class HttpModule extends Module {
  HttpModule()
      : super(
          scope: DIGetItScope(scopeName: _id),
          id: _id,
          dependencies: [
            _DioHttpModuleDependencies(),
          ],
        );

  static const String _id = 'HttpModule';
}

final class _DioHttpModuleDependencies implements ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {
    di
      ..factoryWithParam<Dio, String>(
        (param) => _createDio(baseUrl: param),
      )
      ..lazySingleton<HttpClientWrapper>(
        () => DioHttpClientWrapper(
          dio: di.getWithParams<Dio, String>('https://api.themoviedb.org/3/'),
        ),
      );
  }

  Dio _createDio({String baseUrl = ''}) {
    final dio = Dio();

    dio.options.baseUrl = baseUrl;

    dio.interceptors.add(_AuthInterceptor());

    dio.httpClientAdapter = NativeAdapter();

    return dio;
  }
}

final class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    options.headers['Authorization'] = 'Bearer ${Env.tmdbToken}';
    super.onRequest(options, handler);
  }
}
