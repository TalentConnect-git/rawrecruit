// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralJobModel {

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'candidatePosted') CandidatePosted? get candidatePosted; String? get jobTitle; String? get description; String? get jobStatus; String? get companyName; String? get approvalStatus; String? get jobType; String? get visibleTo; String? get broadcastType; String? get minEducation; String? get workAuthorization; String? get eligibilityCriteria; String? get yearsOfExperience; String? get status; int? get numberOfOpenings; int? get cgpa; int? get views; List<String>? get location; List<String>? get workMode; List<String>? get employmentType; List<String>? get skills; List<String>? get degree; List<String>? get collegeTypes; List<String>? get collegeCategories; List<String>? get companyType; List<String>? get studentStreams; List<String>? get rounds; List<String>? get selectionProcess; List<String>? get certifications; List<String>? get workAchievements; List<String>? get amenitiesRequired; List<String>? get benefits; List<String>? get tags; List<String>? get toolsAndPlatforms; List<String>? get workLocation; List<String>? get numberOfStudent; PackageDetails? get packageDetails; DateTime? get expireAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralJobModelCopyWith<ReferralJobModel> get copyWith => _$ReferralJobModelCopyWithImpl<ReferralJobModel>(this as ReferralJobModel, _$identity);

  /// Serializes this ReferralJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.status, status) || other.status == status)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.views, views) || other.views == views)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.degree, degree)&&const DeepCollectionEquality().equals(other.collegeTypes, collegeTypes)&&const DeepCollectionEquality().equals(other.collegeCategories, collegeCategories)&&const DeepCollectionEquality().equals(other.companyType, companyType)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.rounds, rounds)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&const DeepCollectionEquality().equals(other.workAchievements, workAchievements)&&const DeepCollectionEquality().equals(other.amenitiesRequired, amenitiesRequired)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&const DeepCollectionEquality().equals(other.workLocation, workLocation)&&const DeepCollectionEquality().equals(other.numberOfStudent, numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,candidatePosted,jobTitle,description,jobStatus,companyName,approvalStatus,jobType,visibleTo,broadcastType,minEducation,workAuthorization,eligibilityCriteria,yearsOfExperience,status,numberOfOpenings,cgpa,views,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(degree),const DeepCollectionEquality().hash(collegeTypes),const DeepCollectionEquality().hash(collegeCategories),const DeepCollectionEquality().hash(companyType),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(rounds),const DeepCollectionEquality().hash(selectionProcess),const DeepCollectionEquality().hash(certifications),const DeepCollectionEquality().hash(workAchievements),const DeepCollectionEquality().hash(amenitiesRequired),const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(toolsAndPlatforms),const DeepCollectionEquality().hash(workLocation),const DeepCollectionEquality().hash(numberOfStudent),packageDetails,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'ReferralJobModel(id: $id, candidatePosted: $candidatePosted, jobTitle: $jobTitle, description: $description, jobStatus: $jobStatus, companyName: $companyName, approvalStatus: $approvalStatus, jobType: $jobType, visibleTo: $visibleTo, broadcastType: $broadcastType, minEducation: $minEducation, workAuthorization: $workAuthorization, eligibilityCriteria: $eligibilityCriteria, yearsOfExperience: $yearsOfExperience, status: $status, numberOfOpenings: $numberOfOpenings, cgpa: $cgpa, views: $views, location: $location, workMode: $workMode, employmentType: $employmentType, skills: $skills, degree: $degree, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, studentStreams: $studentStreams, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReferralJobModelCopyWith<$Res>  {
  factory $ReferralJobModelCopyWith(ReferralJobModel value, $Res Function(ReferralJobModel) _then) = _$ReferralJobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'candidatePosted') CandidatePosted? candidatePosted, String? jobTitle, String? description, String? jobStatus, String? companyName, String? approvalStatus, String? jobType, String? visibleTo, String? broadcastType, String? minEducation, String? workAuthorization, String? eligibilityCriteria, String? yearsOfExperience, String? status, int? numberOfOpenings, int? cgpa, int? views, List<String>? location, List<String>? workMode, List<String>? employmentType, List<String>? skills, List<String>? degree, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? studentStreams, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, PackageDetails? packageDetails, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


