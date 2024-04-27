import 'package:equatable/equatable.dart';
import 'package:movie/core/http/models/http_result.f.dart';

abstract class Usecase<P, T> {
  const Usecase();

  T invoke(P params);
}

abstract class FetchUsecase<P, T> {
  const FetchUsecase();

  HttpResult<T> invoke(P params);
}

final class EmptyUsecaseParams with EquatableMixin {
  const EmptyUsecaseParams();

  @override
  List<Object?> get props => [];
}
