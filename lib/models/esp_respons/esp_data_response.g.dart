// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esp_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EspDataResponse _$EspDataResponseFromJson(Map<String, dynamic> json) =>
    EspDataResponse(
      json['error'] as bool,
      json['errorCode'] as String,
      json['totalSize'] as int,
      (json['data'] as List<dynamic>?)
          ?.map((e) => EspData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EspDataResponseToJson(EspDataResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'errorCode': instance.errorCode,
      'totalSize': instance.totalSize,
      'data': instance.data,
    };
