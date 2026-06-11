// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'web_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyJobsDiscovery {

 String? get companyName; String? get companySlug; String? get atsType; String? get candidateProfileType; String? get candidateExperience; String? get candidateExperienceLevel; int? get totalFetched; int? get totalMatched; List<CompanyJob>? get jobs;
/// Create a copy of CompanyJobsDiscovery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyJobsDiscoveryCopyWith<CompanyJobsDiscovery> get copyWith => _$CompanyJobsDiscoveryCopyWithImpl<CompanyJobsDiscovery>(this as CompanyJobsDiscovery, _$identity);

  /// Serializes this CompanyJobsDiscovery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyJobsDiscovery&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companySlug, companySlug) || other.companySlug == companySlug)&&(identical(other.atsType, atsType) || other.atsType == atsType)&&(identical(other.candidateProfileType, candidateProfileType) || other.candidateProfileType == candidateProfileType)&&(identical(other.candidateExperience, candidateExperience) || other.candidateExperience == candidateExperience)&&(identical(other.candidateExperienceLevel, candidateExperienceLevel) || other.candidateExperienceLevel == candidateExperienceLevel)&&(identical(other.totalFetched, totalFetched) || other.totalFetched == totalFetched)&&(identical(other.totalMatched, totalMatched) || other.totalMatched == totalMatched)&&const DeepCollectionEquality().equals(other.jobs, jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,companySlug,atsType,candidateProfileType,candidateExperience,candidateExperienceLevel,totalFetched,totalMatched,const DeepCollectionEquality().hash(jobs));

