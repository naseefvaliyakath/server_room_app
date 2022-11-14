// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'esp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EspData _$EspDataFromJson(Map<String, dynamic> json) => EspData(
      json['esp_id'] as int,
      json['temp1'] as num,
      json['temp2'] as num,
      json['hum'] as num,
      json['ups'] as int,
      json['powr'] as int,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$EspDataToJson(EspData instance) => <String, dynamic>{
      'esp_id': instance.esp_id,
      'temp1': instance.temp1,
      'temp2': instance.temp2,
      'hum': instance.hum,
      'ups': instance.ups,
      'powr': instance.powr,
      'createdAt': instance.createdAt.toIso8601String(),
    };
