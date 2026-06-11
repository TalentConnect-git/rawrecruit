// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreBreakdown {

 int? get skills; int? get role; int? get experience; int? get location; int? get workMode; int? get candidateType;
/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<ScoreBreakdown> get copyWith => _$ScoreBreakdownCopyWithImpl<ScoreBreakdown>(this as ScoreBreakdown, _$identity);

  /// Serializes this ScoreBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreBreakdown&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.role, role) || other.role == role)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.location, location) || other.location == location)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.candidateType, candidateType) || other.candidateType == candidateType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skills,role,experience,location,workMode,candidateType);

@override
String toString() {
  return 'ScoreBreakdown(skills: $skills, role: $role, experience: $experience, location: $location, workMode: $workMode, candidateType: $candidateType)';
}


}

/// @nodoc
abstract mixin class $ScoreBreakdownCopyWith<$Res>  {
  factory $ScoreBreakdownCopyWith(ScoreBreakdown value, $Res Function(ScoreBreakdown) _then) = _$ScoreBreakdownCopyWithImpl;
@useResult
$Res call({
 int? skills, int? role, int? experience, int? location, int? workMode, int? candidateType
});




}
/// @nodoc
class _$ScoreBreakdownCopyWithImpl<$Res>
    implements $ScoreBreakdownCopyWith<$Res> {
  _$ScoreBreakdownCopyWithImpl(this._self, this._then);

  final ScoreBreakdown _self;
  final $Res Function(ScoreBreakdown) _then;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skills = freezed,Object? role = freezed,Object? experience = freezed,Object? location = freezed,Object? workMode = freezed,Object? candidateType = freezed,}) {
  return _then(_self.copyWith(
skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as int?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as int?,candidateType: freezed == candidateType ? _self.candidateType : candidateType // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreBreakdown].
extension ScoreBreakdownPatterns on ScoreBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _ScoreBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? skills,  int? role,  int? experience,  int? location,  int? workMode,  int? candidateType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
return $default(_that.skills,_that.role,_that.experience,_that.location,_that.workMode,_that.candidateType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? skills,  int? role,  int? experience,  int? location,  int? workMode,  int? candidateType)  $default,) {final _that = this;
switch (_that) {
case _ScoreBreakdown():
return $default(_that.skills,_that.role,_that.experience,_that.location,_that.workMode,_that.candidateType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? skills,  int? role,  int? experience,  int? location,  int? workMode,  int? candidateType)?  $default,) {final _that = this;
switch (_that) {
case _ScoreBreakdown() when $default != null:
return $default(_that.skills,_that.role,_that.experience,_that.location,_that.workMode,_that.candidateType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreBreakdown implements ScoreBreakdown {
  const _ScoreBreakdown({this.skills, this.role, this.experience, this.location, this.workMode, this.candidateType});
  factory _ScoreBreakdown.fromJson(Map<String, dynamic> json) => _$ScoreBreakdownFromJson(json);

@override final  int? skills;
@override final  int? role;
@override final  int? experience;
@override final  int? location;
@override final  int? workMode;
@override final  int? candidateType;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreBreakdownCopyWith<_ScoreBreakdown> get copyWith => __$ScoreBreakdownCopyWithImpl<_ScoreBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreBreakdown&&(identical(other.skills, skills) || other.skills == skills)&&(identical(other.role, role) || other.role == role)&&(identical(other.experience, experience) || other.experience == experience)&&(identical(other.location, location) || other.location == location)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.candidateType, candidateType) || other.candidateType == candidateType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skills,role,experience,location,workMode,candidateType);

@override
String toString() {
  return 'ScoreBreakdown(skills: $skills, role: $role, experience: $experience, location: $location, workMode: $workMode, candidateType: $candidateType)';
}


}

/// @nodoc
abstract mixin class _$ScoreBreakdownCopyWith<$Res> implements $ScoreBreakdownCopyWith<$Res> {
  factory _$ScoreBreakdownCopyWith(_ScoreBreakdown value, $Res Function(_ScoreBreakdown) _then) = __$ScoreBreakdownCopyWithImpl;
@override @useResult
$Res call({
 int? skills, int? role, int? experience, int? location, int? workMode, int? candidateType
});




}
/// @nodoc
class __$ScoreBreakdownCopyWithImpl<$Res>
    implements _$ScoreBreakdownCopyWith<$Res> {
  __$ScoreBreakdownCopyWithImpl(this._self, this._then);

  final _ScoreBreakdown _self;
  final $Res Function(_ScoreBreakdown) _then;

/// Create a copy of ScoreBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skills = freezed,Object? role = freezed,Object? experience = freezed,Object? location = freezed,Object? workMode = freezed,Object? candidateType = freezed,}) {
  return _then(_ScoreBreakdown(
skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as int?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as int?,experience: freezed == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as int?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as int?,candidateType: freezed == candidateType ? _self.candidateType : candidateType // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
