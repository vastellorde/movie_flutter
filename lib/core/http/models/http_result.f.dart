import 'package:movie/core/http/models/http_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'http_result.f.freezed.dart';

typedef HttpResult<T> = Future<Result<T>>;

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = _Success<T>;
  const factory Result.failure(HttpFailure failure) = _Failure<T>;

  const Result._();

  B fold<B>({
    required B Function(HttpFailure failure) onFailure,
    required B Function(T success) onSuccess,
  }) {
    if (this is _Success<T>) {
      return onSuccess((this as _Success<T>).value);
    }
    return onFailure((this as _Failure<T>).failure);
  }
}
