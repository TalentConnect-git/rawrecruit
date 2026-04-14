// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_application.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralApplication {

@JsonKey(name: '_id') String? get id; User? get applicant; String? get applicantType; String? get adminApprovalStatus; ReferralPostModel? get job; String? get statusText;@ApplicationStatusConvertor() ApplicationStatus? get currentStatus; DateTime? get createdAt; int? get matchScore; String? get jobTitle; List<String>? get skills;
/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralApplicationCopyWith<ReferralApplication> get copyWith => _$ReferralApplicationCopyWithImpl<ReferralApplication>(this as ReferralApplication, _$identity);

  /// Serializes this ReferralApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.adminApprovalStatus, adminApprovalStatus) || other.adminApprovalStatus == adminApprovalStatus)&&(identical(other.job, job) || other.job == job)&&(identical(other.statusText, statusText) || other.statusText == statusText)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other.skills, skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicant,applicantType,adminApprovalStatus,job,statusText,currentStatus,createdAt,matchScore,jobTitle,const DeepCollectionEquality().hash(skills));

@override
String toString() {
  return 'ReferralApplication(id: $id, applicant: $applicant, applicantType: $applicantType, adminApprovalStatus: $adminApprovalStatus, job: $job, statusText: $statusText, currentStatus: $currentStatus, createdAt: $createdAt, matchScore: $matchScore, jobTitle: $jobTitle, skills: $skills)';
}


}

/// @nodoc
abstract mixin class $ReferralApplicationCopyWith<$Res>  {
  factory $ReferralApplicationCopyWith(ReferralApplication value, $Res Function(ReferralApplication) _then) = _$ReferralApplicationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, User? applicant, String? applicantType, String? adminApprovalStatus, ReferralPostModel? job, String? statusText,@ApplicationStatusConvertor() ApplicationStatus? currentStatus, DateTime? createdAt, int? matchScore, String? jobTitle, List<String>? skills
});


