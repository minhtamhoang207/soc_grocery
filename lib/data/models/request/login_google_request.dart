import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_request.freezed.dart';

part 'login_google_request.g.dart';

@freezed
class LoginGoogleRequest with _$LoginGoogleRequest {
  factory LoginGoogleRequest({
    @JsonKey(name: 'idToken')
    String? idToken,
  }) = _LoginGoogleRequest;

  factory LoginGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginGoogleRequestFromJson(json);
}
