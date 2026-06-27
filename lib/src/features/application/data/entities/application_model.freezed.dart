// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicationModel {

@JsonKey(name: '_id') String? get id;@UserOrStringConvertor() User? get applicant; String? get applicantType;@JobPostingOrStringConverter() JobPosting? get appliedForCompany; String? get referralCompany; String? get appliedByType; String? get adminApprovalStatus; String? get currentStatus; String? get jobType; bool? get applied; bool? get isVisited; bool? get isAskForReferral; String? get careerPageUrl;@JobOrStringConvertor() Job? get job; int? get matchScore; String? get adminComment; num? get rating; DateTime? get createdAt; DateTime? get updatedAt; String? get displayCompanyName;@JsonKey(name: 'jobDetails') Job? get jobDetails;@JsonKey(name: 'companyProfile') CompanyDetail? get companyProfile; List<ApplicationStatusHistory>? get statusHistory;
/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationModelCopyWith<ApplicationModel> get copyWith => _$ApplicationModelCopyWithImpl<ApplicationModel>(this as ApplicationModel, _$identity);

  /// Serializes this ApplicationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.appliedForCompany, appliedForCompany) || other.appliedForCompany == appliedForCompany)&&(identical(other.referralCompany, referralCompany) || other.referralCompany == referralCompany)&&(identical(other.appliedByType, appliedByType) || other.appliedByType == appliedByType)&&(identical(other.adminApprovalStatus, adminApprovalStatus) || other.adminApprovalStatus == adminApprovalStatus)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.applied, applied) || other.applied == applied)&&(identical(other.isVisited, isVisited) || other.isVisited == isVisited)&&(identical(other.isAskForReferral, isAskForReferral) || other.isAskForReferral == isAskForReferral)&&(identical(other.careerPageUrl, careerPageUrl) || other.careerPageUrl == careerPageUrl)&&(identical(other.job, job) || other.job == job)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.adminComment, adminComment) || other.adminComment == adminComment)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.displayCompanyName, displayCompanyName) || other.displayCompanyName == displayCompanyName)&&(identical(other.jobDetails, jobDetails) || other.jobDetails == jobDetails)&&(identical(other.companyProfile, companyProfile) || other.companyProfile == companyProfile)&&const DeepCollectionEquality().equals(other.statusHistory, statusHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicant,applicantType,appliedForCompany,referralCompany,appliedByType,adminApprovalStatus,currentStatus,jobType,applied,isVisited,isAskForReferral,careerPageUrl,job,matchScore,adminComment,rating,createdAt,updatedAt,displayCompanyName,jobDetails,companyProfile,const DeepCollectionEquality().hash(statusHistory)]);

@override
String toString() {
  return 'ApplicationModel(id: $id, applicant: $applicant, applicantType: $applicantType, appliedForCompany: $appliedForCompany, referralCompany: $referralCompany, appliedByType: $appliedByType, adminApprovalStatus: $adminApprovalStatus, currentStatus: $currentStatus, jobType: $jobType, applied: $applied, isVisited: $isVisited, isAskForReferral: $isAskForReferral, careerPageUrl: $careerPageUrl, job: $job, matchScore: $matchScore, adminComment: $adminComment, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, displayCompanyName: $displayCompanyName, jobDetails: $jobDetails, companyProfile: $companyProfile, statusHistory: $statusHistory)';
}


}

/// @nodoc
abstract mixin class $ApplicationModelCopyWith<$Res>  {
  factory $ApplicationModelCopyWith(ApplicationModel value, $Res Function(ApplicationModel) _then) = _$ApplicationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@UserOrStringConvertor() User? applicant, String? applicantType,@JobPostingOrStringConverter() JobPosting? appliedForCompany, String? referralCompany, String? appliedByType, String? adminApprovalStatus, String? currentStatus, String? jobType, bool? applied, bool? isVisited, bool? isAskForReferral, String? careerPageUrl,@JobOrStringConvertor() Job? job, int? matchScore, String? adminComment, num? rating, DateTime? createdAt, DateTime? updatedAt, String? displayCompanyName,@JsonKey(name: 'jobDetails') Job? jobDetails,@JsonKey(name: 'companyProfile') CompanyDetail? companyProfile, List<ApplicationStatusHistory>? statusHistory
});


