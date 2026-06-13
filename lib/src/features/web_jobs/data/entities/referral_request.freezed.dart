// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralRequest {

@JsonKey(name: '_id') String? get id; String? get status;
/// Create a copy of ReferralRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralRequestCopyWith<ReferralRequest> get copyWith => _$ReferralRequestCopyWithImpl<ReferralRequest>(this as ReferralRequest, _$identity);

  /// Serializes this ReferralRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'ReferralRequest(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class $ReferralRequestCopyWith<$Res>  {
  factory $ReferralRequestCopyWith(ReferralRequest value, $Res Function(ReferralRequest) _then) = _$ReferralRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? status
});




}
/// @nodoc
class _$ReferralRequestCopyWithImpl<$Res>
    implements $ReferralRequestCopyWith<$Res> {
  _$ReferralRequestCopyWithImpl(this._self, this._then);

  final ReferralRequest _self;
  final $Res Function(ReferralRequest) _then;

/// Create a copy of ReferralRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralRequest].
extension ReferralRequestPatterns on ReferralRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReferralRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralRequest() when $default != null:
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? status)  $default,) {final _that = this;
switch (_that) {
case _ReferralRequest():
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _ReferralRequest() when $default != null:
return $default(_that.id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralRequest implements ReferralRequest {
  const _ReferralRequest({@JsonKey(name: '_id') this.id, this.status});
  factory _ReferralRequest.fromJson(Map<String, dynamic> json) => _$ReferralRequestFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? status;

/// Create a copy of ReferralRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralRequestCopyWith<_ReferralRequest> get copyWith => __$ReferralRequestCopyWithImpl<_ReferralRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'ReferralRequest(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ReferralRequestCopyWith<$Res> implements $ReferralRequestCopyWith<$Res> {
  factory _$ReferralRequestCopyWith(_ReferralRequest value, $Res Function(_ReferralRequest) _then) = __$ReferralRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? status
});




}
/// @nodoc
class __$ReferralRequestCopyWithImpl<$Res>
    implements _$ReferralRequestCopyWith<$Res> {
  __$ReferralRequestCopyWithImpl(this._self, this._then);

  final _ReferralRequest _self;
  final $Res Function(_ReferralRequest) _then;

/// Create a copy of ReferralRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? status = freezed,}) {
  return _then(_ReferralRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
