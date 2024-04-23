import 'package:get_it/get_it.dart' hide FactoryFunc, DisposingFunc;
import 'package:movie/core/module/di_registrator.dart';

final class DIGetItRegistrator implements DIRegistrator {
  final _getIt = GetIt.instance;
  @override
  void factory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory<T>(
      factoryFunc,
      instanceName: instanceName,
    );
  }

  @override
  void factoryWithParam<T extends Object, P>(
    FactoryWithParamFunc<T, P> factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactoryParam<T, P, void>(
      (param, _) => factoryFunc(param),
      instanceName: instanceName,
    );
  }

  @override
  T get<T extends Object>({String? instanceName}) {
    return _getIt.get<T>(instanceName: instanceName);
  }

  @override
  T getWithParams<T extends Object, P>(
    P param, {
    String? instanceName,
  }) {
    return _getIt.get<T>(
      param1: param,
      instanceName: instanceName,
    );
  }

  @override
  void lazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  }) {
    _getIt.registerLazySingleton<T>(
      factoryFunc,
      instanceName: instanceName,
      dispose: disposingFunc,
    );
  }

  @override
  void singleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  }) {
    _getIt.registerSingleton(
      instance,
      instanceName: instanceName,
      dispose: disposingFunc,
    );
  }
}
