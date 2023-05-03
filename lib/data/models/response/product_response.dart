import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_response.freezed.dart';

part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    @JsonKey(name: '_id')
    String? id,
    String? name,
    String? description,
    int? price,
    int? quantity,
    List<String>? categories,
    List<String>? imageUrls,
    int? rating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}