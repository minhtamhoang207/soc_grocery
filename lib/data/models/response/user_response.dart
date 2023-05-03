import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';

part 'user_response.g.dart';

@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    String? accessToken,
    User? user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: '_id')
    String? id,
    String? username,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