$UserCopyWith<$Res>? get applicant;$JobPostingCopyWith<$Res>? get appliedForCompany;$JobCopyWith<$Res>? get job;$JobCopyWith<$Res>? get jobDetails;$CompanyDetailCopyWith<$Res>? get companyProfile;

}
/// @nodoc
class _$ApplicationModelCopyWithImpl<$Res>
    implements $ApplicationModelCopyWith<$Res> {
  _$ApplicationModelCopyWithImpl(this._self, this._then);

  final ApplicationModel _self;
  final $Res Function(ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? applicant = freezed,Object? applicantType = freezed,Object? appliedForCompany = freezed,Object? referralCompany = freezed,Object? appliedByType = freezed,Object? adminApprovalStatus = freezed,Object? currentStatus = freezed,Object? jobType = freezed,Object? applied = freezed,Object? isVisited = freezed,Object? isAskForReferral = freezed,Object? careerPageUrl = freezed,Object? job = freezed,Object? matchScore = freezed,Object? adminComment = freezed,Object? rating = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? displayCompanyName = freezed,Object? jobDetails = freezed,Object? companyProfile = freezed,Object? statusHistory = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as User?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,appliedForCompany: freezed == appliedForCompany ? _self.appliedForCompany : appliedForCompany // ignore: cast_nullable_to_non_nullable
as JobPosting?,referralCompany: freezed == referralCompany ? _self.referralCompany : referralCompany // ignore: cast_nullable_to_non_nullable
as String?,appliedByType: freezed == appliedByType ? _self.appliedByType : appliedByType // ignore: cast_nullable_to_non_nullable
as String?,adminApprovalStatus: freezed == adminApprovalStatus ? _self.adminApprovalStatus : adminApprovalStatus // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,applied: freezed == applied ? _self.applied : applied // ignore: cast_nullable_to_non_nullable
as bool?,isVisited: freezed == isVisited ? _self.isVisited : isVisited // ignore: cast_nullable_to_non_nullable
as bool?,isAskForReferral: freezed == isAskForReferral ? _self.isAskForReferral : isAskForReferral // ignore: cast_nullable_to_non_nullable
as bool?,careerPageUrl: freezed == careerPageUrl ? _self.careerPageUrl : careerPageUrl // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as Job?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,adminComment: freezed == adminComment ? _self.adminComment : adminComment // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayCompanyName: freezed == displayCompanyName ? _self.displayCompanyName : displayCompanyName // ignore: cast_nullable_to_non_nullable
as String?,jobDetails: freezed == jobDetails ? _self.jobDetails : jobDetails // ignore: cast_nullable_to_non_nullable
as Job?,companyProfile: freezed == companyProfile ? _self.companyProfile : companyProfile // ignore: cast_nullable_to_non_nullable
as CompanyDetail?,statusHistory: freezed == statusHistory ? _self.statusHistory : statusHistory // ignore: cast_nullable_to_non_nullable
as List<ApplicationStatusHistory>?,
  ));
}
/// Create a copy of ApplicationModel
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
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get appliedForCompany {
    if (_self.appliedForCompany == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.appliedForCompany!, (value) {
    return _then(_self.copyWith(appliedForCompany: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get jobDetails {
    if (_self.jobDetails == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.jobDetails!, (value) {
    return _then(_self.copyWith(jobDetails: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDetailCopyWith<$Res>? get companyProfile {
    if (_self.companyProfile == null) {
    return null;
  }

  return $CompanyDetailCopyWith<$Res>(_self.companyProfile!, (value) {
    return _then(_self.copyWith(companyProfile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ApplicationModel].
extension ApplicationModelPatterns on ApplicationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationModel value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @UserOrStringConvertor()  User? applicant,  String? applicantType, @JobPostingOrStringConverter()  JobPosting? appliedForCompany,  String? referralCompany,  String? appliedByType,  String? adminApprovalStatus,  String? currentStatus,  String? jobType,  bool? applied,  bool? isVisited,  bool? isAskForReferral,  String? careerPageUrl, @JobOrStringConvertor()  Job? job,  int? matchScore,  String? adminComment,  num? rating,  DateTime? createdAt,  DateTime? updatedAt,  String? displayCompanyName, @JsonKey(name: 'jobDetails')  Job? jobDetails, @JsonKey(name: 'companyProfile')  CompanyDetail? companyProfile,  List<ApplicationStatusHistory>? statusHistory)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.applicant,_that.applicantType,_that.appliedForCompany,_that.referralCompany,_that.appliedByType,_that.adminApprovalStatus,_that.currentStatus,_that.jobType,_that.applied,_that.isVisited,_that.isAskForReferral,_that.careerPageUrl,_that.job,_that.matchScore,_that.adminComment,_that.rating,_that.createdAt,_that.updatedAt,_that.displayCompanyName,_that.jobDetails,_that.companyProfile,_that.statusHistory);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @UserOrStringConvertor()  User? applicant,  String? applicantType, @JobPostingOrStringConverter()  JobPosting? appliedForCompany,  String? referralCompany,  String? appliedByType,  String? adminApprovalStatus,  String? currentStatus,  String? jobType,  bool? applied,  bool? isVisited,  bool? isAskForReferral,  String? careerPageUrl, @JobOrStringConvertor()  Job? job,  int? matchScore,  String? adminComment,  num? rating,  DateTime? createdAt,  DateTime? updatedAt,  String? displayCompanyName, @JsonKey(name: 'jobDetails')  Job? jobDetails, @JsonKey(name: 'companyProfile')  CompanyDetail? companyProfile,  List<ApplicationStatusHistory>? statusHistory)  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel():
return $default(_that.id,_that.applicant,_that.applicantType,_that.appliedForCompany,_that.referralCompany,_that.appliedByType,_that.adminApprovalStatus,_that.currentStatus,_that.jobType,_that.applied,_that.isVisited,_that.isAskForReferral,_that.careerPageUrl,_that.job,_that.matchScore,_that.adminComment,_that.rating,_that.createdAt,_that.updatedAt,_that.displayCompanyName,_that.jobDetails,_that.companyProfile,_that.statusHistory);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id, @UserOrStringConvertor()  User? applicant,  String? applicantType, @JobPostingOrStringConverter()  JobPosting? appliedForCompany,  String? referralCompany,  String? appliedByType,  String? adminApprovalStatus,  String? currentStatus,  String? jobType,  bool? applied,  bool? isVisited,  bool? isAskForReferral,  String? careerPageUrl, @JobOrStringConvertor()  Job? job,  int? matchScore,  String? adminComment,  num? rating,  DateTime? createdAt,  DateTime? updatedAt,  String? displayCompanyName, @JsonKey(name: 'jobDetails')  Job? jobDetails, @JsonKey(name: 'companyProfile')  CompanyDetail? companyProfile,  List<ApplicationStatusHistory>? statusHistory)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationModel() when $default != null:
return $default(_that.id,_that.applicant,_that.applicantType,_that.appliedForCompany,_that.referralCompany,_that.appliedByType,_that.adminApprovalStatus,_that.currentStatus,_that.jobType,_that.applied,_that.isVisited,_that.isAskForReferral,_that.careerPageUrl,_that.job,_that.matchScore,_that.adminComment,_that.rating,_that.createdAt,_that.updatedAt,_that.displayCompanyName,_that.jobDetails,_that.companyProfile,_that.statusHistory);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationModel implements ApplicationModel {
  const _ApplicationModel({@JsonKey(name: '_id') this.id, @UserOrStringConvertor() this.applicant, this.applicantType, @JobPostingOrStringConverter() this.appliedForCompany, this.referralCompany, this.appliedByType, this.adminApprovalStatus, this.currentStatus, this.jobType, this.applied, this.isVisited, this.isAskForReferral, this.careerPageUrl, @JobOrStringConvertor() this.job, this.matchScore, this.adminComment, this.rating, this.createdAt, this.updatedAt, this.displayCompanyName, @JsonKey(name: 'jobDetails') this.jobDetails, @JsonKey(name: 'companyProfile') this.companyProfile, final  List<ApplicationStatusHistory>? statusHistory}): _statusHistory = statusHistory;
  factory _ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@UserOrStringConvertor() final  User? applicant;
@override final  String? applicantType;
@override@JobPostingOrStringConverter() final  JobPosting? appliedForCompany;
@override final  String? referralCompany;
@override final  String? appliedByType;
@override final  String? adminApprovalStatus;
@override final  String? currentStatus;
@override final  String? jobType;
@override final  bool? applied;
@override final  bool? isVisited;
@override final  bool? isAskForReferral;
@override final  String? careerPageUrl;
@override@JobOrStringConvertor() final  Job? job;
@override final  int? matchScore;
@override final  String? adminComment;
@override final  num? rating;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override final  String? displayCompanyName;
@override@JsonKey(name: 'jobDetails') final  Job? jobDetails;
@override@JsonKey(name: 'companyProfile') final  CompanyDetail? companyProfile;
 final  List<ApplicationStatusHistory>? _statusHistory;
@override List<ApplicationStatusHistory>? get statusHistory {
  final value = _statusHistory;
  if (value == null) return null;
  if (_statusHistory is EqualUnmodifiableListView) return _statusHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationModelCopyWith<_ApplicationModel> get copyWith => __$ApplicationModelCopyWithImpl<_ApplicationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.applicant, applicant) || other.applicant == applicant)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.appliedForCompany, appliedForCompany) || other.appliedForCompany == appliedForCompany)&&(identical(other.referralCompany, referralCompany) || other.referralCompany == referralCompany)&&(identical(other.appliedByType, appliedByType) || other.appliedByType == appliedByType)&&(identical(other.adminApprovalStatus, adminApprovalStatus) || other.adminApprovalStatus == adminApprovalStatus)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.applied, applied) || other.applied == applied)&&(identical(other.isVisited, isVisited) || other.isVisited == isVisited)&&(identical(other.isAskForReferral, isAskForReferral) || other.isAskForReferral == isAskForReferral)&&(identical(other.careerPageUrl, careerPageUrl) || other.careerPageUrl == careerPageUrl)&&(identical(other.job, job) || other.job == job)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.adminComment, adminComment) || other.adminComment == adminComment)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.displayCompanyName, displayCompanyName) || other.displayCompanyName == displayCompanyName)&&(identical(other.jobDetails, jobDetails) || other.jobDetails == jobDetails)&&(identical(other.companyProfile, companyProfile) || other.companyProfile == companyProfile)&&const DeepCollectionEquality().equals(other._statusHistory, _statusHistory));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,applicant,applicantType,appliedForCompany,referralCompany,appliedByType,adminApprovalStatus,currentStatus,jobType,applied,isVisited,isAskForReferral,careerPageUrl,job,matchScore,adminComment,rating,createdAt,updatedAt,displayCompanyName,jobDetails,companyProfile,const DeepCollectionEquality().hash(_statusHistory)]);