$CandidatePostedCopyWith<$Res>? get candidatePosted;$PackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class _$ReferralJobModelCopyWithImpl<$Res>
    implements $ReferralJobModelCopyWith<$Res> {
  _$ReferralJobModelCopyWithImpl(this._self, this._then);

  final ReferralJobModel _self;
  final $Res Function(ReferralJobModel) _then;

/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? candidatePosted = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobStatus = freezed,Object? companyName = freezed,Object? approvalStatus = freezed,Object? jobType = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? minEducation = freezed,Object? workAuthorization = freezed,Object? eligibilityCriteria = freezed,Object? yearsOfExperience = freezed,Object? status = freezed,Object? numberOfOpenings = freezed,Object? cgpa = freezed,Object? views = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? skills = freezed,Object? degree = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? studentStreams = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as CandidatePosted?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self.collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self.collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,rounds: freezed == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self.selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,workAchievements: freezed == workAchievements ? _self.workAchievements : workAchievements // ignore: cast_nullable_to_non_nullable
as List<String>?,amenitiesRequired: freezed == amenitiesRequired ? _self.amenitiesRequired : amenitiesRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self.toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfStudent: freezed == numberOfStudent ? _self.numberOfStudent : numberOfStudent // ignore: cast_nullable_to_non_nullable
as List<String>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CandidatePostedCopyWith<$Res>? get candidatePosted {
    if (_self.candidatePosted == null) {
    return null;
  }

  return $CandidatePostedCopyWith<$Res>(_self.candidatePosted!, (value) {
    return _then(_self.copyWith(candidatePosted: value));
  });
}/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferralJobModel].
extension ReferralJobModelPatterns on ReferralJobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralJobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralJobModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferralJobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralJobModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? jobTitle,  String? description,  String? jobStatus,  String? companyName,  String? approvalStatus,  String? jobType,  String? visibleTo,  String? broadcastType,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  String? yearsOfExperience,  String? status,  int? numberOfOpenings,  int? cgpa,  int? views,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? skills,  List<String>? degree,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? studentStreams,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  PackageDetails? packageDetails,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
return $default(_that.id,_that.candidatePosted,_that.jobTitle,_that.description,_that.jobStatus,_that.companyName,_that.approvalStatus,_that.jobType,_that.visibleTo,_that.broadcastType,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.yearsOfExperience,_that.status,_that.numberOfOpenings,_that.cgpa,_that.views,_that.location,_that.workMode,_that.employmentType,_that.skills,_that.degree,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.studentStreams,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? jobTitle,  String? description,  String? jobStatus,  String? companyName,  String? approvalStatus,  String? jobType,  String? visibleTo,  String? broadcastType,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  String? yearsOfExperience,  String? status,  int? numberOfOpenings,  int? cgpa,  int? views,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? skills,  List<String>? degree,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? studentStreams,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  PackageDetails? packageDetails,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReferralJobModel():
return $default(_that.id,_that.candidatePosted,_that.jobTitle,_that.description,_that.jobStatus,_that.companyName,_that.approvalStatus,_that.jobType,_that.visibleTo,_that.broadcastType,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.yearsOfExperience,_that.status,_that.numberOfOpenings,_that.cgpa,_that.views,_that.location,_that.workMode,_that.employmentType,_that.skills,_that.degree,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.studentStreams,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? jobTitle,  String? description,  String? jobStatus,  String? companyName,  String? approvalStatus,  String? jobType,  String? visibleTo,  String? broadcastType,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  String? yearsOfExperience,  String? status,  int? numberOfOpenings,  int? cgpa,  int? views,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? skills,  List<String>? degree,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? studentStreams,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  PackageDetails? packageDetails,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
return $default(_that.id,_that.candidatePosted,_that.jobTitle,_that.description,_that.jobStatus,_that.companyName,_that.approvalStatus,_that.jobType,_that.visibleTo,_that.broadcastType,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.yearsOfExperience,_that.status,_that.numberOfOpenings,_that.cgpa,_that.views,_that.location,_that.workMode,_that.employmentType,_that.skills,_that.degree,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.studentStreams,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralJobModel implements ReferralJobModel {
  const _ReferralJobModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'candidatePosted') this.candidatePosted, this.jobTitle, this.description, this.jobStatus, this.companyName, this.approvalStatus, this.jobType, this.visibleTo, this.broadcastType, this.minEducation, this.workAuthorization, this.eligibilityCriteria, this.yearsOfExperience, this.status, this.numberOfOpenings, this.cgpa, this.views, final  List<String>? location, final  List<String>? workMode, final  List<String>? employmentType, final  List<String>? skills, final  List<String>? degree, final  List<String>? collegeTypes, final  List<String>? collegeCategories, final  List<String>? companyType, final  List<String>? studentStreams, final  List<String>? rounds, final  List<String>? selectionProcess, final  List<String>? certifications, final  List<String>? workAchievements, final  List<String>? amenitiesRequired, final  List<String>? benefits, final  List<String>? tags, final  List<String>? toolsAndPlatforms, final  List<String>? workLocation, final  List<String>? numberOfStudent, this.packageDetails, this.expireAt, this.createdAt, this.updatedAt}): _location = location,_workMode = workMode,_employmentType = employmentType,_skills = skills,_degree = degree,_collegeTypes = collegeTypes,_collegeCategories = collegeCategories,_companyType = companyType,_studentStreams = studentStreams,_rounds = rounds,_selectionProcess = selectionProcess,_certifications = certifications,_workAchievements = workAchievements,_amenitiesRequired = amenitiesRequired,_benefits = benefits,_tags = tags,_toolsAndPlatforms = toolsAndPlatforms,_workLocation = workLocation,_numberOfStudent = numberOfStudent;
  factory _ReferralJobModel.fromJson(Map<String, dynamic> json) => _$ReferralJobModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'candidatePosted') final  CandidatePosted? candidatePosted;
@override final  String? jobTitle;
@override final  String? description;
@override final  String? jobStatus;
@override final  String? companyName;
@override final  String? approvalStatus;
@override final  String? jobType;
@override final  String? visibleTo;
@override final  String? broadcastType;
@override final  String? minEducation;
@override final  String? workAuthorization;
@override final  String? eligibilityCriteria;
@override final  String? yearsOfExperience;
@override final  String? status;
@override final  int? numberOfOpenings;
@override final  int? cgpa;
@override final  int? views;
 final  List<String>? _location;
