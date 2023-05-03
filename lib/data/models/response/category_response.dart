import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_response.freezed.dart';

part 'category_response.g.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  factory CategoryResponse({
    @JsonKey(name: '_id')
    String? id,
    String? name,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

}