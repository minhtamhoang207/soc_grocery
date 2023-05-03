// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_google_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginGoogleRequest _$LoginGoogleRequestFromJson(Map<String, dynamic> json) {
  return _LoginGoogleRequest.fromJson(json);
}

/// @nodoc
mixin _$LoginGoogleRequest {
  @JsonKey(name: 'idToken')
  String? get idToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginGoogleRequestCopyWith<LoginGoogleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginGoogleRequestCopyWith<$Res> {
  factory $LoginGoogleRequestCopyWith(
          LoginGoogleRequest value, $Res Function(LoginGoogleRequest) then) =
      _$LoginGoogleRequestCopyWithImpl<$Res, LoginGoogleRequest>;
  @useResult
  $Res call({@JsonKey(name: 'idToken') String? idToken});
}

/// @nodoc
class _$LoginGoogleRequestCopyWithImpl<$Res, $Val extends LoginGoogleRequest>
    implements $LoginGoogleRequestCopyWith<$Res> {
  _$LoginGoogleRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginGoogleRequestCopyWith<$Res>
    implements $LoginGoogleRequestCopyWith<$Res> {
  factory _$$_LoginGoogleRequestCopyWith(_$_LoginGoogleRequest value,
          $Res Function(_$_LoginGoogleRequest) then) =
      __$$_LoginGoogleRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'idToken') String? idToken});
}

/// @nodoc
class __$$_LoginGoogleRequestCopyWithImpl<$Res>
    extends _$LoginGoogleRequestCopyWithImpl<$Res, _$_LoginGoogleRequest>
    implements _$$_LoginGoogleRequestCopyWith<$Res> {
  __$$_LoginGoogleRequestCopyWithImpl(
      _$_LoginGoogleRequest _value, $Res Function(_$_LoginGoogleRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_$_LoginGoogleRequest(
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginGoogleRequest implements _LoginGoogleRequest {
  _$_LoginGoogleRequest({@JsonKey(name: 'idToken') this.idToken});

  factory _$_LoginGoogleRequest.fromJson(Map<String, dynamic> json) =>
      _$$_LoginGoogleRequestFromJson(json);

  @override
  @JsonKey(name: 'idToken')
  final String? idToken;

  @override
  String toString() {
    return 'LoginGoogleRequest(idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginGoogleRequest &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginGoogleRequestCopyWith<_$_LoginGoogleRequest> get copyWith =>
      __$$_LoginGoogleRequestCopyWithImpl<_$_LoginGoogleRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginGoogleRequestToJson(
      this,
    );
  }
}

abstract class _LoginGoogleRequest implements LoginGoogleRequest {
  factory _LoginGoogleRequest(
          {@JsonKey(name: 'idToken') final String? idToken}) =
      _$_LoginGoogleRequest;

  factory _LoginGoogleRequest.fromJson(Map<String, dynamic> json) =
      _$_LoginGoogleRequest.fromJson;

  @override
  @JsonKey(name: 'idToken')
  String? get idToken;
  @override
  @JsonKey(ignore: true)
  _$$_LoginGoogleRequestCopyWith<_$_LoginGoogleRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
