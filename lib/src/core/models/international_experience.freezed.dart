// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'international_experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InternationalExperience {

 String? get organization; String? get country; String? get role; String? get startDate; String? get endDate; String? get description;
/// Create a copy of InternationalExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternationalExperienceCopyWith<InternationalExperience> get copyWith => _$InternationalExperienceCopyWithImpl<InternationalExperience>(this as InternationalExperience, _$identity);

  /// Serializes this InternationalExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternationalExperience&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.country, country) || other.country == country)&&(identical(other.role, role) || other.role == role)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organization,country,role,startDate,endDate,description);

@override
String toString() {
  return 'InternationalExperience(organization: $organization, country: $country, role: $role, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $InternationalExperienceCopyWith<$Res>  {
  factory $InternationalExperienceCopyWith(InternationalExperience value, $Res Function(InternationalExperience) _then) = _$InternationalExperienceCopyWithImpl;
@useResult
$Res call({
 String? organization, String? country, String? role, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class _$InternationalExperienceCopyWithImpl<$Res>
    implements $InternationalExperienceCopyWith<$Res> {
  _$InternationalExperienceCopyWithImpl(this._self, this._then);

  final InternationalExperience _self;
  final $Res Function(InternationalExperience) _then;

/// Create a copy of InternationalExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? organization = freezed,Object? country = freezed,Object? role = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InternationalExperience].
extension InternationalExperiencePatterns on InternationalExperience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternationalExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternationalExperience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternationalExperience value)  $default,){
final _that = this;
switch (_that) {
case _InternationalExperience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternationalExperience value)?  $default,){
final _that = this;
switch (_that) {
case _InternationalExperience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? organization,  String? country,  String? role,  String? startDate,  String? endDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternationalExperience() when $default != null:
return $default(_that.organization,_that.country,_that.role,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? organization,  String? country,  String? role,  String? startDate,  String? endDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _InternationalExperience():
return $default(_that.organization,_that.country,_that.role,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? organization,  String? country,  String? role,  String? startDate,  String? endDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _InternationalExperience() when $default != null:
return $default(_that.organization,_that.country,_that.role,_that.startDate,_that.endDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternationalExperience implements InternationalExperience {
  const _InternationalExperience({this.organization, this.country, this.role, this.startDate, this.endDate, this.description});
  factory _InternationalExperience.fromJson(Map<String, dynamic> json) => _$InternationalExperienceFromJson(json);

@override final  String? organization;
@override final  String? country;
@override final  String? role;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? description;

/// Create a copy of InternationalExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternationalExperienceCopyWith<_InternationalExperience> get copyWith => __$InternationalExperienceCopyWithImpl<_InternationalExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternationalExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternationalExperience&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.country, country) || other.country == country)&&(identical(other.role, role) || other.role == role)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,organization,country,role,startDate,endDate,description);

@override
String toString() {
  return 'InternationalExperience(organization: $organization, country: $country, role: $role, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$InternationalExperienceCopyWith<$Res> implements $InternationalExperienceCopyWith<$Res> {
  factory _$InternationalExperienceCopyWith(_InternationalExperience value, $Res Function(_InternationalExperience) _then) = __$InternationalExperienceCopyWithImpl;
@override @useResult
$Res call({
 String? organization, String? country, String? role, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class __$InternationalExperienceCopyWithImpl<$Res>
    implements _$InternationalExperienceCopyWith<$Res> {
  __$InternationalExperienceCopyWithImpl(this._self, this._then);

  final _InternationalExperience _self;
  final $Res Function(_InternationalExperience) _then;

/// Create a copy of InternationalExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? organization = freezed,Object? country = freezed,Object? role = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_InternationalExperience(
organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
