// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_cart_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateCartRequest _$CreateCartRequestFromJson(Map<String, dynamic> json) {
  return _CreateCartRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateCartRequest {
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateCartRequestCopyWith<CreateCartRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateCartRequestCopyWith<$Res> {
  factory $CreateCartRequestCopyWith(
          CreateCartRequest value, $Res Function(CreateCartRequest) then) =
      _$CreateCartRequestCopyWithImpl<$Res, CreateCartRequest>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$CreateCartRequestCopyWithImpl<$Res, $Val extends CreateCartRequest>
    implements $CreateCartRequestCopyWith<$Res> {
  _$CreateCartRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCartRequestCopyWith<$Res>
    implements $CreateCartRequestCopyWith<$Res> {
  factory _$$_CreateCartRequestCopyWith(_$_CreateCartRequest value,
          $Res Function(_$_CreateCartRequest) then) =
      __$$_CreateCartRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$_CreateCartRequestCopyWithImpl<$Res>
    extends _$CreateCartRequestCopyWithImpl<$Res, _$_CreateCartRequest>
    implements _$$_CreateCartRequestCopyWith<$Res> {
  __$$_CreateCartRequestCopyWithImpl(
      _$_CreateCartRequest _value, $Res Function(_$_CreateCartRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_CreateCartRequest(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateCartRequest implements _CreateCartRequest {
  _$_CreateCartRequest({this.status = 'ACTIVE'});

  factory _$_CreateCartRequest.fromJson(Map<String, dynamic> json) =>
      _$$_CreateCartRequestFromJson(json);

  @override
  @JsonKey()
  final String? status;

  @override
  String toString() {
    return 'CreateCartRequest(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateCartRequest &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCartRequestCopyWith<_$_CreateCartRequest> get copyWith =>
      __$$_CreateCartRequestCopyWithImpl<_$_CreateCartRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateCartRequestToJson(
      this,
    );
  }
}

abstract class _CreateCartRequest implements CreateCartRequest {
  factory _CreateCartRequest({final String? status}) = _$_CreateCartRequest;

  factory _CreateCartRequest.fromJson(Map<String, dynamic> json) =
      _$_CreateCartRequest.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCartRequestCopyWith<_$_CreateCartRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
