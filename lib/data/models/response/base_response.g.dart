// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BaseResponse _$$_BaseResponseFromJson(Map<String, dynamic> json) =>
    _$_BaseResponse(
      message: json['message'] as String?,
      data: json['data'],
      meta: json['meta'],
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_BaseResponseToJson(_$_BaseResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'meta': instance.meta,
      'time': instance.time?.toIso8601String(),
    };
