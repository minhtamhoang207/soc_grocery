import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_item_request.freezed.dart';

part 'add_item_request.g.dart';

@freezed
class AddItemRequest with _$AddItemRequest {
  factory AddItemRequest({
    @JsonKey(name: 'productId')
    String? productID,
    int? quantity
  }) = _AddItemRequest;

  factory AddItemRequest.fromJson(Map<String, dynamic> json) =>
      _$AddItemRequestFromJson(json);
}