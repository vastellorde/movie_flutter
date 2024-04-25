import 'package:json_annotation/json_annotation.dart';

part 'base_error.json.g.dart';

@JsonSerializable(createToJson: false)
final class BaseError {
  final bool success;
  final int statusCode;
  final String statusMessage;

  const BaseError({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory BaseError.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorFromJson(json);
}
