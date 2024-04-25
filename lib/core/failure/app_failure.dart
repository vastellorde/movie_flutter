import 'package:equatable/equatable.dart';

class AppFailure with EquatableMixin {
  const AppFailure({required this.reason});

  final String reason;

  @override
  List<Object?> get props => [reason];

  @override
  String toString() {
    return '$runtimeType(reason: $reason)';
  }
}