@override
String toString() {
  return 'CompanyJobsDiscovery(companyName: $companyName, companySlug: $companySlug, atsType: $atsType, candidateProfileType: $candidateProfileType, candidateExperience: $candidateExperience, candidateExperienceLevel: $candidateExperienceLevel, totalFetched: $totalFetched, totalMatched: $totalMatched, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class $CompanyJobsDiscoveryCopyWith<$Res>  {
  factory $CompanyJobsDiscoveryCopyWith(CompanyJobsDiscovery value, $Res Function(CompanyJobsDiscovery) _then) = _$CompanyJobsDiscoveryCopyWithImpl;
@useResult
$Res call({
 String? companyName, String? companySlug, String? atsType, String? candidateProfileType, String? candidateExperience, String? candidateExperienceLevel, int? totalFetched, int? totalMatched, List<CompanyJob>? jobs
});




}
/// @nodoc
class _$CompanyJobsDiscoveryCopyWithImpl<$Res>
    implements $CompanyJobsDiscoveryCopyWith<$Res> {
  _$CompanyJobsDiscoveryCopyWithImpl(this._self, this._then);

  final CompanyJobsDiscovery _self;
  final $Res Function(CompanyJobsDiscovery) _then;

/// Create a copy of CompanyJobsDiscovery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? companySlug = freezed,Object? atsType = freezed,Object? candidateProfileType = freezed,Object? candidateExperience = freezed,Object? candidateExperienceLevel = freezed,Object? totalFetched = freezed,Object? totalMatched = freezed,Object? jobs = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companySlug: freezed == companySlug ? _self.companySlug : companySlug // ignore: cast_nullable_to_non_nullable
as String?,atsType: freezed == atsType ? _self.atsType : atsType // ignore: cast_nullable_to_non_nullable
as String?,candidateProfileType: freezed == candidateProfileType ? _self.candidateProfileType : candidateProfileType // ignore: cast_nullable_to_non_nullable
as String?,candidateExperience: freezed == candidateExperience ? _self.candidateExperience : candidateExperience // ignore: cast_nullable_to_non_nullable
as String?,candidateExperienceLevel: freezed == candidateExperienceLevel ? _self.candidateExperienceLevel : candidateExperienceLevel // ignore: cast_nullable_to_non_nullable
as String?,totalFetched: freezed == totalFetched ? _self.totalFetched : totalFetched // ignore: cast_nullable_to_non_nullable
as int?,totalMatched: freezed == totalMatched ? _self.totalMatched : totalMatched // ignore: cast_nullable_to_non_nullable
as int?,jobs: freezed == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<CompanyJob>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyJobsDiscovery].
extension CompanyJobsDiscoveryPatterns on CompanyJobsDiscovery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyJobsDiscovery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyJobsDiscovery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyJobsDiscovery value)  $default,){
final _that = this;
switch (_that) {
case _CompanyJobsDiscovery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyJobsDiscovery value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyJobsDiscovery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companyName,  String? companySlug,  String? atsType,  String? candidateProfileType,  String? candidateExperience,  String? candidateExperienceLevel,  int? totalFetched,  int? totalMatched,  List<CompanyJob>? jobs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyJobsDiscovery() when $default != null:
return $default(_that.companyName,_that.companySlug,_that.atsType,_that.candidateProfileType,_that.candidateExperience,_that.candidateExperienceLevel,_that.totalFetched,_that.totalMatched,_that.jobs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companyName,  String? companySlug,  String? atsType,  String? candidateProfileType,  String? candidateExperience,  String? candidateExperienceLevel,  int? totalFetched,  int? totalMatched,  List<CompanyJob>? jobs)  $default,) {final _that = this;
switch (_that) {
case _CompanyJobsDiscovery():
return $default(_that.companyName,_that.companySlug,_that.atsType,_that.candidateProfileType,_that.candidateExperience,_that.candidateExperienceLevel,_that.totalFetched,_that.totalMatched,_that.jobs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companyName,  String? companySlug,  String? atsType,  String? candidateProfileType,  String? candidateExperience,  String? candidateExperienceLevel,  int? totalFetched,  int? totalMatched,  List<CompanyJob>? jobs)?  $default,) {final _that = this;
switch (_that) {
case _CompanyJobsDiscovery() when $default != null:
return $default(_that.companyName,_that.companySlug,_that.atsType,_that.candidateProfileType,_that.candidateExperience,_that.candidateExperienceLevel,_that.totalFetched,_that.totalMatched,_that.jobs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyJobsDiscovery implements CompanyJobsDiscovery {
  const _CompanyJobsDiscovery({this.companyName, this.companySlug, this.atsType, this.candidateProfileType, this.candidateExperience, this.candidateExperienceLevel, this.totalFetched, this.totalMatched, final  List<CompanyJob>? jobs}): _jobs = jobs;
  factory _CompanyJobsDiscovery.fromJson(Map<String, dynamic> json) => _$CompanyJobsDiscoveryFromJson(json);

@override final  String? companyName;
@override final  String? companySlug;
@override final  String? atsType;
@override final  String? candidateProfileType;
@override final  String? candidateExperience;
@override final  String? candidateExperienceLevel;
@override final  int? totalFetched;
@override final  int? totalMatched;
 final  List<CompanyJob>? _jobs;
@override List<CompanyJob>? get jobs {
  final value = _jobs;
  if (value == null) return null;
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CompanyJobsDiscovery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyJobsDiscoveryCopyWith<_CompanyJobsDiscovery> get copyWith => __$CompanyJobsDiscoveryCopyWithImpl<_CompanyJobsDiscovery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyJobsDiscoveryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyJobsDiscovery&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companySlug, companySlug) || other.companySlug == companySlug)&&(identical(other.atsType, atsType) || other.atsType == atsType)&&(identical(other.candidateProfileType, candidateProfileType) || other.candidateProfileType == candidateProfileType)&&(identical(other.candidateExperience, candidateExperience) || other.candidateExperience == candidateExperience)&&(identical(other.candidateExperienceLevel, candidateExperienceLevel) || other.candidateExperienceLevel == candidateExperienceLevel)&&(identical(other.totalFetched, totalFetched) || other.totalFetched == totalFetched)&&(identical(other.totalMatched, totalMatched) || other.totalMatched == totalMatched)&&const DeepCollectionEquality().equals(other._jobs, _jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,companySlug,atsType,candidateProfileType,candidateExperience,candidateExperienceLevel,totalFetched,totalMatched,const DeepCollectionEquality().hash(_jobs));

@override
String toString() {
  return 'CompanyJobsDiscovery(companyName: $companyName, companySlug: $companySlug, atsType: $atsType, candidateProfileType: $candidateProfileType, candidateExperience: $candidateExperience, candidateExperienceLevel: $candidateExperienceLevel, totalFetched: $totalFetched, totalMatched: $totalMatched, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class _$CompanyJobsDiscoveryCopyWith<$Res> implements $CompanyJobsDiscoveryCopyWith<$Res> {
  factory _$CompanyJobsDiscoveryCopyWith(_CompanyJobsDiscovery value, $Res Function(_CompanyJobsDiscovery) _then) = __$CompanyJobsDiscoveryCopyWithImpl;
@override @useResult
$Res call({
 String? companyName, String? companySlug, String? atsType, String? candidateProfileType, String? candidateExperience, String? candidateExperienceLevel, int? totalFetched, int? totalMatched, List<CompanyJob>? jobs
});




}
/// @nodoc
class __$CompanyJobsDiscoveryCopyWithImpl<$Res>
    implements _$CompanyJobsDiscoveryCopyWith<$Res> {
  __$CompanyJobsDiscoveryCopyWithImpl(this._self, this._then);

  final _CompanyJobsDiscovery _self;
  final $Res Function(_CompanyJobsDiscovery) _then;

/// Create a copy of CompanyJobsDiscovery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? companySlug = freezed,Object? atsType = freezed,Object? candidateProfileType = freezed,Object? candidateExperience = freezed,Object? candidateExperienceLevel = freezed,Object? totalFetched = freezed,Object? totalMatched = freezed,Object? jobs = freezed,}) {
  return _then(_CompanyJobsDiscovery(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companySlug: freezed == companySlug ? _self.companySlug : companySlug // ignore: cast_nullable_to_non_nullable
as String?,atsType: freezed == atsType ? _self.atsType : atsType // ignore: cast_nullable_to_non_nullable
as String?,candidateProfileType: freezed == candidateProfileType ? _self.candidateProfileType : candidateProfileType // ignore: cast_nullable_to_non_nullable
as String?,candidateExperience: freezed == candidateExperience ? _self.candidateExperience : candidateExperience // ignore: cast_nullable_to_non_nullable
as String?,candidateExperienceLevel: freezed == candidateExperienceLevel ? _self.candidateExperienceLevel : candidateExperienceLevel // ignore: cast_nullable_to_non_nullable
as String?,totalFetched: freezed == totalFetched ? _self.totalFetched : totalFetched // ignore: cast_nullable_to_non_nullable
as int?,totalMatched: freezed == totalMatched ? _self.totalMatched : totalMatched // ignore: cast_nullable_to_non_nullable
as int?,jobs: freezed == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<CompanyJob>?,
  ));
}


}

// dart format on
