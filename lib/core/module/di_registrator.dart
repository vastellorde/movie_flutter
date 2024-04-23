import 'dart:async';

import 'package:movie/core/module/di.dart';

typedef FactoryFunc<T> = T Function();
typedef FactoryWithParamFunc<T, P> = T Function(P param);
typedef DisposingFunc<T> = FutureOr<void> Function(T instance);

abstract interface class DIRegistrator implements DI {
  void factory<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  });

  void factoryWithParam<T extends Object, P>(
    FactoryWithParamFunc<T, P> factoryFunc, {
    String? instanceName,
  });

  void singleton<T extends Object>(
    T instance, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  });

  void lazySingleton<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? disposingFunc,
  });
}
