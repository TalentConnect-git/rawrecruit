// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyJob {

 String? get companySlug; String? get companyName; String? get companyNormalized; String? get title; String? get jobUrl; String? get applyUrl; String? get location; String? get workMode; String? get department; String? get jdSnippet; String? get description; List<String>? get requiredSkills; List<String>? get matchedSkills; List<String>? get missingSkills; String? get experienceRequired; String? get salaryRange; String? get postedDate; String? get jobId; String? get atsSource; int? get matchScore;@JsonKey(name: 'scoreBreakdown') ScoreBreakdown? get scoreBreakdown; int? get alumniCount; int? get totalEmployeeCount; String? get onboardingId; bool? get referralRequested;
/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyJobCopyWith<CompanyJob> get copyWith => _$CompanyJobCopyWithImpl<CompanyJob>(this as CompanyJob, _$identity);

  /// Serializes this CompanyJob to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyJob&&(identical(other.companySlug, companySlug) || other.companySlug == companySlug)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyNormalized, companyNormalized) || other.companyNormalized == companyNormalized)&&(identical(other.title, title) || other.title == title)&&(identical(other.jobUrl, jobUrl) || other.jobUrl == jobUrl)&&(identical(other.applyUrl, applyUrl) || other.applyUrl == applyUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.department, department) || other.department == department)&&(identical(other.jdSnippet, jdSnippet) || other.jdSnippet == jdSnippet)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.requiredSkills, requiredSkills)&&const DeepCollectionEquality().equals(other.matchedSkills, matchedSkills)&&const DeepCollectionEquality().equals(other.missingSkills, missingSkills)&&(identical(other.experienceRequired, experienceRequired) || other.experienceRequired == experienceRequired)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&(identical(other.postedDate, postedDate) || other.postedDate == postedDate)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.atsSource, atsSource) || other.atsSource == atsSource)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.alumniCount, alumniCount) || other.alumniCount == alumniCount)&&(identical(other.totalEmployeeCount, totalEmployeeCount) || other.totalEmployeeCount == totalEmployeeCount)&&(identical(other.onboardingId, onboardingId) || other.onboardingId == onboardingId)&&(identical(other.referralRequested, referralRequested) || other.referralRequested == referralRequested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,companySlug,companyName,companyNormalized,title,jobUrl,applyUrl,location,workMode,department,jdSnippet,description,const DeepCollectionEquality().hash(requiredSkills),const DeepCollectionEquality().hash(matchedSkills),const DeepCollectionEquality().hash(missingSkills),experienceRequired,salaryRange,postedDate,jobId,atsSource,matchScore,scoreBreakdown,alumniCount,totalEmployeeCount,onboardingId,referralRequested]);

@override
String toString() {
  return 'CompanyJob(companySlug: $companySlug, companyName: $companyName, companyNormalized: $companyNormalized, title: $title, jobUrl: $jobUrl, applyUrl: $applyUrl, location: $location, workMode: $workMode, department: $department, jdSnippet: $jdSnippet, description: $description, requiredSkills: $requiredSkills, matchedSkills: $matchedSkills, missingSkills: $missingSkills, experienceRequired: $experienceRequired, salaryRange: $salaryRange, postedDate: $postedDate, jobId: $jobId, atsSource: $atsSource, matchScore: $matchScore, scoreBreakdown: $scoreBreakdown, alumniCount: $alumniCount, totalEmployeeCount: $totalEmployeeCount, onboardingId: $onboardingId, referralRequested: $referralRequested)';
}


}

