// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leadership_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeadershipExperience {

 String? get organization; String? get role; String? get startDate; String? get endDate; String? get description;
/// Create a copy of LeadershipExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeadershipExperienceCopyWith<LeadershipExperience> get copyWith => _$LeadershipExperienceCopyWithImpl<LeadershipExperience>(this as LeadershipExperience, _$identity);

  /// Serializes this LeadershipExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeadershipExperience&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.role, role) || other.role == role)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organization,role,startDate,endDate,description);

@override
String toString() {
  return 'LeadershipExperience(organization: $organization, role: $role, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $LeadershipExperienceCopyWith<$Res>  {
  factory $LeadershipExperienceCopyWith(LeadershipExperience value, $Res Function(LeadershipExperience) _then) = _$LeadershipExperienceCopyWithImpl;
@useResult
$Res call({
 String? organization, String? role, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class _$LeadershipExperienceCopyWithImpl<$Res>
    implements $LeadershipExperienceCopyWith<$Res> {
  _$LeadershipExperienceCopyWithImpl(this._self, this._then);

  final LeadershipExperience _self;
  final $Res Function(LeadershipExperience) _then;

/// Create a copy of LeadershipExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organization = freezed,Object? role = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeadershipExperience].
extension LeadershipExperiencePatterns on LeadershipExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeadershipExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeadershipExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeadershipExperience value)  $default,){
final _that = this;
switch (_that) {
case _LeadershipExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeadershipExperience value)?  $default,){
final _that = this;
switch (_that) {
case _LeadershipExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? organization,  String? role,  String? startDate,  String? endDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeadershipExperience() when $default != null:
return $default(_that.organization,_that.role,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? organization,  String? role,  String? startDate,  String? endDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _LeadershipExperience():
return $default(_that.organization,_that.role,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? organization,  String? role,  String? startDate,  String? endDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _LeadershipExperience() when $default != null:
return $default(_that.organization,_that.role,_that.startDate,_that.endDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeadershipExperience implements LeadershipExperience {
  const _LeadershipExperience({this.organization, this.role, this.startDate, this.endDate, this.description});
  factory _LeadershipExperience.fromJson(Map<String, dynamic> json) => _$LeadershipExperienceFromJson(json);

@override final  String? organization;
@override final  String? role;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? description;

/// Create a copy of LeadershipExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeadershipExperienceCopyWith<_LeadershipExperience> get copyWith => __$LeadershipExperienceCopyWithImpl<_LeadershipExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeadershipExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeadershipExperience&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.role, role) || other.role == role)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organization,role,startDate,endDate,description);

@override
String toString() {
  return 'LeadershipExperience(organization: $organization, role: $role, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$LeadershipExperienceCopyWith<$Res> implements $LeadershipExperienceCopyWith<$Res> {
  factory _$LeadershipExperienceCopyWith(_LeadershipExperience value, $Res Function(_LeadershipExperience) _then) = __$LeadershipExperienceCopyWithImpl;
@override @useResult
$Res call({
 String? organization, String? role, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class __$LeadershipExperienceCopyWithImpl<$Res>
    implements _$LeadershipExperienceCopyWith<$Res> {
  __$LeadershipExperienceCopyWithImpl(this._self, this._then);

  final _LeadershipExperience _self;
  final $Res Function(_LeadershipExperience) _then;

/// Create a copy of LeadershipExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organization = freezed,Object? role = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_LeadershipExperience(
organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
