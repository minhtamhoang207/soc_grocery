import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';

part 'base_response.g.dart';

@freezed
class BaseResponse with _$BaseResponse {
  factory BaseResponse({
    String? message,
    dynamic data,
    dynamic meta,
    DateTime? time,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
}