/// @nodoc
abstract mixin class $CompanyJobCopyWith<$Res>  {
  factory $CompanyJobCopyWith(CompanyJob value, $Res Function(CompanyJob) _then) = _$CompanyJobCopyWithImpl;
@useResult
$Res call({
 String? companySlug, String? companyName, String? companyNormalized, String? title, String? jobUrl, String? applyUrl, String? location, String? workMode, String? department, String? jdSnippet, String? description, List<String>? requiredSkills, List<String>? matchedSkills, List<String>? missingSkills, String? experienceRequired, String? salaryRange, String? postedDate, String? jobId, String? atsSource, int? matchScore,@JsonKey(name: 'scoreBreakdown') ScoreBreakdown? scoreBreakdown, int? alumniCount, int? totalEmployeeCount, String? onboardingId, bool? referralRequested
});


$ScoreBreakdownCopyWith<$Res>? get scoreBreakdown;

}
/// @nodoc
class _$CompanyJobCopyWithImpl<$Res>
    implements $CompanyJobCopyWith<$Res> {
  _$CompanyJobCopyWithImpl(this._self, this._then);

  final CompanyJob _self;
  final $Res Function(CompanyJob) _then;

/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companySlug = freezed,Object? companyName = freezed,Object? companyNormalized = freezed,Object? title = freezed,Object? jobUrl = freezed,Object? applyUrl = freezed,Object? location = freezed,Object? workMode = freezed,Object? department = freezed,Object? jdSnippet = freezed,Object? description = freezed,Object? requiredSkills = freezed,Object? matchedSkills = freezed,Object? missingSkills = freezed,Object? experienceRequired = freezed,Object? salaryRange = freezed,Object? postedDate = freezed,Object? jobId = freezed,Object? atsSource = freezed,Object? matchScore = freezed,Object? scoreBreakdown = freezed,Object? alumniCount = freezed,Object? totalEmployeeCount = freezed,Object? onboardingId = freezed,Object? referralRequested = freezed,}) {
  return _then(_self.copyWith(
companySlug: freezed == companySlug ? _self.companySlug : companySlug // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyNormalized: freezed == companyNormalized ? _self.companyNormalized : companyNormalized // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,jobUrl: freezed == jobUrl ? _self.jobUrl : jobUrl // ignore: cast_nullable_to_non_nullable
as String?,applyUrl: freezed == applyUrl ? _self.applyUrl : applyUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,jdSnippet: freezed == jdSnippet ? _self.jdSnippet : jdSnippet // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,requiredSkills: freezed == requiredSkills ? _self.requiredSkills : requiredSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,matchedSkills: freezed == matchedSkills ? _self.matchedSkills : matchedSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,missingSkills: freezed == missingSkills ? _self.missingSkills : missingSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,experienceRequired: freezed == experienceRequired ? _self.experienceRequired : experienceRequired // ignore: cast_nullable_to_non_nullable
as String?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,postedDate: freezed == postedDate ? _self.postedDate : postedDate // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,atsSource: freezed == atsSource ? _self.atsSource : atsSource // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,scoreBreakdown: freezed == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown?,alumniCount: freezed == alumniCount ? _self.alumniCount : alumniCount // ignore: cast_nullable_to_non_nullable
as int?,totalEmployeeCount: freezed == totalEmployeeCount ? _self.totalEmployeeCount : totalEmployeeCount // ignore: cast_nullable_to_non_nullable
as int?,onboardingId: freezed == onboardingId ? _self.onboardingId : onboardingId // ignore: cast_nullable_to_non_nullable
as String?,referralRequested: freezed == referralRequested ? _self.referralRequested : referralRequested // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res>? get scoreBreakdown {
    if (_self.scoreBreakdown == null) {
    return null;
  }

  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown!, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}
}


/// Adds pattern-matching-related methods to [CompanyJob].
extension CompanyJobPatterns on CompanyJob {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyJob value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyJob() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyJob value)  $default,){
final _that = this;
switch (_that) {
case _CompanyJob():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyJob value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyJob() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companySlug,  String? companyName,  String? companyNormalized,  String? title,  String? jobUrl,  String? applyUrl,  String? location,  String? workMode,  String? department,  String? jdSnippet,  String? description,  List<String>? requiredSkills,  List<String>? matchedSkills,  List<String>? missingSkills,  String? experienceRequired,  String? salaryRange,  String? postedDate,  String? jobId,  String? atsSource,  int? matchScore, @JsonKey(name: 'scoreBreakdown')  ScoreBreakdown? scoreBreakdown,  int? alumniCount,  int? totalEmployeeCount,  String? onboardingId,  bool? referralRequested)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyJob() when $default != null:
return $default(_that.companySlug,_that.companyName,_that.companyNormalized,_that.title,_that.jobUrl,_that.applyUrl,_that.location,_that.workMode,_that.department,_that.jdSnippet,_that.description,_that.requiredSkills,_that.matchedSkills,_that.missingSkills,_that.experienceRequired,_that.salaryRange,_that.postedDate,_that.jobId,_that.atsSource,_that.matchScore,_that.scoreBreakdown,_that.alumniCount,_that.totalEmployeeCount,_that.onboardingId,_that.referralRequested);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companySlug,  String? companyName,  String? companyNormalized,  String? title,  String? jobUrl,  String? applyUrl,  String? location,  String? workMode,  String? department,  String? jdSnippet,  String? description,  List<String>? requiredSkills,  List<String>? matchedSkills,  List<String>? missingSkills,  String? experienceRequired,  String? salaryRange,  String? postedDate,  String? jobId,  String? atsSource,  int? matchScore, @JsonKey(name: 'scoreBreakdown')  ScoreBreakdown? scoreBreakdown,  int? alumniCount,  int? totalEmployeeCount,  String? onboardingId,  bool? referralRequested)  $default,) {final _that = this;
switch (_that) {
case _CompanyJob():
return $default(_that.companySlug,_that.companyName,_that.companyNormalized,_that.title,_that.jobUrl,_that.applyUrl,_that.location,_that.workMode,_that.department,_that.jdSnippet,_that.description,_that.requiredSkills,_that.matchedSkills,_that.missingSkills,_that.experienceRequired,_that.salaryRange,_that.postedDate,_that.jobId,_that.atsSource,_that.matchScore,_that.scoreBreakdown,_that.alumniCount,_that.totalEmployeeCount,_that.onboardingId,_that.referralRequested);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companySlug,  String? companyName,  String? companyNormalized,  String? title,  String? jobUrl,  String? applyUrl,  String? location,  String? workMode,  String? department,  String? jdSnippet,  String? description,  List<String>? requiredSkills,  List<String>? matchedSkills,  List<String>? missingSkills,  String? experienceRequired,  String? salaryRange,  String? postedDate,  String? jobId,  String? atsSource,  int? matchScore, @JsonKey(name: 'scoreBreakdown')  ScoreBreakdown? scoreBreakdown,  int? alumniCount,  int? totalEmployeeCount,  String? onboardingId,  bool? referralRequested)?  $default,) {final _that = this;
switch (_that) {
case _CompanyJob() when $default != null:
return $default(_that.companySlug,_that.companyName,_that.companyNormalized,_that.title,_that.jobUrl,_that.applyUrl,_that.location,_that.workMode,_that.department,_that.jdSnippet,_that.description,_that.requiredSkills,_that.matchedSkills,_that.missingSkills,_that.experienceRequired,_that.salaryRange,_that.postedDate,_that.jobId,_that.atsSource,_that.matchScore,_that.scoreBreakdown,_that.alumniCount,_that.totalEmployeeCount,_that.onboardingId,_that.referralRequested);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyJob implements CompanyJob {
  const _CompanyJob({this.companySlug, this.companyName, this.companyNormalized, this.title, this.jobUrl, this.applyUrl, this.location, this.workMode, this.department, this.jdSnippet, this.description, final  List<String>? requiredSkills, final  List<String>? matchedSkills, final  List<String>? missingSkills, this.experienceRequired, this.salaryRange, this.postedDate, this.jobId, this.atsSource, this.matchScore, @JsonKey(name: 'scoreBreakdown') this.scoreBreakdown, this.alumniCount, this.totalEmployeeCount, this.onboardingId, this.referralRequested}): _requiredSkills = requiredSkills,_matchedSkills = matchedSkills,_missingSkills = missingSkills;
  factory _CompanyJob.fromJson(Map<String, dynamic> json) => _$CompanyJobFromJson(json);

@override final  String? companySlug;
@override final  String? companyName;
@override final  String? companyNormalized;
@override final  String? title;
@override final  String? jobUrl;
@override final  String? applyUrl;
@override final  String? location;
@override final  String? workMode;
@override final  String? department;
@override final  String? jdSnippet;
@override final  String? description;
 final  List<String>? _requiredSkills;
@override List<String>? get requiredSkills {
  final value = _requiredSkills;
  if (value == null) return null;
  if (_requiredSkills is EqualUnmodifiableListView) return _requiredSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _matchedSkills;
@override List<String>? get matchedSkills {
  final value = _matchedSkills;
  if (value == null) return null;
  if (_matchedSkills is EqualUnmodifiableListView) return _matchedSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _missingSkills;
@override List<String>? get missingSkills {
  final value = _missingSkills;
  if (value == null) return null;
  if (_missingSkills is EqualUnmodifiableListView) return _missingSkills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? experienceRequired;
@override final  String? salaryRange;
@override final  String? postedDate;
@override final  String? jobId;
@override final  String? atsSource;
@override final  int? matchScore;
@override@JsonKey(name: 'scoreBreakdown') final  ScoreBreakdown? scoreBreakdown;
@override final  int? alumniCount;
@override final  int? totalEmployeeCount;
@override final  String? onboardingId;
@override final  bool? referralRequested;

/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyJobCopyWith<_CompanyJob> get copyWith => __$CompanyJobCopyWithImpl<_CompanyJob>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyJobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyJob&&(identical(other.companySlug, companySlug) || other.companySlug == companySlug)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.companyNormalized, companyNormalized) || other.companyNormalized == companyNormalized)&&(identical(other.title, title) || other.title == title)&&(identical(other.jobUrl, jobUrl) || other.jobUrl == jobUrl)&&(identical(other.applyUrl, applyUrl) || other.applyUrl == applyUrl)&&(identical(other.location, location) || other.location == location)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.department, department) || other.department == department)&&(identical(other.jdSnippet, jdSnippet) || other.jdSnippet == jdSnippet)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._requiredSkills, _requiredSkills)&&const DeepCollectionEquality().equals(other._matchedSkills, _matchedSkills)&&const DeepCollectionEquality().equals(other._missingSkills, _missingSkills)&&(identical(other.experienceRequired, experienceRequired) || other.experienceRequired == experienceRequired)&&(identical(other.salaryRange, salaryRange) || other.salaryRange == salaryRange)&&(identical(other.postedDate, postedDate) || other.postedDate == postedDate)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.atsSource, atsSource) || other.atsSource == atsSource)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.scoreBreakdown, scoreBreakdown) || other.scoreBreakdown == scoreBreakdown)&&(identical(other.alumniCount, alumniCount) || other.alumniCount == alumniCount)&&(identical(other.totalEmployeeCount, totalEmployeeCount) || other.totalEmployeeCount == totalEmployeeCount)&&(identical(other.onboardingId, onboardingId) || other.onboardingId == onboardingId)&&(identical(other.referralRequested, referralRequested) || other.referralRequested == referralRequested));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,companySlug,companyName,companyNormalized,title,jobUrl,applyUrl,location,workMode,department,jdSnippet,description,const DeepCollectionEquality().hash(_requiredSkills),const DeepCollectionEquality().hash(_matchedSkills),const DeepCollectionEquality().hash(_missingSkills),experienceRequired,salaryRange,postedDate,jobId,atsSource,matchScore,scoreBreakdown,alumniCount,totalEmployeeCount,onboardingId,referralRequested]);

