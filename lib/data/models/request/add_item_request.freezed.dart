// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_item_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddItemRequest _$AddItemRequestFromJson(Map<String, dynamic> json) {
  return _AddItemRequest.fromJson(json);
}

/// @nodoc
mixin _$AddItemRequest {
  @JsonKey(name: 'productId')
  String? get productID => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddItemRequestCopyWith<AddItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddItemRequestCopyWith<$Res> {
  factory $AddItemRequestCopyWith(
          AddItemRequest value, $Res Function(AddItemRequest) then) =
      _$AddItemRequestCopyWithImpl<$Res, AddItemRequest>;
  @useResult
  $Res call({@JsonKey(name: 'productId') String? productID, int? quantity});
}

/// @nodoc
class _$AddItemRequestCopyWithImpl<$Res, $Val extends AddItemRequest>
    implements $AddItemRequestCopyWith<$Res> {
  _$AddItemRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_value.copyWith(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddItemRequestCopyWith<$Res>
    implements $AddItemRequestCopyWith<$Res> {
  factory _$$_AddItemRequestCopyWith(
          _$_AddItemRequest value, $Res Function(_$_AddItemRequest) then) =
      __$$_AddItemRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'productId') String? productID, int? quantity});
}

/// @nodoc
class __$$_AddItemRequestCopyWithImpl<$Res>
    extends _$AddItemRequestCopyWithImpl<$Res, _$_AddItemRequest>
    implements _$$_AddItemRequestCopyWith<$Res> {
  __$$_AddItemRequestCopyWithImpl(
      _$_AddItemRequest _value, $Res Function(_$_AddItemRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? quantity = freezed,
  }) {
    return _then(_$_AddItemRequest(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddItemRequest implements _AddItemRequest {
  _$_AddItemRequest(
      {@JsonKey(name: 'productId') this.productID, this.quantity});

  factory _$_AddItemRequest.fromJson(Map<String, dynamic> json) =>
      _$$_AddItemRequestFromJson(json);

  @override
  @JsonKey(name: 'productId')
  final String? productID;
  @override
  final int? quantity;

  @override
  String toString() {
    return 'AddItemRequest(productID: $productID, quantity: $quantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddItemRequest &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productID, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddItemRequestCopyWith<_$_AddItemRequest> get copyWith =>
      __$$_AddItemRequestCopyWithImpl<_$_AddItemRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddItemRequestToJson(
      this,
    );
  }
}

abstract class _AddItemRequest implements AddItemRequest {
  factory _AddItemRequest(
      {@JsonKey(name: 'productId') final String? productID,
      final int? quantity}) = _$_AddItemRequest;

  factory _AddItemRequest.fromJson(Map<String, dynamic> json) =
      _$_AddItemRequest.fromJson;

  @override
  @JsonKey(name: 'productId')
  String? get productID;
  @override
  int? get quantity;
  @override
  @JsonKey(ignore: true)
  _$$_AddItemRequestCopyWith<_$_AddItemRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
