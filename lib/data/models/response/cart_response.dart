import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';

part 'cart_response.freezed.dart';
part 'cart_response.g.dart';

@freezed
class CartResponse with _$CartResponse {
  const factory CartResponse({
    @JsonKey(name: '_id')
    String? id,
    String? userId,
    int? subtotal,
    int? total,
    int? quantity,
    String? status,
    List<Item>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CartResponse;

  factory CartResponse.fromJson(Map<String, dynamic> json) => _$CartResponseFromJson(json);
}

@freezed
class Item with _$Item {
  const factory Item({
    ProductResponse? product,
    int? quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}