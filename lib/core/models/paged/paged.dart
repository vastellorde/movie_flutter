import 'package:equatable/equatable.dart';

final class Paged<T> with EquatableMixin {
  const Paged({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  @override
  List<Object?> get props => [page];
}
