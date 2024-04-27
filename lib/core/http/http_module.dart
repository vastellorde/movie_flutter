import 'package:dio/dio.dart';
import 'package:movie/core/http/dio_http_client_wrapper.dart';
import 'package:movie/core/http/http_client_wrapper.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

final class HttpModule extends Module {
  HttpModule()
      : super(
          dependencies: [
            _DioHttpModuleDependencies(),
          ],
        );
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

    dio.httpClientAdapter = NativeAdapter();

    return dio;
  }
}