$UserCopyWith<$Res>? get applicant;$ReferralPostModelCopyWith<$Res>? get job;

}
/// @nodoc
class _$ReferralApplicationCopyWithImpl<$Res>
    implements $ReferralApplicationCopyWith<$Res> {
  _$ReferralApplicationCopyWithImpl(this._self, this._then);

  final ReferralApplication _self;
  final $Res Function(ReferralApplication) _then;

/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicant = freezed,Object? applicantType = freezed,Object? adminApprovalStatus = freezed,Object? job = freezed,Object? statusText = freezed,Object? currentStatus = freezed,Object? createdAt = freezed,Object? matchScore = freezed,Object? jobTitle = freezed,Object? skills = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as User?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,adminApprovalStatus: freezed == adminApprovalStatus ? _self.adminApprovalStatus : adminApprovalStatus // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as ReferralPostModel?,statusText: freezed == statusText ? _self.statusText : statusText // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as ApplicationStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferralPostModelCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $ReferralPostModelCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferralApplication].
extension ReferralApplicationPatterns on ReferralApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralApplication value)  $default,){
final _that = this;
switch (_that) {
case _ReferralApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralApplication value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralApplication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  User? applicant,  String? applicantType,  String? adminApprovalStatus,  ReferralPostModel? job,  String? statusText, @ApplicationStatusConvertor()  ApplicationStatus? currentStatus,  DateTime? createdAt,  int? matchScore,  String? jobTitle,  List<String>? skills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralApplication() when $default != null:
return $default(_that.id,_that.applicant,_that.applicantType,_that.adminApprovalStatus,_that.job,_that.statusText,_that.currentStatus,_that.createdAt,_that.matchScore,_that.jobTitle,_that.skills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  User? applicant,  String? applicantType,  String? adminApprovalStatus,  ReferralPostModel? job,  String? statusText, @ApplicationStatusConvertor()  ApplicationStatus? currentStatus,  DateTime? createdAt,  int? matchScore,  String? jobTitle,  List<String>? skills)  $default,) {final _that = this;
switch (_that) {
case _ReferralApplication():
return $default(_that.id,_that.applicant,_that.applicantType,_that.adminApprovalStatus,_that.job,_that.statusText,_that.currentStatus,_that.createdAt,_that.matchScore,_that.jobTitle,_that.skills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  User? applicant,  String? applicantType,  String? adminApprovalStatus,  ReferralPostModel? job,  String? statusText, @ApplicationStatusConvertor()  ApplicationStatus? currentStatus,  DateTime? createdAt,  int? matchScore,  String? jobTitle,  List<String>? skills)?  $default,) {final _that = this;
switch (_that) {
case _ReferralApplication() when $default != null:
return $default(_that.id,_that.applicant,_that.applicantType,_that.adminApprovalStatus,_that.job,_that.statusText,_that.currentStatus,_that.createdAt,_that.matchScore,_that.jobTitle,_that.skills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralApplication implements ReferralApplication {
  const _ReferralApplication({@JsonKey(name: '_id') this.id, this.applicant, this.applicantType, this.adminApprovalStatus, this.job, this.statusText, @ApplicationStatusConvertor() this.currentStatus, this.createdAt, this.matchScore, this.jobTitle, final  List<String>? skills}): _skills = skills;
  factory _ReferralApplication.fromJson(Map<String, dynamic> json) => _$ReferralApplicationFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  User? applicant;
@override final  String? applicantType;
@override final  String? adminApprovalStatus;
@override final  ReferralPostModel? job;
@override final  String? statusText;
@override@ApplicationStatusConvertor() final  ApplicationStatus? currentStatus;
@override final  DateTime? createdAt;
@override final  int? matchScore;
@override final  String? jobTitle;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralApplicationCopyWith<_ReferralApplication> get copyWith => __$ReferralApplicationCopyWithImpl<_ReferralApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralApplication&&(identical(other.id, id) || other.id == id)&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.adminApprovalStatus, adminApprovalStatus) || other.adminApprovalStatus == adminApprovalStatus)&&(identical(other.job, job) || other.job == job)&&(identical(other.statusText, statusText) || other.statusText == statusText)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other._skills, _skills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,applicant,applicantType,adminApprovalStatus,job,statusText,currentStatus,createdAt,matchScore,jobTitle,const DeepCollectionEquality().hash(_skills));

@override
String toString() {
  return 'ReferralApplication(id: $id, applicant: $applicant, applicantType: $applicantType, adminApprovalStatus: $adminApprovalStatus, job: $job, statusText: $statusText, currentStatus: $currentStatus, createdAt: $createdAt, matchScore: $matchScore, jobTitle: $jobTitle, skills: $skills)';
}


}

/// @nodoc
abstract mixin class _$ReferralApplicationCopyWith<$Res> implements $ReferralApplicationCopyWith<$Res> {
  factory _$ReferralApplicationCopyWith(_ReferralApplication value, $Res Function(_ReferralApplication) _then) = __$ReferralApplicationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, User? applicant, String? applicantType, String? adminApprovalStatus, ReferralPostModel? job, String? statusText,@ApplicationStatusConvertor() ApplicationStatus? currentStatus, DateTime? createdAt, int? matchScore, String? jobTitle, List<String>? skills
});


@override $UserCopyWith<$Res>? get applicant;@override $ReferralPostModelCopyWith<$Res>? get job;

}
/// @nodoc
class __$ReferralApplicationCopyWithImpl<$Res>
    implements _$ReferralApplicationCopyWith<$Res> {
  __$ReferralApplicationCopyWithImpl(this._self, this._then);

  final _ReferralApplication _self;
  final $Res Function(_ReferralApplication) _then;

/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicant = freezed,Object? applicantType = freezed,Object? adminApprovalStatus = freezed,Object? job = freezed,Object? statusText = freezed,Object? currentStatus = freezed,Object? createdAt = freezed,Object? matchScore = freezed,Object? jobTitle = freezed,Object? skills = freezed,}) {
  return _then(_ReferralApplication(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as User?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,adminApprovalStatus: freezed == adminApprovalStatus ? _self.adminApprovalStatus : adminApprovalStatus // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as ReferralPostModel?,statusText: freezed == statusText ? _self.statusText : statusText // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as ApplicationStatus?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get applicant {
    if (_self.applicant == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.applicant!, (value) {
    return _then(_self.copyWith(applicant: value));
  });
}/// Create a copy of ReferralApplication
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReferralPostModelCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $ReferralPostModelCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

// dart format on
