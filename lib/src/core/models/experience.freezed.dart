// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experience {

 String? get company; String? get role; bool? get isCurrent; String? get startDate; String? get endDate; String? get description;
/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceCopyWith<Experience> get copyWith => _$ExperienceCopyWithImpl<Experience>(this as Experience, _$identity);

  /// Serializes this Experience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Experience&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,role,isCurrent,startDate,endDate,description);

@override
String toString() {
  return 'Experience(company: $company, role: $role, isCurrent: $isCurrent, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExperienceCopyWith<$Res>  {
  factory $ExperienceCopyWith(Experience value, $Res Function(Experience) _then) = _$ExperienceCopyWithImpl;
@useResult
$Res call({
 String? company, String? role, bool? isCurrent, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class _$ExperienceCopyWithImpl<$Res>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._self, this._then);

  final Experience _self;
  final $Res Function(Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? company = freezed,Object? role = freezed,Object? isCurrent = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Experience].
extension ExperiencePatterns on Experience {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Experience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Experience value)  $default,){
final _that = this;
switch (_that) {
case _Experience():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Experience value)?  $default,){
final _that = this;
switch (_that) {
case _Experience() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? company,  String? role,  bool? isCurrent,  String? startDate,  String? endDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.company,_that.role,_that.isCurrent,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? company,  String? role,  bool? isCurrent,  String? startDate,  String? endDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Experience():
return $default(_that.company,_that.role,_that.isCurrent,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? company,  String? role,  bool? isCurrent,  String? startDate,  String? endDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Experience() when $default != null:
return $default(_that.company,_that.role,_that.isCurrent,_that.startDate,_that.endDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Experience implements Experience {
  const _Experience({this.company, this.role, this.isCurrent, this.startDate, this.endDate, this.description});
  factory _Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);

@override final  String? company;
@override final  String? role;
@override final  bool? isCurrent;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? description;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceCopyWith<_Experience> get copyWith => __$ExperienceCopyWithImpl<_Experience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Experience&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,company,role,isCurrent,startDate,endDate,description);

@override
String toString() {
  return 'Experience(company: $company, role: $role, isCurrent: $isCurrent, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExperienceCopyWith<$Res> implements $ExperienceCopyWith<$Res> {
  factory _$ExperienceCopyWith(_Experience value, $Res Function(_Experience) _then) = __$ExperienceCopyWithImpl;
@override @useResult
$Res call({
 String? company, String? role, bool? isCurrent, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class __$ExperienceCopyWithImpl<$Res>
    implements _$ExperienceCopyWith<$Res> {
  __$ExperienceCopyWithImpl(this._self, this._then);

  final _Experience _self;
  final $Res Function(_Experience) _then;

/// Create a copy of Experience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? company = freezed,Object? role = freezed,Object? isCurrent = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_Experience(
company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