@override List<String>? get location {
  final value = _location;
  if (value == null) return null;
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _workMode;
@override List<String>? get workMode {
  final value = _workMode;
  if (value == null) return null;
  if (_workMode is EqualUnmodifiableListView) return _workMode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _employmentType;
@override List<String>? get employmentType {
  final value = _employmentType;
  if (value == null) return null;
  if (_employmentType is EqualUnmodifiableListView) return _employmentType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _degree;
@override List<String>? get degree {
  final value = _degree;
  if (value == null) return null;
  if (_degree is EqualUnmodifiableListView) return _degree;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _collegeTypes;
@override List<String>? get collegeTypes {
  final value = _collegeTypes;
  if (value == null) return null;
  if (_collegeTypes is EqualUnmodifiableListView) return _collegeTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _collegeCategories;
@override List<String>? get collegeCategories {
  final value = _collegeCategories;
  if (value == null) return null;
  if (_collegeCategories is EqualUnmodifiableListView) return _collegeCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _companyType;
@override List<String>? get companyType {
  final value = _companyType;
  if (value == null) return null;
  if (_companyType is EqualUnmodifiableListView) return _companyType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _studentStreams;
@override List<String>? get studentStreams {
  final value = _studentStreams;
  if (value == null) return null;
  if (_studentStreams is EqualUnmodifiableListView) return _studentStreams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _rounds;
@override List<String>? get rounds {
  final value = _rounds;
  if (value == null) return null;
  if (_rounds is EqualUnmodifiableListView) return _rounds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _selectionProcess;
@override List<String>? get selectionProcess {
  final value = _selectionProcess;
  if (value == null) return null;
  if (_selectionProcess is EqualUnmodifiableListView) return _selectionProcess;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _certifications;
@override List<String>? get certifications {
  final value = _certifications;
  if (value == null) return null;
  if (_certifications is EqualUnmodifiableListView) return _certifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _workAchievements;
@override List<String>? get workAchievements {
  final value = _workAchievements;
  if (value == null) return null;
  if (_workAchievements is EqualUnmodifiableListView) return _workAchievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _amenitiesRequired;
@override List<String>? get amenitiesRequired {
  final value = _amenitiesRequired;
  if (value == null) return null;
  if (_amenitiesRequired is EqualUnmodifiableListView) return _amenitiesRequired;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _benefits;
@override List<String>? get benefits {
  final value = _benefits;
  if (value == null) return null;
  if (_benefits is EqualUnmodifiableListView) return _benefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _toolsAndPlatforms;
@override List<String>? get toolsAndPlatforms {
  final value = _toolsAndPlatforms;
  if (value == null) return null;
  if (_toolsAndPlatforms is EqualUnmodifiableListView) return _toolsAndPlatforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _workLocation;
@override List<String>? get workLocation {
  final value = _workLocation;
  if (value == null) return null;
  if (_workLocation is EqualUnmodifiableListView) return _workLocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _numberOfStudent;
@override List<String>? get numberOfStudent {
  final value = _numberOfStudent;
  if (value == null) return null;
  if (_numberOfStudent is EqualUnmodifiableListView) return _numberOfStudent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PackageDetails? packageDetails;
@override final  DateTime? expireAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralJobModelCopyWith<_ReferralJobModel> get copyWith => __$ReferralJobModelCopyWithImpl<_ReferralJobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralJobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.status, status) || other.status == status)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.views, views) || other.views == views)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._degree, _degree)&&const DeepCollectionEquality().equals(other._collegeTypes, _collegeTypes)&&const DeepCollectionEquality().equals(other._collegeCategories, _collegeCategories)&&const DeepCollectionEquality().equals(other._companyType, _companyType)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&const DeepCollectionEquality().equals(other._workAchievements, _workAchievements)&&const DeepCollectionEquality().equals(other._amenitiesRequired, _amenitiesRequired)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&const DeepCollectionEquality().equals(other._workLocation, _workLocation)&&const DeepCollectionEquality().equals(other._numberOfStudent, _numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,candidatePosted,jobTitle,description,jobStatus,companyName,approvalStatus,jobType,visibleTo,broadcastType,minEducation,workAuthorization,eligibilityCriteria,yearsOfExperience,status,numberOfOpenings,cgpa,views,const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_degree),const DeepCollectionEquality().hash(_collegeTypes),const DeepCollectionEquality().hash(_collegeCategories),const DeepCollectionEquality().hash(_companyType),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_rounds),const DeepCollectionEquality().hash(_selectionProcess),const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_workAchievements),const DeepCollectionEquality().hash(_amenitiesRequired),const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_toolsAndPlatforms),const DeepCollectionEquality().hash(_workLocation),const DeepCollectionEquality().hash(_numberOfStudent),packageDetails,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'ReferralJobModel(id: $id, candidatePosted: $candidatePosted, jobTitle: $jobTitle, description: $description, jobStatus: $jobStatus, companyName: $companyName, approvalStatus: $approvalStatus, jobType: $jobType, visibleTo: $visibleTo, broadcastType: $broadcastType, minEducation: $minEducation, workAuthorization: $workAuthorization, eligibilityCriteria: $eligibilityCriteria, yearsOfExperience: $yearsOfExperience, status: $status, numberOfOpenings: $numberOfOpenings, cgpa: $cgpa, views: $views, location: $location, workMode: $workMode, employmentType: $employmentType, skills: $skills, degree: $degree, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, studentStreams: $studentStreams, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReferralJobModelCopyWith<$Res> implements $ReferralJobModelCopyWith<$Res> {
  factory _$ReferralJobModelCopyWith(_ReferralJobModel value, $Res Function(_ReferralJobModel) _then) = __$ReferralJobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'candidatePosted') CandidatePosted? candidatePosted, String? jobTitle, String? description, String? jobStatus, String? companyName, String? approvalStatus, String? jobType, String? visibleTo, String? broadcastType, String? minEducation, String? workAuthorization, String? eligibilityCriteria, String? yearsOfExperience, String? status, int? numberOfOpenings, int? cgpa, int? views, List<String>? location, List<String>? workMode, List<String>? employmentType, List<String>? skills, List<String>? degree, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? studentStreams, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, PackageDetails? packageDetails, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


@override $CandidatePostedCopyWith<$Res>? get candidatePosted;@override $PackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class __$ReferralJobModelCopyWithImpl<$Res>
    implements _$ReferralJobModelCopyWith<$Res> {
  __$ReferralJobModelCopyWithImpl(this._self, this._then);

  final _ReferralJobModel _self;
  final $Res Function(_ReferralJobModel) _then;

/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? candidatePosted = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobStatus = freezed,Object? companyName = freezed,Object? approvalStatus = freezed,Object? jobType = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? minEducation = freezed,Object? workAuthorization = freezed,Object? eligibilityCriteria = freezed,Object? yearsOfExperience = freezed,Object? status = freezed,Object? numberOfOpenings = freezed,Object? cgpa = freezed,Object? views = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? skills = freezed,Object? degree = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? studentStreams = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ReferralJobModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as CandidatePosted?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self._degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self._collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self._collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self._companyType : companyType // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,rounds: freezed == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self._selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,workAchievements: freezed == workAchievements ? _self._workAchievements : workAchievements // ignore: cast_nullable_to_non_nullable
as List<String>?,amenitiesRequired: freezed == amenitiesRequired ? _self._amenitiesRequired : amenitiesRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self._toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,workLocation: freezed == workLocation ? _self._workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfStudent: freezed == numberOfStudent ? _self._numberOfStudent : numberOfStudent // ignore: cast_nullable_to_non_nullable
as List<String>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CandidatePostedCopyWith<$Res>? get candidatePosted {
    if (_self.candidatePosted == null) {
    return null;
  }

  return $CandidatePostedCopyWith<$Res>(_self.candidatePosted!, (value) {
    return _then(_self.copyWith(candidatePosted: value));
  });
}/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}
}


/// @nodoc
mixin _$CandidatePosted {

@JsonKey(name: '_id') String? get id; String? get userId;// Identity
 String? get name; String? get email; String? get phone;// Profile
 String? get about; String? get college; String? get degree; String? get specialization; String? get yearOfGraduation; String? get semester; String? get cgpa; String? get currentCompany; String? get noticePeriod; String? get openToShift; String? get profileType; String? get referralSource;// Salary
 String? get currentSalaryAmount; String? get expectedSalaryAmount;// Links
 String? get github; String? get linkedin; String? get portfolio; String? get resume; String? get certifications;// Lists
 List<dynamic>? get skills; List<dynamic>? get jobRoles; List<dynamic>? get experiences; List<dynamic>? get toolsAndPlatforms; List<dynamic>? get languagesKnown; List<dynamic>? get domainKnowledge; List<dynamic>? get employmentType; List<dynamic>? get industry; List<dynamic>? get locations; List<dynamic>? get lookingFor; List<dynamic>? get achievements; List<dynamic>? get awards; List<dynamic>? get publications; List<dynamic>? get internationalExperience; List<dynamic>? get leadership; bool? get servingNoticePeriod; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of CandidatePosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatePostedCopyWith<CandidatePosted> get copyWith => _$CandidatePostedCopyWithImpl<CandidatePosted>(this as CandidatePosted, _$identity);

  /// Serializes this CandidatePosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatePosted&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.about, about) || other.about == about)&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.experiences, experiences)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&const DeepCollectionEquality().equals(other.languagesKnown, languagesKnown)&&const DeepCollectionEquality().equals(other.domainKnowledge, domainKnowledge)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.industry, industry)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.lookingFor, lookingFor)&&const DeepCollectionEquality().equals(other.achievements, achievements)&&const DeepCollectionEquality().equals(other.awards, awards)&&const DeepCollectionEquality().equals(other.publications, publications)&&const DeepCollectionEquality().equals(other.internationalExperience, internationalExperience)&&const DeepCollectionEquality().equals(other.leadership, leadership)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,name,email,phone,about,college,degree,specialization,yearOfGraduation,semester,cgpa,currentCompany,noticePeriod,openToShift,profileType,referralSource,currentSalaryAmount,expectedSalaryAmount,github,linkedin,portfolio,resume,certifications,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(experiences),const DeepCollectionEquality().hash(toolsAndPlatforms),const DeepCollectionEquality().hash(languagesKnown),const DeepCollectionEquality().hash(domainKnowledge),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(industry),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(lookingFor),const DeepCollectionEquality().hash(achievements),const DeepCollectionEquality().hash(awards),const DeepCollectionEquality().hash(publications),const DeepCollectionEquality().hash(internationalExperience),const DeepCollectionEquality().hash(leadership),servingNoticePeriod,createdAt,updatedAt]);

@override
String toString() {
  return 'CandidatePosted(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, about: $about, college: $college, degree: $degree, specialization: $specialization, yearOfGraduation: $yearOfGraduation, semester: $semester, cgpa: $cgpa, currentCompany: $currentCompany, noticePeriod: $noticePeriod, openToShift: $openToShift, profileType: $profileType, referralSource: $referralSource, currentSalaryAmount: $currentSalaryAmount, expectedSalaryAmount: $expectedSalaryAmount, github: $github, linkedin: $linkedin, portfolio: $portfolio, resume: $resume, certifications: $certifications, skills: $skills, jobRoles: $jobRoles, experiences: $experiences, toolsAndPlatforms: $toolsAndPlatforms, languagesKnown: $languagesKnown, domainKnowledge: $domainKnowledge, employmentType: $employmentType, industry: $industry, locations: $locations, lookingFor: $lookingFor, achievements: $achievements, awards: $awards, publications: $publications, internationalExperience: $internationalExperience, leadership: $leadership, servingNoticePeriod: $servingNoticePeriod, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CandidatePostedCopyWith<$Res>  {
  factory $CandidatePostedCopyWith(CandidatePosted value, $Res Function(CandidatePosted) _then) = _$CandidatePostedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId, String? name, String? email, String? phone, String? about, String? college, String? degree, String? specialization, String? yearOfGraduation, String? semester, String? cgpa, String? currentCompany, String? noticePeriod, String? openToShift, String? profileType, String? referralSource, String? currentSalaryAmount, String? expectedSalaryAmount, String? github, String? linkedin, String? portfolio, String? resume, String? certifications, List<dynamic>? skills, List<dynamic>? jobRoles, List<dynamic>? experiences, List<dynamic>? toolsAndPlatforms, List<dynamic>? languagesKnown, List<dynamic>? domainKnowledge, List<dynamic>? employmentType, List<dynamic>? industry, List<dynamic>? locations, List<dynamic>? lookingFor, List<dynamic>? achievements, List<dynamic>? awards, List<dynamic>? publications, List<dynamic>? internationalExperience, List<dynamic>? leadership, bool? servingNoticePeriod, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$CandidatePostedCopyWithImpl<$Res>
    implements $CandidatePostedCopyWith<$Res> {
  _$CandidatePostedCopyWithImpl(this._self, this._then);

  final CandidatePosted _self;
  final $Res Function(CandidatePosted) _then;

/// Create a copy of CandidatePosted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? about = freezed,Object? college = freezed,Object? degree = freezed,Object? specialization = freezed,Object? yearOfGraduation = freezed,Object? semester = freezed,Object? cgpa = freezed,Object? currentCompany = freezed,Object? noticePeriod = freezed,Object? openToShift = freezed,Object? profileType = freezed,Object? referralSource = freezed,Object? currentSalaryAmount = freezed,Object? expectedSalaryAmount = freezed,Object? github = freezed,Object? linkedin = freezed,Object? portfolio = freezed,Object? resume = freezed,Object? certifications = freezed,Object? skills = freezed,Object? jobRoles = freezed,Object? experiences = freezed,Object? toolsAndPlatforms = freezed,Object? languagesKnown = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? industry = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? internationalExperience = freezed,Object? leadership = freezed,Object? servingNoticePeriod = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,experiences: freezed == experiences ? _self.experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self.toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,languagesKnown: freezed == languagesKnown ? _self.languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,domainKnowledge: freezed == domainKnowledge ? _self.domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,industry: freezed == industry ? _self.industry : industry // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,lookingFor: freezed == lookingFor ? _self.lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,achievements: freezed == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,awards: freezed == awards ? _self.awards : awards // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,publications: freezed == publications ? _self.publications : publications // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,internationalExperience: freezed == internationalExperience ? _self.internationalExperience : internationalExperience // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,leadership: freezed == leadership ? _self.leadership : leadership // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CandidatePosted].
extension CandidatePostedPatterns on CandidatePosted {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidatePosted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidatePosted value)  $default,){
final _that = this;
switch (_that) {
case _CandidatePosted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidatePosted value)?  $default,){
final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId,  String? name,  String? email,  String? phone,  String? about,  String? college,  String? degree,  String? specialization,  String? yearOfGraduation,  String? semester,  String? cgpa,  String? currentCompany,  String? noticePeriod,  String? openToShift,  String? profileType,  String? referralSource,  String? currentSalaryAmount,  String? expectedSalaryAmount,  String? github,  String? linkedin,  String? portfolio,  String? resume,  String? certifications,  List<dynamic>? skills,  List<dynamic>? jobRoles,  List<dynamic>? experiences,  List<dynamic>? toolsAndPlatforms,  List<dynamic>? languagesKnown,  List<dynamic>? domainKnowledge,  List<dynamic>? employmentType,  List<dynamic>? industry,  List<dynamic>? locations,  List<dynamic>? lookingFor,  List<dynamic>? achievements,  List<dynamic>? awards,  List<dynamic>? publications,  List<dynamic>? internationalExperience,  List<dynamic>? leadership,  bool? servingNoticePeriod,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.about,_that.college,_that.degree,_that.specialization,_that.yearOfGraduation,_that.semester,_that.cgpa,_that.currentCompany,_that.noticePeriod,_that.openToShift,_that.profileType,_that.referralSource,_that.currentSalaryAmount,_that.expectedSalaryAmount,_that.github,_that.linkedin,_that.portfolio,_that.resume,_that.certifications,_that.skills,_that.jobRoles,_that.experiences,_that.toolsAndPlatforms,_that.languagesKnown,_that.domainKnowledge,_that.employmentType,_that.industry,_that.locations,_that.lookingFor,_that.achievements,_that.awards,_that.publications,_that.internationalExperience,_that.leadership,_that.servingNoticePeriod,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? userId,  String? name,  String? email,  String? phone,  String? about,  String? college,  String? degree,  String? specialization,  String? yearOfGraduation,  String? semester,  String? cgpa,  String? currentCompany,  String? noticePeriod,  String? openToShift,  String? profileType,  String? referralSource,  String? currentSalaryAmount,  String? expectedSalaryAmount,  String? github,  String? linkedin,  String? portfolio,  String? resume,  String? certifications,  List<dynamic>? skills,  List<dynamic>? jobRoles,  List<dynamic>? experiences,  List<dynamic>? toolsAndPlatforms,  List<dynamic>? languagesKnown,  List<dynamic>? domainKnowledge,  List<dynamic>? employmentType,  List<dynamic>? industry,  List<dynamic>? locations,  List<dynamic>? lookingFor,  List<dynamic>? achievements,  List<dynamic>? awards,  List<dynamic>? publications,  List<dynamic>? internationalExperience,  List<dynamic>? leadership,  bool? servingNoticePeriod,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CandidatePosted():
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.about,_that.college,_that.degree,_that.specialization,_that.yearOfGraduation,_that.semester,_that.cgpa,_that.currentCompany,_that.noticePeriod,_that.openToShift,_that.profileType,_that.referralSource,_that.currentSalaryAmount,_that.expectedSalaryAmount,_that.github,_that.linkedin,_that.portfolio,_that.resume,_that.certifications,_that.skills,_that.jobRoles,_that.experiences,_that.toolsAndPlatforms,_that.languagesKnown,_that.domainKnowledge,_that.employmentType,_that.industry,_that.locations,_that.lookingFor,_that.achievements,_that.awards,_that.publications,_that.internationalExperience,_that.leadership,_that.servingNoticePeriod,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? userId,  String? name,  String? email,  String? phone,  String? about,  String? college,  String? degree,  String? specialization,  String? yearOfGraduation,  String? semester,  String? cgpa,  String? currentCompany,  String? noticePeriod,  String? openToShift,  String? profileType,  String? referralSource,  String? currentSalaryAmount,  String? expectedSalaryAmount,  String? github,  String? linkedin,  String? portfolio,  String? resume,  String? certifications,  List<dynamic>? skills,  List<dynamic>? jobRoles,  List<dynamic>? experiences,  List<dynamic>? toolsAndPlatforms,  List<dynamic>? languagesKnown,  List<dynamic>? domainKnowledge,  List<dynamic>? employmentType,  List<dynamic>? industry,  List<dynamic>? locations,  List<dynamic>? lookingFor,  List<dynamic>? achievements,  List<dynamic>? awards,  List<dynamic>? publications,  List<dynamic>? internationalExperience,  List<dynamic>? leadership,  bool? servingNoticePeriod,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.phone,_that.about,_that.college,_that.degree,_that.specialization,_that.yearOfGraduation,_that.semester,_that.cgpa,_that.currentCompany,_that.noticePeriod,_that.openToShift,_that.profileType,_that.referralSource,_that.currentSalaryAmount,_that.expectedSalaryAmount,_that.github,_that.linkedin,_that.portfolio,_that.resume,_that.certifications,_that.skills,_that.jobRoles,_that.experiences,_that.toolsAndPlatforms,_that.languagesKnown,_that.domainKnowledge,_that.employmentType,_that.industry,_that.locations,_that.lookingFor,_that.achievements,_that.awards,_that.publications,_that.internationalExperience,_that.leadership,_that.servingNoticePeriod,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidatePosted implements CandidatePosted {
  const _CandidatePosted({@JsonKey(name: '_id') this.id, this.userId, this.name, this.email, this.phone, this.about, this.college, this.degree, this.specialization, this.yearOfGraduation, this.semester, this.cgpa, this.currentCompany, this.noticePeriod, this.openToShift, this.profileType, this.referralSource, this.currentSalaryAmount, this.expectedSalaryAmount, this.github, this.linkedin, this.portfolio, this.resume, this.certifications, final  List<dynamic>? skills, final  List<dynamic>? jobRoles, final  List<dynamic>? experiences, final  List<dynamic>? toolsAndPlatforms, final  List<dynamic>? languagesKnown, final  List<dynamic>? domainKnowledge, final  List<dynamic>? employmentType, final  List<dynamic>? industry, final  List<dynamic>? locations, final  List<dynamic>? lookingFor, final  List<dynamic>? achievements, final  List<dynamic>? awards, final  List<dynamic>? publications, final  List<dynamic>? internationalExperience, final  List<dynamic>? leadership, this.servingNoticePeriod, this.createdAt, this.updatedAt}): _skills = skills,_jobRoles = jobRoles,_experiences = experiences,_toolsAndPlatforms = toolsAndPlatforms,_languagesKnown = languagesKnown,_domainKnowledge = domainKnowledge,_employmentType = employmentType,_industry = industry,_locations = locations,_lookingFor = lookingFor,_achievements = achievements,_awards = awards,_publications = publications,_internationalExperience = internationalExperience,_leadership = leadership;
  factory _CandidatePosted.fromJson(Map<String, dynamic> json) => _$CandidatePostedFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? userId;
// Identity
@override final  String? name;
@override final  String? email;
@override final  String? phone;
// Profile
@override final  String? about;
@override final  String? college;
@override final  String? degree;
@override final  String? specialization;
@override final  String? yearOfGraduation;
@override final  String? semester;
@override final  String? cgpa;
@override final  String? currentCompany;
@override final  String? noticePeriod;
@override final  String? openToShift;
@override final  String? profileType;
@override final  String? referralSource;
// Salary
@override final  String? currentSalaryAmount;
@override final  String? expectedSalaryAmount;
// Links
@override final  String? github;
@override final  String? linkedin;
@override final  String? portfolio;
@override final  String? resume;
@override final  String? certifications;
// Lists
 final  List<dynamic>? _skills;
// Lists
@override List<dynamic>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _jobRoles;
@override List<dynamic>? get jobRoles {
  final value = _jobRoles;
  if (value == null) return null;
  if (_jobRoles is EqualUnmodifiableListView) return _jobRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _experiences;
@override List<dynamic>? get experiences {
  final value = _experiences;
  if (value == null) return null;
  if (_experiences is EqualUnmodifiableListView) return _experiences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _toolsAndPlatforms;
@override List<dynamic>? get toolsAndPlatforms {
  final value = _toolsAndPlatforms;
  if (value == null) return null;
  if (_toolsAndPlatforms is EqualUnmodifiableListView) return _toolsAndPlatforms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _languagesKnown;
@override List<dynamic>? get languagesKnown {
  final value = _languagesKnown;
  if (value == null) return null;
  if (_languagesKnown is EqualUnmodifiableListView) return _languagesKnown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _domainKnowledge;
@override List<dynamic>? get domainKnowledge {
  final value = _domainKnowledge;
  if (value == null) return null;
  if (_domainKnowledge is EqualUnmodifiableListView) return _domainKnowledge;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _employmentType;
@override List<dynamic>? get employmentType {
  final value = _employmentType;
  if (value == null) return null;
  if (_employmentType is EqualUnmodifiableListView) return _employmentType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _industry;
@override List<dynamic>? get industry {
  final value = _industry;
  if (value == null) return null;
  if (_industry is EqualUnmodifiableListView) return _industry;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _locations;
@override List<dynamic>? get locations {
  final value = _locations;
  if (value == null) return null;
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _lookingFor;
@override List<dynamic>? get lookingFor {
  final value = _lookingFor;
  if (value == null) return null;
  if (_lookingFor is EqualUnmodifiableListView) return _lookingFor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _achievements;
@override List<dynamic>? get achievements {
  final value = _achievements;
  if (value == null) return null;
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _awards;
@override List<dynamic>? get awards {
  final value = _awards;
  if (value == null) return null;
  if (_awards is EqualUnmodifiableListView) return _awards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _publications;
@override List<dynamic>? get publications {
  final value = _publications;
  if (value == null) return null;
  if (_publications is EqualUnmodifiableListView) return _publications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _internationalExperience;
@override List<dynamic>? get internationalExperience {
  final value = _internationalExperience;
  if (value == null) return null;
  if (_internationalExperience is EqualUnmodifiableListView) return _internationalExperience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _leadership;
@override List<dynamic>? get leadership {
  final value = _leadership;
  if (value == null) return null;
  if (_leadership is EqualUnmodifiableListView) return _leadership;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? servingNoticePeriod;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of CandidatePosted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatePostedCopyWith<_CandidatePosted> get copyWith => __$CandidatePostedCopyWithImpl<_CandidatePosted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidatePostedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatePosted&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.about, about) || other.about == about)&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.currentCompany, currentCompany) || other.currentCompany == currentCompany)&&(identical(other.noticePeriod, noticePeriod) || other.noticePeriod == noticePeriod)&&(identical(other.openToShift, openToShift) || other.openToShift == openToShift)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.referralSource, referralSource) || other.referralSource == referralSource)&&(identical(other.currentSalaryAmount, currentSalaryAmount) || other.currentSalaryAmount == currentSalaryAmount)&&(identical(other.expectedSalaryAmount, expectedSalaryAmount) || other.expectedSalaryAmount == expectedSalaryAmount)&&(identical(other.github, github) || other.github == github)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin)&&(identical(other.portfolio, portfolio) || other.portfolio == portfolio)&&(identical(other.resume, resume) || other.resume == resume)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._experiences, _experiences)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&const DeepCollectionEquality().equals(other._languagesKnown, _languagesKnown)&&const DeepCollectionEquality().equals(other._domainKnowledge, _domainKnowledge)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._industry, _industry)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._lookingFor, _lookingFor)&&const DeepCollectionEquality().equals(other._achievements, _achievements)&&const DeepCollectionEquality().equals(other._awards, _awards)&&const DeepCollectionEquality().equals(other._publications, _publications)&&const DeepCollectionEquality().equals(other._internationalExperience, _internationalExperience)&&const DeepCollectionEquality().equals(other._leadership, _leadership)&&(identical(other.servingNoticePeriod, servingNoticePeriod) || other.servingNoticePeriod == servingNoticePeriod)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,name,email,phone,about,college,degree,specialization,yearOfGraduation,semester,cgpa,currentCompany,noticePeriod,openToShift,profileType,referralSource,currentSalaryAmount,expectedSalaryAmount,github,linkedin,portfolio,resume,certifications,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_experiences),const DeepCollectionEquality().hash(_toolsAndPlatforms),const DeepCollectionEquality().hash(_languagesKnown),const DeepCollectionEquality().hash(_domainKnowledge),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_industry),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_lookingFor),const DeepCollectionEquality().hash(_achievements),const DeepCollectionEquality().hash(_awards),const DeepCollectionEquality().hash(_publications),const DeepCollectionEquality().hash(_internationalExperience),const DeepCollectionEquality().hash(_leadership),servingNoticePeriod,createdAt,updatedAt]);

@override
String toString() {
  return 'CandidatePosted(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, about: $about, college: $college, degree: $degree, specialization: $specialization, yearOfGraduation: $yearOfGraduation, semester: $semester, cgpa: $cgpa, currentCompany: $currentCompany, noticePeriod: $noticePeriod, openToShift: $openToShift, profileType: $profileType, referralSource: $referralSource, currentSalaryAmount: $currentSalaryAmount, expectedSalaryAmount: $expectedSalaryAmount, github: $github, linkedin: $linkedin, portfolio: $portfolio, resume: $resume, certifications: $certifications, skills: $skills, jobRoles: $jobRoles, experiences: $experiences, toolsAndPlatforms: $toolsAndPlatforms, languagesKnown: $languagesKnown, domainKnowledge: $domainKnowledge, employmentType: $employmentType, industry: $industry, locations: $locations, lookingFor: $lookingFor, achievements: $achievements, awards: $awards, publications: $publications, internationalExperience: $internationalExperience, leadership: $leadership, servingNoticePeriod: $servingNoticePeriod, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CandidatePostedCopyWith<$Res> implements $CandidatePostedCopyWith<$Res> {
  factory _$CandidatePostedCopyWith(_CandidatePosted value, $Res Function(_CandidatePosted) _then) = __$CandidatePostedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? userId, String? name, String? email, String? phone, String? about, String? college, String? degree, String? specialization, String? yearOfGraduation, String? semester, String? cgpa, String? currentCompany, String? noticePeriod, String? openToShift, String? profileType, String? referralSource, String? currentSalaryAmount, String? expectedSalaryAmount, String? github, String? linkedin, String? portfolio, String? resume, String? certifications, List<dynamic>? skills, List<dynamic>? jobRoles, List<dynamic>? experiences, List<dynamic>? toolsAndPlatforms, List<dynamic>? languagesKnown, List<dynamic>? domainKnowledge, List<dynamic>? employmentType, List<dynamic>? industry, List<dynamic>? locations, List<dynamic>? lookingFor, List<dynamic>? achievements, List<dynamic>? awards, List<dynamic>? publications, List<dynamic>? internationalExperience, List<dynamic>? leadership, bool? servingNoticePeriod, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$CandidatePostedCopyWithImpl<$Res>
    implements _$CandidatePostedCopyWith<$Res> {
  __$CandidatePostedCopyWithImpl(this._self, this._then);

  final _CandidatePosted _self;
  final $Res Function(_CandidatePosted) _then;

/// Create a copy of CandidatePosted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? about = freezed,Object? college = freezed,Object? degree = freezed,Object? specialization = freezed,Object? yearOfGraduation = freezed,Object? semester = freezed,Object? cgpa = freezed,Object? currentCompany = freezed,Object? noticePeriod = freezed,Object? openToShift = freezed,Object? profileType = freezed,Object? referralSource = freezed,Object? currentSalaryAmount = freezed,Object? expectedSalaryAmount = freezed,Object? github = freezed,Object? linkedin = freezed,Object? portfolio = freezed,Object? resume = freezed,Object? certifications = freezed,Object? skills = freezed,Object? jobRoles = freezed,Object? experiences = freezed,Object? toolsAndPlatforms = freezed,Object? languagesKnown = freezed,Object? domainKnowledge = freezed,Object? employmentType = freezed,Object? industry = freezed,Object? locations = freezed,Object? lookingFor = freezed,Object? achievements = freezed,Object? awards = freezed,Object? publications = freezed,Object? internationalExperience = freezed,Object? leadership = freezed,Object? servingNoticePeriod = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CandidatePosted(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,about: freezed == about ? _self.about : about // ignore: cast_nullable_to_non_nullable
as String?,college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,currentCompany: freezed == currentCompany ? _self.currentCompany : currentCompany // ignore: cast_nullable_to_non_nullable
as String?,noticePeriod: freezed == noticePeriod ? _self.noticePeriod : noticePeriod // ignore: cast_nullable_to_non_nullable
as String?,openToShift: freezed == openToShift ? _self.openToShift : openToShift // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,referralSource: freezed == referralSource ? _self.referralSource : referralSource // ignore: cast_nullable_to_non_nullable
as String?,currentSalaryAmount: freezed == currentSalaryAmount ? _self.currentSalaryAmount : currentSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,expectedSalaryAmount: freezed == expectedSalaryAmount ? _self.expectedSalaryAmount : expectedSalaryAmount // ignore: cast_nullable_to_non_nullable
as String?,github: freezed == github ? _self.github : github // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,portfolio: freezed == portfolio ? _self.portfolio : portfolio // ignore: cast_nullable_to_non_nullable
as String?,resume: freezed == resume ? _self.resume : resume // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,experiences: freezed == experiences ? _self._experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self._toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,languagesKnown: freezed == languagesKnown ? _self._languagesKnown : languagesKnown // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,domainKnowledge: freezed == domainKnowledge ? _self._domainKnowledge : domainKnowledge // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,industry: freezed == industry ? _self._industry : industry // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,lookingFor: freezed == lookingFor ? _self._lookingFor : lookingFor // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,achievements: freezed == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,awards: freezed == awards ? _self._awards : awards // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,publications: freezed == publications ? _self._publications : publications // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,internationalExperience: freezed == internationalExperience ? _self._internationalExperience : internationalExperience // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,leadership: freezed == leadership ? _self._leadership : leadership // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,servingNoticePeriod: freezed == servingNoticePeriod ? _self.servingNoticePeriod : servingNoticePeriod // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PackageDetails {

 String? get currency; int? get totalCTC; int? get fixedPay; int? get joiningBonus;
/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<PackageDetails> get copyWith => _$PackageDetailsCopyWithImpl<PackageDetails>(this as PackageDetails, _$identity);

  /// Serializes this PackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'PackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class $PackageDetailsCopyWith<$Res>  {
  factory $PackageDetailsCopyWith(PackageDetails value, $Res Function(PackageDetails) _then) = _$PackageDetailsCopyWithImpl;
@useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class _$PackageDetailsCopyWithImpl<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  _$PackageDetailsCopyWithImpl(this._self, this._then);

  final PackageDetails _self;
  final $Res Function(PackageDetails) _then;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_self.copyWith(
currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,fixedPay: freezed == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int?,joiningBonus: freezed == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageDetails].
extension PackageDetailsPatterns on PackageDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageDetails value)  $default,){
final _that = this;
switch (_that) {
case _PackageDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)  $default,) {final _that = this;
switch (_that) {
case _PackageDetails():
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? currency,  int? totalCTC,  int? fixedPay,  int? joiningBonus)?  $default,) {final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageDetails implements PackageDetails {
  const _PackageDetails({this.currency, this.totalCTC, this.fixedPay, this.joiningBonus});
  factory _PackageDetails.fromJson(Map<String, dynamic> json) => _$PackageDetailsFromJson(json);

@override final  String? currency;
@override final  int? totalCTC;
@override final  int? fixedPay;
@override final  int? joiningBonus;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageDetailsCopyWith<_PackageDetails> get copyWith => __$PackageDetailsCopyWithImpl<_PackageDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'PackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class _$PackageDetailsCopyWith<$Res> implements $PackageDetailsCopyWith<$Res> {
  factory _$PackageDetailsCopyWith(_PackageDetails value, $Res Function(_PackageDetails) _then) = __$PackageDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class __$PackageDetailsCopyWithImpl<$Res>
    implements _$PackageDetailsCopyWith<$Res> {
  __$PackageDetailsCopyWithImpl(this._self, this._then);

  final _PackageDetails _self;
  final $Res Function(_PackageDetails) _then;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_PackageDetails(
currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,fixedPay: freezed == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int?,joiningBonus: freezed == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
