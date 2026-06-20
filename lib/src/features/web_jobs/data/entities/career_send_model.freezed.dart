// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_send_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerPageReferralSendResponse {

 bool get success; String get message; Map<String, dynamic>? get data;
/// Create a copy of CareerPageReferralSendResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerPageReferralSendResponseCopyWith<CareerPageReferralSendResponse> get copyWith => _$CareerPageReferralSendResponseCopyWithImpl<CareerPageReferralSendResponse>(this as CareerPageReferralSendResponse, _$identity);

  /// Serializes this CareerPageReferralSendResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerPageReferralSendResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CareerPageReferralSendResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CareerPageReferralSendResponseCopyWith<$Res>  {
  factory $CareerPageReferralSendResponseCopyWith(CareerPageReferralSendResponse value, $Res Function(CareerPageReferralSendResponse) _then) = _$CareerPageReferralSendResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, Map<String, dynamic>? data
});




}
/// @nodoc
class _$CareerPageReferralSendResponseCopyWithImpl<$Res>
    implements $CareerPageReferralSendResponseCopyWith<$Res> {
  _$CareerPageReferralSendResponseCopyWithImpl(this._self, this._then);

  final CareerPageReferralSendResponse _self;
  final $Res Function(CareerPageReferralSendResponse) _then;

/// Create a copy of CareerPageReferralSendResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerPageReferralSendResponse].
extension CareerPageReferralSendResponsePatterns on CareerPageReferralSendResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerPageReferralSendResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerPageReferralSendResponse value)  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerPageReferralSendResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  Map<String, dynamic>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  Map<String, dynamic>? data)  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  Map<String, dynamic>? data)?  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralSendResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerPageReferralSendResponse implements CareerPageReferralSendResponse {
  const _CareerPageReferralSendResponse({this.success = false, this.message = '', final  Map<String, dynamic>? data}): _data = data;
  factory _CareerPageReferralSendResponse.fromJson(Map<String, dynamic> json) => _$CareerPageReferralSendResponseFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CareerPageReferralSendResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerPageReferralSendResponseCopyWith<_CareerPageReferralSendResponse> get copyWith => __$CareerPageReferralSendResponseCopyWithImpl<_CareerPageReferralSendResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerPageReferralSendResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerPageReferralSendResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CareerPageReferralSendResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CareerPageReferralSendResponseCopyWith<$Res> implements $CareerPageReferralSendResponseCopyWith<$Res> {
  factory _$CareerPageReferralSendResponseCopyWith(_CareerPageReferralSendResponse value, $Res Function(_CareerPageReferralSendResponse) _then) = __$CareerPageReferralSendResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, Map<String, dynamic>? data
});




}
/// @nodoc
class __$CareerPageReferralSendResponseCopyWithImpl<$Res>
    implements _$CareerPageReferralSendResponseCopyWith<$Res> {
  __$CareerPageReferralSendResponseCopyWithImpl(this._self, this._then);

  final _CareerPageReferralSendResponse _self;
  final $Res Function(_CareerPageReferralSendResponse) _then;

/// Create a copy of CareerPageReferralSendResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_CareerPageReferralSendResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