@override
String toString() {
  return 'CompanyJob(companySlug: $companySlug, companyName: $companyName, companyNormalized: $companyNormalized, title: $title, jobUrl: $jobUrl, applyUrl: $applyUrl, location: $location, workMode: $workMode, department: $department, jdSnippet: $jdSnippet, description: $description, requiredSkills: $requiredSkills, matchedSkills: $matchedSkills, missingSkills: $missingSkills, experienceRequired: $experienceRequired, salaryRange: $salaryRange, postedDate: $postedDate, jobId: $jobId, atsSource: $atsSource, matchScore: $matchScore, scoreBreakdown: $scoreBreakdown, alumniCount: $alumniCount, totalEmployeeCount: $totalEmployeeCount, onboardingId: $onboardingId, referralRequested: $referralRequested)';
}


}

/// @nodoc
abstract mixin class _$CompanyJobCopyWith<$Res> implements $CompanyJobCopyWith<$Res> {
  factory _$CompanyJobCopyWith(_CompanyJob value, $Res Function(_CompanyJob) _then) = __$CompanyJobCopyWithImpl;
@override @useResult
$Res call({
 String? companySlug, String? companyName, String? companyNormalized, String? title, String? jobUrl, String? applyUrl, String? location, String? workMode, String? department, String? jdSnippet, String? description, List<String>? requiredSkills, List<String>? matchedSkills, List<String>? missingSkills, String? experienceRequired, String? salaryRange, String? postedDate, String? jobId, String? atsSource, int? matchScore,@JsonKey(name: 'scoreBreakdown') ScoreBreakdown? scoreBreakdown, int? alumniCount, int? totalEmployeeCount, String? onboardingId, bool? referralRequested
});


@override $ScoreBreakdownCopyWith<$Res>? get scoreBreakdown;

}
/// @nodoc
class __$CompanyJobCopyWithImpl<$Res>
    implements _$CompanyJobCopyWith<$Res> {
  __$CompanyJobCopyWithImpl(this._self, this._then);

  final _CompanyJob _self;
  final $Res Function(_CompanyJob) _then;

/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companySlug = freezed,Object? companyName = freezed,Object? companyNormalized = freezed,Object? title = freezed,Object? jobUrl = freezed,Object? applyUrl = freezed,Object? location = freezed,Object? workMode = freezed,Object? department = freezed,Object? jdSnippet = freezed,Object? description = freezed,Object? requiredSkills = freezed,Object? matchedSkills = freezed,Object? missingSkills = freezed,Object? experienceRequired = freezed,Object? salaryRange = freezed,Object? postedDate = freezed,Object? jobId = freezed,Object? atsSource = freezed,Object? matchScore = freezed,Object? scoreBreakdown = freezed,Object? alumniCount = freezed,Object? totalEmployeeCount = freezed,Object? onboardingId = freezed,Object? referralRequested = freezed,}) {
  return _then(_CompanyJob(
companySlug: freezed == companySlug ? _self.companySlug : companySlug // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,companyNormalized: freezed == companyNormalized ? _self.companyNormalized : companyNormalized // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,jobUrl: freezed == jobUrl ? _self.jobUrl : jobUrl // ignore: cast_nullable_to_non_nullable
as String?,applyUrl: freezed == applyUrl ? _self.applyUrl : applyUrl // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,jdSnippet: freezed == jdSnippet ? _self.jdSnippet : jdSnippet // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,requiredSkills: freezed == requiredSkills ? _self._requiredSkills : requiredSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,matchedSkills: freezed == matchedSkills ? _self._matchedSkills : matchedSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,missingSkills: freezed == missingSkills ? _self._missingSkills : missingSkills // ignore: cast_nullable_to_non_nullable
as List<String>?,experienceRequired: freezed == experienceRequired ? _self.experienceRequired : experienceRequired // ignore: cast_nullable_to_non_nullable
as String?,salaryRange: freezed == salaryRange ? _self.salaryRange : salaryRange // ignore: cast_nullable_to_non_nullable
as String?,postedDate: freezed == postedDate ? _self.postedDate : postedDate // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,atsSource: freezed == atsSource ? _self.atsSource : atsSource // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,scoreBreakdown: freezed == scoreBreakdown ? _self.scoreBreakdown : scoreBreakdown // ignore: cast_nullable_to_non_nullable
as ScoreBreakdown?,alumniCount: freezed == alumniCount ? _self.alumniCount : alumniCount // ignore: cast_nullable_to_non_nullable
as int?,totalEmployeeCount: freezed == totalEmployeeCount ? _self.totalEmployeeCount : totalEmployeeCount // ignore: cast_nullable_to_non_nullable
as int?,onboardingId: freezed == onboardingId ? _self.onboardingId : onboardingId // ignore: cast_nullable_to_non_nullable
as String?,referralRequested: freezed == referralRequested ? _self.referralRequested : referralRequested // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of CompanyJob
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBreakdownCopyWith<$Res>? get scoreBreakdown {
    if (_self.scoreBreakdown == null) {
    return null;
  }

  return $ScoreBreakdownCopyWith<$Res>(_self.scoreBreakdown!, (value) {
    return _then(_self.copyWith(scoreBreakdown: value));
  });
}
}

// dart format on
