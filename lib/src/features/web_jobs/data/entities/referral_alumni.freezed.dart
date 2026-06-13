// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_alumni.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralAlumni {

 String? get userId;
/// Create a copy of ReferralAlumni
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralAlumniCopyWith<ReferralAlumni> get copyWith => _$ReferralAlumniCopyWithImpl<ReferralAlumni>(this as ReferralAlumni, _$identity);

  /// Serializes this ReferralAlumni to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralAlumni&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ReferralAlumni(userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ReferralAlumniCopyWith<$Res>  {
  factory $ReferralAlumniCopyWith(ReferralAlumni value, $Res Function(ReferralAlumni) _then) = _$ReferralAlumniCopyWithImpl;
@useResult
$Res call({
 String? userId
});




}
/// @nodoc
class _$ReferralAlumniCopyWithImpl<$Res>
    implements $ReferralAlumniCopyWith<$Res> {
  _$ReferralAlumniCopyWithImpl(this._self, this._then);

  final ReferralAlumni _self;
  final $Res Function(ReferralAlumni) _then;

/// Create a copy of ReferralAlumni
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralAlumni].
extension ReferralAlumniPatterns on ReferralAlumni {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralAlumni value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralAlumni() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralAlumni value)  $default,){
final _that = this;
switch (_that) {
case _ReferralAlumni():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralAlumni value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralAlumni() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralAlumni() when $default != null:
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userId)  $default,) {final _that = this;
switch (_that) {
case _ReferralAlumni():
return $default(_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userId)?  $default,) {final _that = this;
switch (_that) {
case _ReferralAlumni() when $default != null:
return $default(_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralAlumni implements ReferralAlumni {
  const _ReferralAlumni({this.userId});
  factory _ReferralAlumni.fromJson(Map<String, dynamic> json) => _$ReferralAlumniFromJson(json);

@override final  String? userId;

/// Create a copy of ReferralAlumni
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralAlumniCopyWith<_ReferralAlumni> get copyWith => __$ReferralAlumniCopyWithImpl<_ReferralAlumni>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralAlumniToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralAlumni&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'ReferralAlumni(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ReferralAlumniCopyWith<$Res> implements $ReferralAlumniCopyWith<$Res> {
  factory _$ReferralAlumniCopyWith(_ReferralAlumni value, $Res Function(_ReferralAlumni) _then) = __$ReferralAlumniCopyWithImpl;
@override @useResult
$Res call({
 String? userId
});




}
/// @nodoc
class __$ReferralAlumniCopyWithImpl<$Res>
    implements _$ReferralAlumniCopyWith<$Res> {
  __$ReferralAlumniCopyWithImpl(this._self, this._then);

  final _ReferralAlumni _self;
  final $Res Function(_ReferralAlumni) _then;

/// Create a copy of ReferralAlumni
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,}) {
  return _then(_ReferralAlumni(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
