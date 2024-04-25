class HttpDataParser<T> {
  HttpDataParser(this.fromJsonFunc);
  final T Function(Map<String, dynamic> json) fromJsonFunc;

  T parse(Map<String, dynamic> json) => fromJsonFunc(json);
}