@override
String toString() {
  return 'ApplicationModel(id: $id, applicant: $applicant, applicantType: $applicantType, appliedForCompany: $appliedForCompany, referralCompany: $referralCompany, appliedByType: $appliedByType, adminApprovalStatus: $adminApprovalStatus, currentStatus: $currentStatus, jobType: $jobType, applied: $applied, isVisited: $isVisited, isAskForReferral: $isAskForReferral, careerPageUrl: $careerPageUrl, job: $job, matchScore: $matchScore, adminComment: $adminComment, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, displayCompanyName: $displayCompanyName, jobDetails: $jobDetails, companyProfile: $companyProfile, statusHistory: $statusHistory)';
}


}

/// @nodoc
abstract mixin class _$ApplicationModelCopyWith<$Res> implements $ApplicationModelCopyWith<$Res> {
  factory _$ApplicationModelCopyWith(_ApplicationModel value, $Res Function(_ApplicationModel) _then) = __$ApplicationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@UserOrStringConvertor() User? applicant, String? applicantType,@JobPostingOrStringConverter() JobPosting? appliedForCompany, String? referralCompany, String? appliedByType, String? adminApprovalStatus, String? currentStatus, String? jobType, bool? applied, bool? isVisited, bool? isAskForReferral, String? careerPageUrl,@JobOrStringConvertor() Job? job, int? matchScore, String? adminComment, num? rating, DateTime? createdAt, DateTime? updatedAt, String? displayCompanyName,@JsonKey(name: 'jobDetails') Job? jobDetails,@JsonKey(name: 'companyProfile') CompanyDetail? companyProfile, List<ApplicationStatusHistory>? statusHistory
});


