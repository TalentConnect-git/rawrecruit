// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_page_referral_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerPageReferralResponse {

 bool get success; String get message; CareerPageReferralData? get data;
/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerPageReferralResponseCopyWith<CareerPageReferralResponse> get copyWith => _$CareerPageReferralResponseCopyWithImpl<CareerPageReferralResponse>(this as CareerPageReferralResponse, _$identity);

  /// Serializes this CareerPageReferralResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerPageReferralResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CareerPageReferralResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CareerPageReferralResponseCopyWith<$Res>  {
  factory $CareerPageReferralResponseCopyWith(CareerPageReferralResponse value, $Res Function(CareerPageReferralResponse) _then) = _$CareerPageReferralResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, CareerPageReferralData? data
});


$CareerPageReferralDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CareerPageReferralResponseCopyWithImpl<$Res>
    implements $CareerPageReferralResponseCopyWith<$Res> {
  _$CareerPageReferralResponseCopyWithImpl(this._self, this._then);

  final CareerPageReferralResponse _self;
  final $Res Function(CareerPageReferralResponse) _then;

/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CareerPageReferralData?,
  ));
}
/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerPageReferralDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CareerPageReferralDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CareerPageReferralResponse].
extension CareerPageReferralResponsePatterns on CareerPageReferralResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerPageReferralResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerPageReferralResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerPageReferralResponse value)  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerPageReferralResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  CareerPageReferralData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerPageReferralResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  CareerPageReferralData? data)  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  CareerPageReferralData? data)?  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerPageReferralResponse implements CareerPageReferralResponse {
  const _CareerPageReferralResponse({this.success = false, this.message = '', this.data});
  factory _CareerPageReferralResponse.fromJson(Map<String, dynamic> json) => _$CareerPageReferralResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override final  CareerPageReferralData? data;

/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerPageReferralResponseCopyWith<_CareerPageReferralResponse> get copyWith => __$CareerPageReferralResponseCopyWithImpl<_CareerPageReferralResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerPageReferralResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerPageReferralResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CareerPageReferralResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CareerPageReferralResponseCopyWith<$Res> implements $CareerPageReferralResponseCopyWith<$Res> {
  factory _$CareerPageReferralResponseCopyWith(_CareerPageReferralResponse value, $Res Function(_CareerPageReferralResponse) _then) = __$CareerPageReferralResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, CareerPageReferralData? data
});


@override $CareerPageReferralDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CareerPageReferralResponseCopyWithImpl<$Res>
    implements _$CareerPageReferralResponseCopyWith<$Res> {
  __$CareerPageReferralResponseCopyWithImpl(this._self, this._then);

  final _CareerPageReferralResponse _self;
  final $Res Function(_CareerPageReferralResponse) _then;

/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_CareerPageReferralResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CareerPageReferralData?,
  ));
}

/// Create a copy of CareerPageReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CareerPageReferralDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CareerPageReferralDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
