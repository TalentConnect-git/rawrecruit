// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Job {

@JsonKey(name: '_id') String? get id;// Basic
 String? get jobTitle;// 🔥 REQUIRED
 String? get description; String? get jobStatus; String? get approvalStatus; String? get visibleTo; String? get broadcastType; String? get jobType; String? get eligibilityCriteria; String? get companyName; String? get status; String? get workAuthorization;// Education & Experience
 String? get minEducation; String? get yearsOfExperience;// Numbers
 String? get cgpa; int? get numberOfOpenings; int? get views; int? get matchScore;// Lists - Roles & Skills
 List<String>? get jobRoles; List<String>? get skills; List<String>? get certifications; List<String>? get degree; List<String>? get studentStreams;// Lists - Location & Work
 List<String>? get location; List<String>? get workMode; List<String>? get employmentType; List<String>? get workLocation;// Lists - Company & Categories
 List<String>? get companyType; List<String>? get collegeTypes; List<String>? get collegeCategories;// Lists - Process & Benefits
 List<String>? get rounds; List<String>? get selectionProcess; List<String>? get workAchievements; List<String>? get amenitiesRequired; List<String>? get benefits; List<String>? get toolsAndPlatforms; List<String>? get tags; List<String>? get numberOfStudent;// Internship specific
 String? get venue; String? get internshipDuration; String? get minimumStudents;// Complex Objects
 PackageDetail? get packageDetails; User? get contactPerson; Timeline? get interviewWindow;@JsonKey(name: 'candidatePosted') User? get candidatePosted; JobPosting? get companyPosted; JobPosting? get jobCompanyPosted;// Dates
 DateTime? get onlineTestDate; DateTime? get offerRolloutDate; DateTime? get startDate; DateTime? get endDate; DateTime? get expireAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCopyWith<Job> get copyWith => _$JobCopyWithImpl<Job>(this as Job, _$identity);

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Job&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&const DeepCollectionEquality().equals(other.degree, degree)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.workLocation, workLocation)&&const DeepCollectionEquality().equals(other.companyType, companyType)&&const DeepCollectionEquality().equals(other.collegeTypes, collegeTypes)&&const DeepCollectionEquality().equals(other.collegeCategories, collegeCategories)&&const DeepCollectionEquality().equals(other.rounds, rounds)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&const DeepCollectionEquality().equals(other.workAchievements, workAchievements)&&const DeepCollectionEquality().equals(other.amenitiesRequired, amenitiesRequired)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.numberOfStudent, numberOfStudent)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.jobCompanyPosted, jobCompanyPosted) || other.jobCompanyPosted == jobCompanyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobTitle,description,jobStatus,approvalStatus,visibleTo,broadcastType,jobType,eligibilityCriteria,companyName,status,workAuthorization,minEducation,yearsOfExperience,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(certifications),const DeepCollectionEquality().hash(degree),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(workLocation),const DeepCollectionEquality().hash(companyType),const DeepCollectionEquality().hash(collegeTypes),const DeepCollectionEquality().hash(collegeCategories),const DeepCollectionEquality().hash(rounds),const DeepCollectionEquality().hash(selectionProcess),const DeepCollectionEquality().hash(workAchievements),const DeepCollectionEquality().hash(amenitiesRequired),const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(toolsAndPlatforms),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(numberOfStudent),venue,internshipDuration,minimumStudents,packageDetails,contactPerson,interviewWindow,candidatePosted,companyPosted,jobCompanyPosted,onlineTestDate,offerRolloutDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Job(id: $id, jobTitle: $jobTitle, description: $description, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, jobType: $jobType, eligibilityCriteria: $eligibilityCriteria, companyName: $companyName, status: $status, workAuthorization: $workAuthorization, minEducation: $minEducation, yearsOfExperience: $yearsOfExperience, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, certifications: $certifications, degree: $degree, studentStreams: $studentStreams, location: $location, workMode: $workMode, employmentType: $employmentType, workLocation: $workLocation, companyType: $companyType, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, rounds: $rounds, selectionProcess: $selectionProcess, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, toolsAndPlatforms: $toolsAndPlatforms, tags: $tags, numberOfStudent: $numberOfStudent, venue: $venue, internshipDuration: $internshipDuration, minimumStudents: $minimumStudents, packageDetails: $packageDetails, contactPerson: $contactPerson, interviewWindow: $interviewWindow, candidatePosted: $candidatePosted, companyPosted: $companyPosted, jobCompanyPosted: $jobCompanyPosted, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobCopyWith<$Res>  {
  factory $JobCopyWith(Job value, $Res Function(Job) _then) = _$JobCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobTitle, String? description, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? jobType, String? eligibilityCriteria, String? companyName, String? status, String? workAuthorization, String? minEducation, String? yearsOfExperience, String? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? certifications, List<String>? degree, List<String>? studentStreams, List<String>? location, List<String>? workMode, List<String>? employmentType, List<String>? workLocation, List<String>? companyType, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? rounds, List<String>? selectionProcess, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? toolsAndPlatforms, List<String>? tags, List<String>? numberOfStudent, String? venue, String? internshipDuration, String? minimumStudents, PackageDetail? packageDetails, User? contactPerson, Timeline? interviewWindow,@JsonKey(name: 'candidatePosted') User? candidatePosted, JobPosting? companyPosted, JobPosting? jobCompanyPosted, DateTime? onlineTestDate, DateTime? offerRolloutDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


$PackageDetailCopyWith<$Res>? get packageDetails;$UserCopyWith<$Res>? get contactPerson;$TimelineCopyWith<$Res>? get interviewWindow;$UserCopyWith<$Res>? get candidatePosted;$JobPostingCopyWith<$Res>? get companyPosted;$JobPostingCopyWith<$Res>? get jobCompanyPosted;

}
/// @nodoc
class _$JobCopyWithImpl<$Res>
    implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._self, this._then);

  final Job _self;
  final $Res Function(Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? jobType = freezed,Object? eligibilityCriteria = freezed,Object? companyName = freezed,Object? status = freezed,Object? workAuthorization = freezed,Object? minEducation = freezed,Object? yearsOfExperience = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? certifications = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? workLocation = freezed,Object? companyType = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? toolsAndPlatforms = freezed,Object? tags = freezed,Object? numberOfStudent = freezed,Object? venue = freezed,Object? internshipDuration = freezed,Object? minimumStudents = freezed,Object? packageDetails = freezed,Object? contactPerson = freezed,Object? interviewWindow = freezed,Object? candidatePosted = freezed,Object? companyPosted = freezed,Object? jobCompanyPosted = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,workLocation: freezed == workLocation ? _self.workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self.collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self.collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,rounds: freezed == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self.selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,workAchievements: freezed == workAchievements ? _self.workAchievements : workAchievements // ignore: cast_nullable_to_non_nullable
as List<String>?,amenitiesRequired: freezed == amenitiesRequired ? _self.amenitiesRequired : amenitiesRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self.toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfStudent: freezed == numberOfStudent ? _self.numberOfStudent : numberOfStudent // ignore: cast_nullable_to_non_nullable
as List<String>?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetail?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as User?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as Timeline?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as User?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as JobPosting?,jobCompanyPosted: freezed == jobCompanyPosted ? _self.jobCompanyPosted : jobCompanyPosted // ignore: cast_nullable_to_non_nullable
as JobPosting?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get contactPerson {
    if (_self.contactPerson == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.contactPerson!, (value) {
    return _then(_self.copyWith(contactPerson: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res>? get interviewWindow {
    if (_self.interviewWindow == null) {
    return null;
  }

  return $TimelineCopyWith<$Res>(_self.interviewWindow!, (value) {
    return _then(_self.copyWith(interviewWindow: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get candidatePosted {
    if (_self.candidatePosted == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.candidatePosted!, (value) {
    return _then(_self.copyWith(candidatePosted: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get jobCompanyPosted {
    if (_self.jobCompanyPosted == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.jobCompanyPosted!, (value) {
    return _then(_self.copyWith(jobCompanyPosted: value));
  });
}
}


/// Adds pattern-matching-related methods to [Job].
extension JobPatterns on Job {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Job value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Job value)  $default,){
final _that = this;
switch (_that) {
case _Job():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Job value)?  $default,){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? jobType,  String? eligibilityCriteria,  String? companyName,  String? status,  String? workAuthorization,  String? minEducation,  String? yearsOfExperience,  String? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? certifications,  List<String>? degree,  List<String>? studentStreams,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? workLocation,  List<String>? companyType,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? toolsAndPlatforms,  List<String>? tags,  List<String>? numberOfStudent,  String? venue,  String? internshipDuration,  String? minimumStudents,  PackageDetail? packageDetails,  User? contactPerson,  Timeline? interviewWindow, @JsonKey(name: 'candidatePosted')  User? candidatePosted,  JobPosting? companyPosted,  JobPosting? jobCompanyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.jobType,_that.eligibilityCriteria,_that.companyName,_that.status,_that.workAuthorization,_that.minEducation,_that.yearsOfExperience,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.certifications,_that.degree,_that.studentStreams,_that.location,_that.workMode,_that.employmentType,_that.workLocation,_that.companyType,_that.collegeTypes,_that.collegeCategories,_that.rounds,_that.selectionProcess,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.toolsAndPlatforms,_that.tags,_that.numberOfStudent,_that.venue,_that.internshipDuration,_that.minimumStudents,_that.packageDetails,_that.contactPerson,_that.interviewWindow,_that.candidatePosted,_that.companyPosted,_that.jobCompanyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? jobType,  String? eligibilityCriteria,  String? companyName,  String? status,  String? workAuthorization,  String? minEducation,  String? yearsOfExperience,  String? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? certifications,  List<String>? degree,  List<String>? studentStreams,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? workLocation,  List<String>? companyType,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? toolsAndPlatforms,  List<String>? tags,  List<String>? numberOfStudent,  String? venue,  String? internshipDuration,  String? minimumStudents,  PackageDetail? packageDetails,  User? contactPerson,  Timeline? interviewWindow, @JsonKey(name: 'candidatePosted')  User? candidatePosted,  JobPosting? companyPosted,  JobPosting? jobCompanyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Job():
return $default(_that.id,_that.jobTitle,_that.description,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.jobType,_that.eligibilityCriteria,_that.companyName,_that.status,_that.workAuthorization,_that.minEducation,_that.yearsOfExperience,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.certifications,_that.degree,_that.studentStreams,_that.location,_that.workMode,_that.employmentType,_that.workLocation,_that.companyType,_that.collegeTypes,_that.collegeCategories,_that.rounds,_that.selectionProcess,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.toolsAndPlatforms,_that.tags,_that.numberOfStudent,_that.venue,_that.internshipDuration,_that.minimumStudents,_that.packageDetails,_that.contactPerson,_that.interviewWindow,_that.candidatePosted,_that.companyPosted,_that.jobCompanyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? jobType,  String? eligibilityCriteria,  String? companyName,  String? status,  String? workAuthorization,  String? minEducation,  String? yearsOfExperience,  String? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? certifications,  List<String>? degree,  List<String>? studentStreams,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  List<String>? workLocation,  List<String>? companyType,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? toolsAndPlatforms,  List<String>? tags,  List<String>? numberOfStudent,  String? venue,  String? internshipDuration,  String? minimumStudents,  PackageDetail? packageDetails,  User? contactPerson,  Timeline? interviewWindow, @JsonKey(name: 'candidatePosted')  User? candidatePosted,  JobPosting? companyPosted,  JobPosting? jobCompanyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.jobType,_that.eligibilityCriteria,_that.companyName,_that.status,_that.workAuthorization,_that.minEducation,_that.yearsOfExperience,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.certifications,_that.degree,_that.studentStreams,_that.location,_that.workMode,_that.employmentType,_that.workLocation,_that.companyType,_that.collegeTypes,_that.collegeCategories,_that.rounds,_that.selectionProcess,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.toolsAndPlatforms,_that.tags,_that.numberOfStudent,_that.venue,_that.internshipDuration,_that.minimumStudents,_that.packageDetails,_that.contactPerson,_that.interviewWindow,_that.candidatePosted,_that.companyPosted,_that.jobCompanyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Job implements Job {
  const _Job({@JsonKey(name: '_id') this.id, this.jobTitle, this.description, this.jobStatus, this.approvalStatus, this.visibleTo, this.broadcastType, this.jobType, this.eligibilityCriteria, this.companyName, this.status, this.workAuthorization, this.minEducation, this.yearsOfExperience, this.cgpa, this.numberOfOpenings, this.views, this.matchScore, final  List<String>? jobRoles, final  List<String>? skills, final  List<String>? certifications, final  List<String>? degree, final  List<String>? studentStreams, final  List<String>? location, final  List<String>? workMode, final  List<String>? employmentType, final  List<String>? workLocation, final  List<String>? companyType, final  List<String>? collegeTypes, final  List<String>? collegeCategories, final  List<String>? rounds, final  List<String>? selectionProcess, final  List<String>? workAchievements, final  List<String>? amenitiesRequired, final  List<String>? benefits, final  List<String>? toolsAndPlatforms, final  List<String>? tags, final  List<String>? numberOfStudent, this.venue, this.internshipDuration, this.minimumStudents, this.packageDetails, this.contactPerson, this.interviewWindow, @JsonKey(name: 'candidatePosted') this.candidatePosted, this.companyPosted, this.jobCompanyPosted, this.onlineTestDate, this.offerRolloutDate, this.startDate, this.endDate, this.expireAt, this.createdAt, this.updatedAt}): _jobRoles = jobRoles,_skills = skills,_certifications = certifications,_degree = degree,_studentStreams = studentStreams,_location = location,_workMode = workMode,_employmentType = employmentType,_workLocation = workLocation,_companyType = companyType,_collegeTypes = collegeTypes,_collegeCategories = collegeCategories,_rounds = rounds,_selectionProcess = selectionProcess,_workAchievements = workAchievements,_amenitiesRequired = amenitiesRequired,_benefits = benefits,_toolsAndPlatforms = toolsAndPlatforms,_tags = tags,_numberOfStudent = numberOfStudent;
  factory _Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
// Basic
@override final  String? jobTitle;
// 🔥 REQUIRED
@override final  String? description;
@override final  String? jobStatus;
@override final  String? approvalStatus;
@override final  String? visibleTo;
@override final  String? broadcastType;
@override final  String? jobType;
@override final  String? eligibilityCriteria;
@override final  String? companyName;
@override final  String? status;
@override final  String? workAuthorization;
// Education & Experience
@override final  String? minEducation;
@override final  String? yearsOfExperience;
// Numbers
@override final  String? cgpa;
@override final  int? numberOfOpenings;
@override final  int? views;
@override final  int? matchScore;
// Lists - Roles & Skills
 final  List<String>? _jobRoles;
// Lists - Roles & Skills
@override List<String>? get jobRoles {
  final value = _jobRoles;
  if (value == null) return null;
  if (_jobRoles is EqualUnmodifiableListView) return _jobRoles;
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

 final  List<String>? _certifications;
@override List<String>? get certifications {
  final value = _certifications;
  if (value == null) return null;
  if (_certifications is EqualUnmodifiableListView) return _certifications;
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

 final  List<String>? _studentStreams;
@override List<String>? get studentStreams {
  final value = _studentStreams;
  if (value == null) return null;
  if (_studentStreams is EqualUnmodifiableListView) return _studentStreams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Lists - Location & Work
 final  List<String>? _location;
// Lists - Location & Work
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

 final  List<String>? _workLocation;
@override List<String>? get workLocation {
  final value = _workLocation;
  if (value == null) return null;
  if (_workLocation is EqualUnmodifiableListView) return _workLocation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Lists - Company & Categories
 final  List<String>? _companyType;
// Lists - Company & Categories
@override List<String>? get companyType {
  final value = _companyType;
  if (value == null) return null;
  if (_companyType is EqualUnmodifiableListView) return _companyType;
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

// Lists - Process & Benefits
 final  List<String>? _rounds;
// Lists - Process & Benefits
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

 final  List<String>? _toolsAndPlatforms;
@override List<String>? get toolsAndPlatforms {
  final value = _toolsAndPlatforms;
  if (value == null) return null;
  if (_toolsAndPlatforms is EqualUnmodifiableListView) return _toolsAndPlatforms;
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

 final  List<String>? _numberOfStudent;
@override List<String>? get numberOfStudent {
  final value = _numberOfStudent;
  if (value == null) return null;
  if (_numberOfStudent is EqualUnmodifiableListView) return _numberOfStudent;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// Internship specific
@override final  String? venue;
@override final  String? internshipDuration;
@override final  String? minimumStudents;
// Complex Objects
@override final  PackageDetail? packageDetails;
@override final  User? contactPerson;
@override final  Timeline? interviewWindow;
@override@JsonKey(name: 'candidatePosted') final  User? candidatePosted;
@override final  JobPosting? companyPosted;
@override final  JobPosting? jobCompanyPosted;
// Dates
@override final  DateTime? onlineTestDate;
@override final  DateTime? offerRolloutDate;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? expireAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCopyWith<_Job> get copyWith => __$JobCopyWithImpl<_Job>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Job&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.status, status) || other.status == status)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&const DeepCollectionEquality().equals(other._degree, _degree)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._workLocation, _workLocation)&&const DeepCollectionEquality().equals(other._companyType, _companyType)&&const DeepCollectionEquality().equals(other._collegeTypes, _collegeTypes)&&const DeepCollectionEquality().equals(other._collegeCategories, _collegeCategories)&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&const DeepCollectionEquality().equals(other._workAchievements, _workAchievements)&&const DeepCollectionEquality().equals(other._amenitiesRequired, _amenitiesRequired)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._numberOfStudent, _numberOfStudent)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.jobCompanyPosted, jobCompanyPosted) || other.jobCompanyPosted == jobCompanyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobTitle,description,jobStatus,approvalStatus,visibleTo,broadcastType,jobType,eligibilityCriteria,companyName,status,workAuthorization,minEducation,yearsOfExperience,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_degree),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_workLocation),const DeepCollectionEquality().hash(_companyType),const DeepCollectionEquality().hash(_collegeTypes),const DeepCollectionEquality().hash(_collegeCategories),const DeepCollectionEquality().hash(_rounds),const DeepCollectionEquality().hash(_selectionProcess),const DeepCollectionEquality().hash(_workAchievements),const DeepCollectionEquality().hash(_amenitiesRequired),const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_toolsAndPlatforms),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_numberOfStudent),venue,internshipDuration,minimumStudents,packageDetails,contactPerson,interviewWindow,candidatePosted,companyPosted,jobCompanyPosted,onlineTestDate,offerRolloutDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'Job(id: $id, jobTitle: $jobTitle, description: $description, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, jobType: $jobType, eligibilityCriteria: $eligibilityCriteria, companyName: $companyName, status: $status, workAuthorization: $workAuthorization, minEducation: $minEducation, yearsOfExperience: $yearsOfExperience, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, certifications: $certifications, degree: $degree, studentStreams: $studentStreams, location: $location, workMode: $workMode, employmentType: $employmentType, workLocation: $workLocation, companyType: $companyType, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, rounds: $rounds, selectionProcess: $selectionProcess, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, toolsAndPlatforms: $toolsAndPlatforms, tags: $tags, numberOfStudent: $numberOfStudent, venue: $venue, internshipDuration: $internshipDuration, minimumStudents: $minimumStudents, packageDetails: $packageDetails, contactPerson: $contactPerson, interviewWindow: $interviewWindow, candidatePosted: $candidatePosted, companyPosted: $companyPosted, jobCompanyPosted: $jobCompanyPosted, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$JobCopyWith(_Job value, $Res Function(_Job) _then) = __$JobCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobTitle, String? description, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? jobType, String? eligibilityCriteria, String? companyName, String? status, String? workAuthorization, String? minEducation, String? yearsOfExperience, String? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? certifications, List<String>? degree, List<String>? studentStreams, List<String>? location, List<String>? workMode, List<String>? employmentType, List<String>? workLocation, List<String>? companyType, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? rounds, List<String>? selectionProcess, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? toolsAndPlatforms, List<String>? tags, List<String>? numberOfStudent, String? venue, String? internshipDuration, String? minimumStudents, PackageDetail? packageDetails, User? contactPerson, Timeline? interviewWindow,@JsonKey(name: 'candidatePosted') User? candidatePosted, JobPosting? companyPosted, JobPosting? jobCompanyPosted, DateTime? onlineTestDate, DateTime? offerRolloutDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


@override $PackageDetailCopyWith<$Res>? get packageDetails;@override $UserCopyWith<$Res>? get contactPerson;@override $TimelineCopyWith<$Res>? get interviewWindow;@override $UserCopyWith<$Res>? get candidatePosted;@override $JobPostingCopyWith<$Res>? get companyPosted;@override $JobPostingCopyWith<$Res>? get jobCompanyPosted;

}
/// @nodoc
class __$JobCopyWithImpl<$Res>
    implements _$JobCopyWith<$Res> {
  __$JobCopyWithImpl(this._self, this._then);

  final _Job _self;
  final $Res Function(_Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? jobType = freezed,Object? eligibilityCriteria = freezed,Object? companyName = freezed,Object? status = freezed,Object? workAuthorization = freezed,Object? minEducation = freezed,Object? yearsOfExperience = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? certifications = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? workLocation = freezed,Object? companyType = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? toolsAndPlatforms = freezed,Object? tags = freezed,Object? numberOfStudent = freezed,Object? venue = freezed,Object? internshipDuration = freezed,Object? minimumStudents = freezed,Object? packageDetails = freezed,Object? contactPerson = freezed,Object? interviewWindow = freezed,Object? candidatePosted = freezed,Object? companyPosted = freezed,Object? jobCompanyPosted = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Job(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self._degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,workLocation: freezed == workLocation ? _self._workLocation : workLocation // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self._companyType : companyType // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self._collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self._collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,rounds: freezed == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self._selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,workAchievements: freezed == workAchievements ? _self._workAchievements : workAchievements // ignore: cast_nullable_to_non_nullable
as List<String>?,amenitiesRequired: freezed == amenitiesRequired ? _self._amenitiesRequired : amenitiesRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,toolsAndPlatforms: freezed == toolsAndPlatforms ? _self._toolsAndPlatforms : toolsAndPlatforms // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfStudent: freezed == numberOfStudent ? _self._numberOfStudent : numberOfStudent // ignore: cast_nullable_to_non_nullable
as List<String>?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetail?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as User?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as Timeline?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as User?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as JobPosting?,jobCompanyPosted: freezed == jobCompanyPosted ? _self.jobCompanyPosted : jobCompanyPosted // ignore: cast_nullable_to_non_nullable
as JobPosting?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get contactPerson {
    if (_self.contactPerson == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.contactPerson!, (value) {
    return _then(_self.copyWith(contactPerson: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimelineCopyWith<$Res>? get interviewWindow {
    if (_self.interviewWindow == null) {
    return null;
  }

  return $TimelineCopyWith<$Res>(_self.interviewWindow!, (value) {
    return _then(_self.copyWith(interviewWindow: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get candidatePosted {
    if (_self.candidatePosted == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.candidatePosted!, (value) {
    return _then(_self.copyWith(candidatePosted: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPostingCopyWith<$Res>? get jobCompanyPosted {
    if (_self.jobCompanyPosted == null) {
    return null;
  }

  return $JobPostingCopyWith<$Res>(_self.jobCompanyPosted!, (value) {
    return _then(_self.copyWith(jobCompanyPosted: value));
  });
}
}

// dart format on
