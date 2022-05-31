// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      json['error'] as bool?,
      json['status'] as int?,
      json['userMessage'] as String?,
      json['errors'],
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'userMessage': instance.userMessage,
      'errors': instance.errors,
    };
