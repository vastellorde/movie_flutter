abstract interface class DI {
  T get<T extends Object>({String? instanceName});
  T getWithParams<T extends Object, P>(P param, {String? instanceName});
}