@override $UserCopyWith<$Res>? get applicant;@override $JobPostingCopyWith<$Res>? get appliedForCompany;@override $JobCopyWith<$Res>? get job;@override $JobCopyWith<$Res>? get jobDetails;@override $CompanyDetailCopyWith<$Res>? get companyProfile;

}
/// @nodoc
class __$ApplicationModelCopyWithImpl<$Res>
    implements _$ApplicationModelCopyWith<$Res> {
  __$ApplicationModelCopyWithImpl(this._self, this._then);

  final _ApplicationModel _self;
  final $Res Function(_ApplicationModel) _then;

/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? applicant = freezed,Object? applicantType = freezed,Object? appliedForCompany = freezed,Object? referralCompany = freezed,Object? appliedByType = freezed,Object? adminApprovalStatus = freezed,Object? currentStatus = freezed,Object? jobType = freezed,Object? applied = freezed,Object? isVisited = freezed,Object? isAskForReferral = freezed,Object? careerPageUrl = freezed,Object? job = freezed,Object? matchScore = freezed,Object? adminComment = freezed,Object? rating = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? displayCompanyName = freezed,Object? jobDetails = freezed,Object? companyProfile = freezed,Object? statusHistory = freezed,}) {
  return _then(_ApplicationModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,applicant: freezed == applicant ? _self.applicant : applicant // ignore: cast_nullable_to_non_nullable
as User?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,appliedForCompany: freezed == appliedForCompany ? _self.appliedForCompany : appliedForCompany // ignore: cast_nullable_to_non_nullable
as JobPosting?,referralCompany: freezed == referralCompany ? _self.referralCompany : referralCompany // ignore: cast_nullable_to_non_nullable
as String?,appliedByType: freezed == appliedByType ? _self.appliedByType : appliedByType // ignore: cast_nullable_to_non_nullable
as String?,adminApprovalStatus: freezed == adminApprovalStatus ? _self.adminApprovalStatus : adminApprovalStatus // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,applied: freezed == applied ? _self.applied : applied // ignore: cast_nullable_to_non_nullable
as bool?,isVisited: freezed == isVisited ? _self.isVisited : isVisited // ignore: cast_nullable_to_non_nullable
as bool?,isAskForReferral: freezed == isAskForReferral ? _self.isAskForReferral : isAskForReferral // ignore: cast_nullable_to_non_nullable
as bool?,careerPageUrl: freezed == careerPageUrl ? _self.careerPageUrl : careerPageUrl // ignore: cast_nullable_to_non_nullable
as String?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as Job?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,adminComment: freezed == adminComment ? _self.adminComment : adminComment // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,displayCompanyName: freezed == displayCompanyName ? _self.displayCompanyName : displayCompanyName // ignore: cast_nullable_to_non_nullable
as String?,jobDetails: freezed == jobDetails ? _self.jobDetails : jobDetails // ignore: cast_nullable_to_non_nullable
as Job?,companyProfile: freezed == companyProfile ? _self.companyProfile : companyProfile // ignore: cast_nullable_to_non_nullable
as CompanyDetail?,statusHistory: freezed == statusHistory ? _self._statusHistory : statusHistory // ignore: cast_nullable_to_non_nullable
as List<ApplicationStatusHistory>?,
  ));
}

/// Create a copy of ApplicationModel
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
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get appliedForCompany {
    if (_self.appliedForCompany == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.appliedForCompany!, (value) {
    return _then(_self.copyWith(appliedForCompany: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get jobDetails {
    if (_self.jobDetails == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.jobDetails!, (value) {
    return _then(_self.copyWith(jobDetails: value));
  });
}/// Create a copy of ApplicationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDetailCopyWith<$Res>? get companyProfile {
    if (_self.companyProfile == null) {
    return null;
  }

  return $CompanyDetailCopyWith<$Res>(_self.companyProfile!, (value) {
    return _then(_self.copyWith(companyProfile: value));
  });
}
}

// dart format on
