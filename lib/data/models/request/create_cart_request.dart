import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_cart_request.freezed.dart';

part 'create_cart_request.g.dart';

@freezed
class CreateCartRequest with _$CreateCartRequest {
  factory CreateCartRequest({
    @Default('ACTIVE') String? status,
  }) = _CreateCartRequest;

  factory CreateCartRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCartRequestFromJson(json);
}
