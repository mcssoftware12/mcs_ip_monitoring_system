import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  final bool? error;
  final int? status;
  final String? userMessage;
  final dynamic errors;

  const ErrorModel(this.error, this.status, this.userMessage, this.errors);

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return _$ErrorModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}