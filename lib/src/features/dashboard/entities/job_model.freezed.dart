// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobModel {

@JsonKey(name: '_id') String? get id;// Basic
 String? get jobTitle; String? get description; String? get jobType; String? get jobStatus; String? get approvalStatus; String? get visibleTo; String? get broadcastType; String? get eligibilityCriteria; String? get minimumStudents; String? get venue; String? get companyName;// Numbers — cgpa can be int or double in API
@JsonKey(fromJson: _doubleFromJson) double? get cgpa; int? get numberOfOpenings; int? get views; int? get matchScore;// Lists
 List<String>? get jobRoles; List<String>? get skills; List<String>? get workMode; List<String>? get location; List<String>? get employmentType; List<String>? get degree; List<String>? get studentStreams; List<String>? get collegeTypes; List<String>? get collegeCategories; List<String>? get companyType; List<String>? get rounds; List<String>? get selectionProcess; List<String>? get certifications; List<String>? get workAchievements; List<String>? get amenitiesRequired; List<String>? get benefits; List<String>? get tags; List<String>? get toolsAndPlatforms; List<String>? get workLocation; List<String>? get numberOfStudent;// Nested
 JobPackageDetails? get packageDetails; InterviewWindow? get interviewWindow; ContactPerson? get contactPerson; JobCompanyPosted? get companyPosted;// Dates
 DateTime? get onlineTestDate; DateTime? get offerRolloutDate; DateTime? get startDate; DateTime? get endDate; DateTime? get expireAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobModelCopyWith<JobModel> get copyWith => _$JobModelCopyWithImpl<JobModel>(this as JobModel, _$identity);

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.degree, degree)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.collegeTypes, collegeTypes)&&const DeepCollectionEquality().equals(other.collegeCategories, collegeCategories)&&const DeepCollectionEquality().equals(other.companyType, companyType)&&const DeepCollectionEquality().equals(other.rounds, rounds)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&const DeepCollectionEquality().equals(other.workAchievements, workAchievements)&&const DeepCollectionEquality().equals(other.amenitiesRequired, amenitiesRequired)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&const DeepCollectionEquality().equals(other.workLocation, workLocation)&&const DeepCollectionEquality().equals(other.numberOfStudent, numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobTitle,description,jobType,jobStatus,approvalStatus,visibleTo,broadcastType,eligibilityCriteria,minimumStudents,venue,companyName,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(degree),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(collegeTypes),const DeepCollectionEquality().hash(collegeCategories),const DeepCollectionEquality().hash(companyType),const DeepCollectionEquality().hash(rounds),const DeepCollectionEquality().hash(selectionProcess),const DeepCollectionEquality().hash(certifications),const DeepCollectionEquality().hash(workAchievements),const DeepCollectionEquality().hash(amenitiesRequired),const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(toolsAndPlatforms),const DeepCollectionEquality().hash(workLocation),const DeepCollectionEquality().hash(numberOfStudent),packageDetails,interviewWindow,contactPerson,companyPosted,onlineTestDate,offerRolloutDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'JobModel(id: $id, jobTitle: $jobTitle, description: $description, jobType: $jobType, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, eligibilityCriteria: $eligibilityCriteria, minimumStudents: $minimumStudents, venue: $venue, companyName: $companyName, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, workMode: $workMode, location: $location, employmentType: $employmentType, degree: $degree, studentStreams: $studentStreams, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, interviewWindow: $interviewWindow, contactPerson: $contactPerson, companyPosted: $companyPosted, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $JobModelCopyWith<$Res>  {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) _then) = _$JobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobTitle, String? description, String? jobType, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? eligibilityCriteria, String? minimumStudents, String? venue, String? companyName,@JsonKey(fromJson: _doubleFromJson) double? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? employmentType, List<String>? degree, List<String>? studentStreams, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, JobPackageDetails? packageDetails, InterviewWindow? interviewWindow, ContactPerson? contactPerson, JobCompanyPosted? companyPosted, DateTime? onlineTestDate, DateTime? offerRolloutDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


$JobPackageDetailsCopyWith<$Res>? get packageDetails;$InterviewWindowCopyWith<$Res>? get interviewWindow;$ContactPersonCopyWith<$Res>? get contactPerson;$JobCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class _$JobModelCopyWithImpl<$Res>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._self, this._then);

  final JobModel _self;
  final $Res Function(JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobType = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? eligibilityCriteria = freezed,Object? minimumStudents = freezed,Object? venue = freezed,Object? companyName = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? employmentType = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? interviewWindow = freezed,Object? contactPerson = freezed,Object? companyPosted = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self.collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self.collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
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
as JobPackageDetails?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as InterviewWindow?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as ContactPerson?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as JobCompanyPosted?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $JobPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewWindowCopyWith<$Res>? get interviewWindow {
    if (_self.interviewWindow == null) {
    return null;
  }

  return $InterviewWindowCopyWith<$Res>(_self.interviewWindow!, (value) {
    return _then(_self.copyWith(interviewWindow: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactPersonCopyWith<$Res>? get contactPerson {
    if (_self.contactPerson == null) {
    return null;
  }

  return $ContactPersonCopyWith<$Res>(_self.contactPerson!, (value) {
    return _then(_self.copyWith(contactPerson: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCompanyPostedCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $JobCompanyPostedCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobModel].
extension JobModelPatterns on JobModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobModel value)  $default,){
final _that = this;
switch (_that) {
case _JobModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minimumStudents,  String? venue,  String? companyName, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  JobPackageDetails? packageDetails,  InterviewWindow? interviewWindow,  ContactPerson? contactPerson,  JobCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minimumStudents,_that.venue,_that.companyName,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.interviewWindow,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minimumStudents,  String? venue,  String? companyName, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  JobPackageDetails? packageDetails,  InterviewWindow? interviewWindow,  ContactPerson? contactPerson,  JobCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobModel():
return $default(_that.id,_that.jobTitle,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minimumStudents,_that.venue,_that.companyName,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.interviewWindow,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? jobTitle,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minimumStudents,  String? venue,  String? companyName, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  JobPackageDetails? packageDetails,  InterviewWindow? interviewWindow,  ContactPerson? contactPerson,  JobCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minimumStudents,_that.venue,_that.companyName,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.interviewWindow,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.offerRolloutDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobModel implements JobModel {
  const _JobModel({@JsonKey(name: '_id') this.id, this.jobTitle, this.description, this.jobType, this.jobStatus, this.approvalStatus, this.visibleTo, this.broadcastType, this.eligibilityCriteria, this.minimumStudents, this.venue, this.companyName, @JsonKey(fromJson: _doubleFromJson) this.cgpa, this.numberOfOpenings, this.views, this.matchScore, final  List<String>? jobRoles, final  List<String>? skills, final  List<String>? workMode, final  List<String>? location, final  List<String>? employmentType, final  List<String>? degree, final  List<String>? studentStreams, final  List<String>? collegeTypes, final  List<String>? collegeCategories, final  List<String>? companyType, final  List<String>? rounds, final  List<String>? selectionProcess, final  List<String>? certifications, final  List<String>? workAchievements, final  List<String>? amenitiesRequired, final  List<String>? benefits, final  List<String>? tags, final  List<String>? toolsAndPlatforms, final  List<String>? workLocation, final  List<String>? numberOfStudent, this.packageDetails, this.interviewWindow, this.contactPerson, this.companyPosted, this.onlineTestDate, this.offerRolloutDate, this.startDate, this.endDate, this.expireAt, this.createdAt, this.updatedAt}): _jobRoles = jobRoles,_skills = skills,_workMode = workMode,_location = location,_employmentType = employmentType,_degree = degree,_studentStreams = studentStreams,_collegeTypes = collegeTypes,_collegeCategories = collegeCategories,_companyType = companyType,_rounds = rounds,_selectionProcess = selectionProcess,_certifications = certifications,_workAchievements = workAchievements,_amenitiesRequired = amenitiesRequired,_benefits = benefits,_tags = tags,_toolsAndPlatforms = toolsAndPlatforms,_workLocation = workLocation,_numberOfStudent = numberOfStudent;
  factory _JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
// Basic
@override final  String? jobTitle;
@override final  String? description;
@override final  String? jobType;
@override final  String? jobStatus;
@override final  String? approvalStatus;
@override final  String? visibleTo;
@override final  String? broadcastType;
@override final  String? eligibilityCriteria;
@override final  String? minimumStudents;
@override final  String? venue;
@override final  String? companyName;
// Numbers — cgpa can be int or double in API
@override@JsonKey(fromJson: _doubleFromJson) final  double? cgpa;
@override final  int? numberOfOpenings;
@override final  int? views;
@override final  int? matchScore;
// Lists
 final  List<String>? _jobRoles;
// Lists
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

 final  List<String>? _workMode;
@override List<String>? get workMode {
  final value = _workMode;
  if (value == null) return null;
  if (_workMode is EqualUnmodifiableListView) return _workMode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _location;
@override List<String>? get location {
  final value = _location;
  if (value == null) return null;
  if (_location is EqualUnmodifiableListView) return _location;
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

// Nested
@override final  JobPackageDetails? packageDetails;
@override final  InterviewWindow? interviewWindow;
@override final  ContactPerson? contactPerson;
@override final  JobCompanyPosted? companyPosted;
// Dates
@override final  DateTime? onlineTestDate;
@override final  DateTime? offerRolloutDate;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? expireAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobModelCopyWith<_JobModel> get copyWith => __$JobModelCopyWithImpl<_JobModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._degree, _degree)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._collegeTypes, _collegeTypes)&&const DeepCollectionEquality().equals(other._collegeCategories, _collegeCategories)&&const DeepCollectionEquality().equals(other._companyType, _companyType)&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&const DeepCollectionEquality().equals(other._workAchievements, _workAchievements)&&const DeepCollectionEquality().equals(other._amenitiesRequired, _amenitiesRequired)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&const DeepCollectionEquality().equals(other._workLocation, _workLocation)&&const DeepCollectionEquality().equals(other._numberOfStudent, _numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobTitle,description,jobType,jobStatus,approvalStatus,visibleTo,broadcastType,eligibilityCriteria,minimumStudents,venue,companyName,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_degree),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_collegeTypes),const DeepCollectionEquality().hash(_collegeCategories),const DeepCollectionEquality().hash(_companyType),const DeepCollectionEquality().hash(_rounds),const DeepCollectionEquality().hash(_selectionProcess),const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_workAchievements),const DeepCollectionEquality().hash(_amenitiesRequired),const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_toolsAndPlatforms),const DeepCollectionEquality().hash(_workLocation),const DeepCollectionEquality().hash(_numberOfStudent),packageDetails,interviewWindow,contactPerson,companyPosted,onlineTestDate,offerRolloutDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'JobModel(id: $id, jobTitle: $jobTitle, description: $description, jobType: $jobType, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, eligibilityCriteria: $eligibilityCriteria, minimumStudents: $minimumStudents, venue: $venue, companyName: $companyName, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, workMode: $workMode, location: $location, employmentType: $employmentType, degree: $degree, studentStreams: $studentStreams, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, interviewWindow: $interviewWindow, contactPerson: $contactPerson, companyPosted: $companyPosted, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$JobModelCopyWith(_JobModel value, $Res Function(_JobModel) _then) = __$JobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobTitle, String? description, String? jobType, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? eligibilityCriteria, String? minimumStudents, String? venue, String? companyName,@JsonKey(fromJson: _doubleFromJson) double? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? employmentType, List<String>? degree, List<String>? studentStreams, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, JobPackageDetails? packageDetails, InterviewWindow? interviewWindow, ContactPerson? contactPerson, JobCompanyPosted? companyPosted, DateTime? onlineTestDate, DateTime? offerRolloutDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


@override $JobPackageDetailsCopyWith<$Res>? get packageDetails;@override $InterviewWindowCopyWith<$Res>? get interviewWindow;@override $ContactPersonCopyWith<$Res>? get contactPerson;@override $JobCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class __$JobModelCopyWithImpl<$Res>
    implements _$JobModelCopyWith<$Res> {
  __$JobModelCopyWithImpl(this._self, this._then);

  final _JobModel _self;
  final $Res Function(_JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? jobType = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? eligibilityCriteria = freezed,Object? minimumStudents = freezed,Object? venue = freezed,Object? companyName = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? employmentType = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? interviewWindow = freezed,Object? contactPerson = freezed,Object? companyPosted = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as double?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,views: freezed == views ? _self.views : views // ignore: cast_nullable_to_non_nullable
as int?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as int?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self._degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeTypes: freezed == collegeTypes ? _self._collegeTypes : collegeTypes // ignore: cast_nullable_to_non_nullable
as List<String>?,collegeCategories: freezed == collegeCategories ? _self._collegeCategories : collegeCategories // ignore: cast_nullable_to_non_nullable
as List<String>?,companyType: freezed == companyType ? _self._companyType : companyType // ignore: cast_nullable_to_non_nullable
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
as JobPackageDetails?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as InterviewWindow?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as ContactPerson?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as JobCompanyPosted?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $JobPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewWindowCopyWith<$Res>? get interviewWindow {
    if (_self.interviewWindow == null) {
    return null;
  }

  return $InterviewWindowCopyWith<$Res>(_self.interviewWindow!, (value) {
    return _then(_self.copyWith(interviewWindow: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactPersonCopyWith<$Res>? get contactPerson {
    if (_self.contactPerson == null) {
    return null;
  }

  return $ContactPersonCopyWith<$Res>(_self.contactPerson!, (value) {
    return _then(_self.copyWith(contactPerson: value));
  });
}/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCompanyPostedCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $JobCompanyPostedCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}
}


/// @nodoc
mixin _$InterviewWindow {

 DateTime? get start; DateTime? get end;
/// Create a copy of InterviewWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewWindowCopyWith<InterviewWindow> get copyWith => _$InterviewWindowCopyWithImpl<InterviewWindow>(this as InterviewWindow, _$identity);

  /// Serializes this InterviewWindow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'InterviewWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $InterviewWindowCopyWith<$Res>  {
  factory $InterviewWindowCopyWith(InterviewWindow value, $Res Function(InterviewWindow) _then) = _$InterviewWindowCopyWithImpl;
@useResult
$Res call({
 DateTime? start, DateTime? end
});




}
/// @nodoc
class _$InterviewWindowCopyWithImpl<$Res>
    implements $InterviewWindowCopyWith<$Res> {
  _$InterviewWindowCopyWithImpl(this._self, this._then);

  final InterviewWindow _self;
  final $Res Function(InterviewWindow) _then;

/// Create a copy of InterviewWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_self.copyWith(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewWindow].
extension InterviewWindowPatterns on InterviewWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewWindow value)  $default,){
final _that = this;
switch (_that) {
case _InterviewWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewWindow value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? start,  DateTime? end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewWindow() when $default != null:
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? start,  DateTime? end)  $default,) {final _that = this;
switch (_that) {
case _InterviewWindow():
return $default(_that.start,_that.end);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? start,  DateTime? end)?  $default,) {final _that = this;
switch (_that) {
case _InterviewWindow() when $default != null:
return $default(_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewWindow implements InterviewWindow {
  const _InterviewWindow({this.start, this.end});
  factory _InterviewWindow.fromJson(Map<String, dynamic> json) => _$InterviewWindowFromJson(json);

@override final  DateTime? start;
@override final  DateTime? end;

/// Create a copy of InterviewWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewWindowCopyWith<_InterviewWindow> get copyWith => __$InterviewWindowCopyWithImpl<_InterviewWindow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewWindowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewWindow&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end);

@override
String toString() {
  return 'InterviewWindow(start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$InterviewWindowCopyWith<$Res> implements $InterviewWindowCopyWith<$Res> {
  factory _$InterviewWindowCopyWith(_InterviewWindow value, $Res Function(_InterviewWindow) _then) = __$InterviewWindowCopyWithImpl;
@override @useResult
$Res call({
 DateTime? start, DateTime? end
});




}
/// @nodoc
class __$InterviewWindowCopyWithImpl<$Res>
    implements _$InterviewWindowCopyWith<$Res> {
  __$InterviewWindowCopyWithImpl(this._self, this._then);

  final _InterviewWindow _self;
  final $Res Function(_InterviewWindow) _then;

/// Create a copy of InterviewWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = freezed,Object? end = freezed,}) {
  return _then(_InterviewWindow(
start: freezed == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime?,end: freezed == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$JobPackageDetails {

 String? get currency; int? get totalCTC; int? get fixedPay; int? get joiningBonus;
/// Create a copy of JobPackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPackageDetailsCopyWith<JobPackageDetails> get copyWith => _$JobPackageDetailsCopyWithImpl<JobPackageDetails>(this as JobPackageDetails, _$identity);

  /// Serializes this JobPackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'JobPackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class $JobPackageDetailsCopyWith<$Res>  {
  factory $JobPackageDetailsCopyWith(JobPackageDetails value, $Res Function(JobPackageDetails) _then) = _$JobPackageDetailsCopyWithImpl;
@useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class _$JobPackageDetailsCopyWithImpl<$Res>
    implements $JobPackageDetailsCopyWith<$Res> {
  _$JobPackageDetailsCopyWithImpl(this._self, this._then);

  final JobPackageDetails _self;
  final $Res Function(JobPackageDetails) _then;

/// Create a copy of JobPackageDetails
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


/// Adds pattern-matching-related methods to [JobPackageDetails].
extension JobPackageDetailsPatterns on JobPackageDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPackageDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPackageDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPackageDetails value)  $default,){
final _that = this;
switch (_that) {
case _JobPackageDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPackageDetails value)?  $default,){
final _that = this;
switch (_that) {
case _JobPackageDetails() when $default != null:
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
case _JobPackageDetails() when $default != null:
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
case _JobPackageDetails():
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
case _JobPackageDetails() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPackageDetails implements JobPackageDetails {
  const _JobPackageDetails({this.currency, this.totalCTC, this.fixedPay, this.joiningBonus});
  factory _JobPackageDetails.fromJson(Map<String, dynamic> json) => _$JobPackageDetailsFromJson(json);

@override final  String? currency;
@override final  int? totalCTC;
@override final  int? fixedPay;
@override final  int? joiningBonus;

/// Create a copy of JobPackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPackageDetailsCopyWith<_JobPackageDetails> get copyWith => __$JobPackageDetailsCopyWithImpl<_JobPackageDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPackageDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'JobPackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class _$JobPackageDetailsCopyWith<$Res> implements $JobPackageDetailsCopyWith<$Res> {
  factory _$JobPackageDetailsCopyWith(_JobPackageDetails value, $Res Function(_JobPackageDetails) _then) = __$JobPackageDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class __$JobPackageDetailsCopyWithImpl<$Res>
    implements _$JobPackageDetailsCopyWith<$Res> {
  __$JobPackageDetailsCopyWithImpl(this._self, this._then);

  final _JobPackageDetails _self;
  final $Res Function(_JobPackageDetails) _then;

/// Create a copy of JobPackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_JobPackageDetails(
currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,fixedPay: freezed == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int?,joiningBonus: freezed == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ContactPerson {

 String? get name; String? get designation; String? get email; String? get mobile; String? get linkedin;
/// Create a copy of ContactPerson
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactPersonCopyWith<ContactPerson> get copyWith => _$ContactPersonCopyWithImpl<ContactPerson>(this as ContactPerson, _$identity);

  /// Serializes this ContactPerson to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactPerson&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,email,mobile,linkedin);

@override
String toString() {
  return 'ContactPerson(name: $name, designation: $designation, email: $email, mobile: $mobile, linkedin: $linkedin)';
}


}

/// @nodoc
abstract mixin class $ContactPersonCopyWith<$Res>  {
  factory $ContactPersonCopyWith(ContactPerson value, $Res Function(ContactPerson) _then) = _$ContactPersonCopyWithImpl;
@useResult
$Res call({
 String? name, String? designation, String? email, String? mobile, String? linkedin
});




}
/// @nodoc
class _$ContactPersonCopyWithImpl<$Res>
    implements $ContactPersonCopyWith<$Res> {
  _$ContactPersonCopyWithImpl(this._self, this._then);

  final ContactPerson _self;
  final $Res Function(ContactPerson) _then;

/// Create a copy of ContactPerson
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? designation = freezed,Object? email = freezed,Object? mobile = freezed,Object? linkedin = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactPerson].
extension ContactPersonPatterns on ContactPerson {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactPerson value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactPerson() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactPerson value)  $default,){
final _that = this;
switch (_that) {
case _ContactPerson():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactPerson value)?  $default,){
final _that = this;
switch (_that) {
case _ContactPerson() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? email,  String? mobile,  String? linkedin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactPerson() when $default != null:
return $default(_that.name,_that.designation,_that.email,_that.mobile,_that.linkedin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? email,  String? mobile,  String? linkedin)  $default,) {final _that = this;
switch (_that) {
case _ContactPerson():
return $default(_that.name,_that.designation,_that.email,_that.mobile,_that.linkedin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? designation,  String? email,  String? mobile,  String? linkedin)?  $default,) {final _that = this;
switch (_that) {
case _ContactPerson() when $default != null:
return $default(_that.name,_that.designation,_that.email,_that.mobile,_that.linkedin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactPerson implements ContactPerson {
  const _ContactPerson({this.name, this.designation, this.email, this.mobile, this.linkedin});
  factory _ContactPerson.fromJson(Map<String, dynamic> json) => _$ContactPersonFromJson(json);

@override final  String? name;
@override final  String? designation;
@override final  String? email;
@override final  String? mobile;
@override final  String? linkedin;

/// Create a copy of ContactPerson
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactPersonCopyWith<_ContactPerson> get copyWith => __$ContactPersonCopyWithImpl<_ContactPerson>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactPersonToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactPerson&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.email, email) || other.email == email)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedin, linkedin) || other.linkedin == linkedin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,email,mobile,linkedin);

@override
String toString() {
  return 'ContactPerson(name: $name, designation: $designation, email: $email, mobile: $mobile, linkedin: $linkedin)';
}


}

/// @nodoc
abstract mixin class _$ContactPersonCopyWith<$Res> implements $ContactPersonCopyWith<$Res> {
  factory _$ContactPersonCopyWith(_ContactPerson value, $Res Function(_ContactPerson) _then) = __$ContactPersonCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? designation, String? email, String? mobile, String? linkedin
});




}
/// @nodoc
class __$ContactPersonCopyWithImpl<$Res>
    implements _$ContactPersonCopyWith<$Res> {
  __$ContactPersonCopyWithImpl(this._self, this._then);

  final _ContactPerson _self;
  final $Res Function(_ContactPerson) _then;

/// Create a copy of ContactPerson
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? designation = freezed,Object? email = freezed,Object? mobile = freezed,Object? linkedin = freezed,}) {
  return _then(_ContactPerson(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,linkedin: freezed == linkedin ? _self.linkedin : linkedin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$JobCompanyPosted {

@JsonKey(name: '_id') String? get id; String? get profileImageUrl; String? get backgroundImageUrl; JobEmployerDetails? get employerDetails; JobCompanyDetails? get companyDetails;
/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCompanyPostedCopyWith<JobCompanyPosted> get copyWith => _$JobCompanyPostedCopyWithImpl<JobCompanyPosted>(this as JobCompanyPosted, _$identity);

  /// Serializes this JobCompanyPosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobCompanyPosted&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'JobCompanyPosted(id: $id, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class $JobCompanyPostedCopyWith<$Res>  {
  factory $JobCompanyPostedCopyWith(JobCompanyPosted value, $Res Function(JobCompanyPosted) _then) = _$JobCompanyPostedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? profileImageUrl, String? backgroundImageUrl, JobEmployerDetails? employerDetails, JobCompanyDetails? companyDetails
});


$JobEmployerDetailsCopyWith<$Res>? get employerDetails;$JobCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class _$JobCompanyPostedCopyWithImpl<$Res>
    implements $JobCompanyPostedCopyWith<$Res> {
  _$JobCompanyPostedCopyWithImpl(this._self, this._then);

  final JobCompanyPosted _self;
  final $Res Function(JobCompanyPosted) _then;

/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as JobEmployerDetails?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as JobCompanyDetails?,
  ));
}
/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEmployerDetailsCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $JobEmployerDetailsCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCompanyDetailsCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $JobCompanyDetailsCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobCompanyPosted].
extension JobCompanyPostedPatterns on JobCompanyPosted {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobCompanyPosted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobCompanyPosted() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobCompanyPosted value)  $default,){
final _that = this;
switch (_that) {
case _JobCompanyPosted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobCompanyPosted value)?  $default,){
final _that = this;
switch (_that) {
case _JobCompanyPosted() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  JobEmployerDetails? employerDetails,  JobCompanyDetails? companyDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobCompanyPosted() when $default != null:
return $default(_that.id,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  JobEmployerDetails? employerDetails,  JobCompanyDetails? companyDetails)  $default,) {final _that = this;
switch (_that) {
case _JobCompanyPosted():
return $default(_that.id,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  JobEmployerDetails? employerDetails,  JobCompanyDetails? companyDetails)?  $default,) {final _that = this;
switch (_that) {
case _JobCompanyPosted() when $default != null:
return $default(_that.id,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobCompanyPosted implements JobCompanyPosted {
  const _JobCompanyPosted({@JsonKey(name: '_id') this.id, this.profileImageUrl, this.backgroundImageUrl, this.employerDetails, this.companyDetails});
  factory _JobCompanyPosted.fromJson(Map<String, dynamic> json) => _$JobCompanyPostedFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? profileImageUrl;
@override final  String? backgroundImageUrl;
@override final  JobEmployerDetails? employerDetails;
@override final  JobCompanyDetails? companyDetails;

/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCompanyPostedCopyWith<_JobCompanyPosted> get copyWith => __$JobCompanyPostedCopyWithImpl<_JobCompanyPosted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobCompanyPostedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobCompanyPosted&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'JobCompanyPosted(id: $id, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class _$JobCompanyPostedCopyWith<$Res> implements $JobCompanyPostedCopyWith<$Res> {
  factory _$JobCompanyPostedCopyWith(_JobCompanyPosted value, $Res Function(_JobCompanyPosted) _then) = __$JobCompanyPostedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? profileImageUrl, String? backgroundImageUrl, JobEmployerDetails? employerDetails, JobCompanyDetails? companyDetails
});


@override $JobEmployerDetailsCopyWith<$Res>? get employerDetails;@override $JobCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class __$JobCompanyPostedCopyWithImpl<$Res>
    implements _$JobCompanyPostedCopyWith<$Res> {
  __$JobCompanyPostedCopyWithImpl(this._self, this._then);

  final _JobCompanyPosted _self;
  final $Res Function(_JobCompanyPosted) _then;

/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_JobCompanyPosted(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as JobEmployerDetails?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as JobCompanyDetails?,
  ));
}

/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEmployerDetailsCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $JobEmployerDetailsCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of JobCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCompanyDetailsCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $JobCompanyDetailsCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}


/// @nodoc
mixin _$JobEmployerDetails {

 String? get name; String? get designation; String? get workEmail; String? get mobile; String? get linkedIn;
/// Create a copy of JobEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobEmployerDetailsCopyWith<JobEmployerDetails> get copyWith => _$JobEmployerDetailsCopyWithImpl<JobEmployerDetails>(this as JobEmployerDetails, _$identity);

  /// Serializes this JobEmployerDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobEmployerDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.workEmail, workEmail) || other.workEmail == workEmail)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,workEmail,mobile,linkedIn);

@override
String toString() {
  return 'JobEmployerDetails(name: $name, designation: $designation, workEmail: $workEmail, mobile: $mobile, linkedIn: $linkedIn)';
}


}

/// @nodoc
abstract mixin class $JobEmployerDetailsCopyWith<$Res>  {
  factory $JobEmployerDetailsCopyWith(JobEmployerDetails value, $Res Function(JobEmployerDetails) _then) = _$JobEmployerDetailsCopyWithImpl;
@useResult
$Res call({
 String? name, String? designation, String? workEmail, String? mobile, String? linkedIn
});




}
/// @nodoc
class _$JobEmployerDetailsCopyWithImpl<$Res>
    implements $JobEmployerDetailsCopyWith<$Res> {
  _$JobEmployerDetailsCopyWithImpl(this._self, this._then);

  final JobEmployerDetails _self;
  final $Res Function(JobEmployerDetails) _then;

/// Create a copy of JobEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? designation = freezed,Object? workEmail = freezed,Object? mobile = freezed,Object? linkedIn = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,workEmail: freezed == workEmail ? _self.workEmail : workEmail // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,linkedIn: freezed == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobEmployerDetails].
extension JobEmployerDetailsPatterns on JobEmployerDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobEmployerDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobEmployerDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobEmployerDetails value)  $default,){
final _that = this;
switch (_that) {
case _JobEmployerDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobEmployerDetails value)?  $default,){
final _that = this;
switch (_that) {
case _JobEmployerDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? workEmail,  String? mobile,  String? linkedIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobEmployerDetails() when $default != null:
return $default(_that.name,_that.designation,_that.workEmail,_that.mobile,_that.linkedIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? workEmail,  String? mobile,  String? linkedIn)  $default,) {final _that = this;
switch (_that) {
case _JobEmployerDetails():
return $default(_that.name,_that.designation,_that.workEmail,_that.mobile,_that.linkedIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? designation,  String? workEmail,  String? mobile,  String? linkedIn)?  $default,) {final _that = this;
switch (_that) {
case _JobEmployerDetails() when $default != null:
return $default(_that.name,_that.designation,_that.workEmail,_that.mobile,_that.linkedIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobEmployerDetails implements JobEmployerDetails {
  const _JobEmployerDetails({this.name, this.designation, this.workEmail, this.mobile, this.linkedIn});
  factory _JobEmployerDetails.fromJson(Map<String, dynamic> json) => _$JobEmployerDetailsFromJson(json);

@override final  String? name;
@override final  String? designation;
@override final  String? workEmail;
@override final  String? mobile;
@override final  String? linkedIn;

/// Create a copy of JobEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobEmployerDetailsCopyWith<_JobEmployerDetails> get copyWith => __$JobEmployerDetailsCopyWithImpl<_JobEmployerDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobEmployerDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobEmployerDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.workEmail, workEmail) || other.workEmail == workEmail)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,workEmail,mobile,linkedIn);

@override
String toString() {
  return 'JobEmployerDetails(name: $name, designation: $designation, workEmail: $workEmail, mobile: $mobile, linkedIn: $linkedIn)';
}


}

/// @nodoc
abstract mixin class _$JobEmployerDetailsCopyWith<$Res> implements $JobEmployerDetailsCopyWith<$Res> {
  factory _$JobEmployerDetailsCopyWith(_JobEmployerDetails value, $Res Function(_JobEmployerDetails) _then) = __$JobEmployerDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? designation, String? workEmail, String? mobile, String? linkedIn
});




}
/// @nodoc
class __$JobEmployerDetailsCopyWithImpl<$Res>
    implements _$JobEmployerDetailsCopyWith<$Res> {
  __$JobEmployerDetailsCopyWithImpl(this._self, this._then);

  final _JobEmployerDetails _self;
  final $Res Function(_JobEmployerDetails) _then;

/// Create a copy of JobEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? designation = freezed,Object? workEmail = freezed,Object? mobile = freezed,Object? linkedIn = freezed,}) {
  return _then(_JobEmployerDetails(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,workEmail: freezed == workEmail ? _self.workEmail : workEmail // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,linkedIn: freezed == linkedIn ? _self.linkedIn : linkedIn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$JobCompanyDetails {

 String? get companyName; String? get description; String? get companyType; String? get industryType; String? get numberOfEmployees; String? get establishedYear; String? get websiteUrl; String? get companyLinkedin; String? get linkedinUrl; String? get phoneNumber; String? get alternatePhoneNumber; String? get state; String? get city; String? get country; String? get pincode;
/// Create a copy of JobCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCompanyDetailsCopyWith<JobCompanyDetails> get copyWith => _$JobCompanyDetailsCopyWithImpl<JobCompanyDetails>(this as JobCompanyDetails, _$identity);

  /// Serializes this JobCompanyDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.industryType, industryType) || other.industryType == industryType)&&(identical(other.numberOfEmployees, numberOfEmployees) || other.numberOfEmployees == numberOfEmployees)&&(identical(other.establishedYear, establishedYear) || other.establishedYear == establishedYear)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.companyLinkedin, companyLinkedin) || other.companyLinkedin == companyLinkedin)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.pincode, pincode) || other.pincode == pincode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,description,companyType,industryType,numberOfEmployees,establishedYear,websiteUrl,companyLinkedin,linkedinUrl,phoneNumber,alternatePhoneNumber,state,city,country,pincode);

@override
String toString() {
  return 'JobCompanyDetails(companyName: $companyName, description: $description, companyType: $companyType, industryType: $industryType, numberOfEmployees: $numberOfEmployees, establishedYear: $establishedYear, websiteUrl: $websiteUrl, companyLinkedin: $companyLinkedin, linkedinUrl: $linkedinUrl, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, state: $state, city: $city, country: $country, pincode: $pincode)';
}


}

/// @nodoc
abstract mixin class $JobCompanyDetailsCopyWith<$Res>  {
  factory $JobCompanyDetailsCopyWith(JobCompanyDetails value, $Res Function(JobCompanyDetails) _then) = _$JobCompanyDetailsCopyWithImpl;
@useResult
$Res call({
 String? companyName, String? description, String? companyType, String? industryType, String? numberOfEmployees, String? establishedYear, String? websiteUrl, String? companyLinkedin, String? linkedinUrl, String? phoneNumber, String? alternatePhoneNumber, String? state, String? city, String? country, String? pincode
});




}
/// @nodoc
class _$JobCompanyDetailsCopyWithImpl<$Res>
    implements $JobCompanyDetailsCopyWith<$Res> {
  _$JobCompanyDetailsCopyWithImpl(this._self, this._then);

  final JobCompanyDetails _self;
  final $Res Function(JobCompanyDetails) _then;

/// Create a copy of JobCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? description = freezed,Object? companyType = freezed,Object? industryType = freezed,Object? numberOfEmployees = freezed,Object? establishedYear = freezed,Object? websiteUrl = freezed,Object? companyLinkedin = freezed,Object? linkedinUrl = freezed,Object? phoneNumber = freezed,Object? alternatePhoneNumber = freezed,Object? state = freezed,Object? city = freezed,Object? country = freezed,Object? pincode = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyType: freezed == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as String?,industryType: freezed == industryType ? _self.industryType : industryType // ignore: cast_nullable_to_non_nullable
as String?,numberOfEmployees: freezed == numberOfEmployees ? _self.numberOfEmployees : numberOfEmployees // ignore: cast_nullable_to_non_nullable
as String?,establishedYear: freezed == establishedYear ? _self.establishedYear : establishedYear // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,companyLinkedin: freezed == companyLinkedin ? _self.companyLinkedin : companyLinkedin // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,alternatePhoneNumber: freezed == alternatePhoneNumber ? _self.alternatePhoneNumber : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,pincode: freezed == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobCompanyDetails].
extension JobCompanyDetailsPatterns on JobCompanyDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobCompanyDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobCompanyDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobCompanyDetails value)  $default,){
final _that = this;
switch (_that) {
case _JobCompanyDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobCompanyDetails value)?  $default,){
final _that = this;
switch (_that) {
case _JobCompanyDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companyName,  String? description,  String? companyType,  String? industryType,  String? numberOfEmployees,  String? establishedYear,  String? websiteUrl,  String? companyLinkedin,  String? linkedinUrl,  String? phoneNumber,  String? alternatePhoneNumber,  String? state,  String? city,  String? country,  String? pincode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobCompanyDetails() when $default != null:
return $default(_that.companyName,_that.description,_that.companyType,_that.industryType,_that.numberOfEmployees,_that.establishedYear,_that.websiteUrl,_that.companyLinkedin,_that.linkedinUrl,_that.phoneNumber,_that.alternatePhoneNumber,_that.state,_that.city,_that.country,_that.pincode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companyName,  String? description,  String? companyType,  String? industryType,  String? numberOfEmployees,  String? establishedYear,  String? websiteUrl,  String? companyLinkedin,  String? linkedinUrl,  String? phoneNumber,  String? alternatePhoneNumber,  String? state,  String? city,  String? country,  String? pincode)  $default,) {final _that = this;
switch (_that) {
case _JobCompanyDetails():
return $default(_that.companyName,_that.description,_that.companyType,_that.industryType,_that.numberOfEmployees,_that.establishedYear,_that.websiteUrl,_that.companyLinkedin,_that.linkedinUrl,_that.phoneNumber,_that.alternatePhoneNumber,_that.state,_that.city,_that.country,_that.pincode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companyName,  String? description,  String? companyType,  String? industryType,  String? numberOfEmployees,  String? establishedYear,  String? websiteUrl,  String? companyLinkedin,  String? linkedinUrl,  String? phoneNumber,  String? alternatePhoneNumber,  String? state,  String? city,  String? country,  String? pincode)?  $default,) {final _that = this;
switch (_that) {
case _JobCompanyDetails() when $default != null:
return $default(_that.companyName,_that.description,_that.companyType,_that.industryType,_that.numberOfEmployees,_that.establishedYear,_that.websiteUrl,_that.companyLinkedin,_that.linkedinUrl,_that.phoneNumber,_that.alternatePhoneNumber,_that.state,_that.city,_that.country,_that.pincode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobCompanyDetails implements JobCompanyDetails {
  const _JobCompanyDetails({this.companyName, this.description, this.companyType, this.industryType, this.numberOfEmployees, this.establishedYear, this.websiteUrl, this.companyLinkedin, this.linkedinUrl, this.phoneNumber, this.alternatePhoneNumber, this.state, this.city, this.country, this.pincode});
  factory _JobCompanyDetails.fromJson(Map<String, dynamic> json) => _$JobCompanyDetailsFromJson(json);

@override final  String? companyName;
@override final  String? description;
@override final  String? companyType;
@override final  String? industryType;
@override final  String? numberOfEmployees;
@override final  String? establishedYear;
@override final  String? websiteUrl;
@override final  String? companyLinkedin;
@override final  String? linkedinUrl;
@override final  String? phoneNumber;
@override final  String? alternatePhoneNumber;
@override final  String? state;
@override final  String? city;
@override final  String? country;
@override final  String? pincode;

/// Create a copy of JobCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCompanyDetailsCopyWith<_JobCompanyDetails> get copyWith => __$JobCompanyDetailsCopyWithImpl<_JobCompanyDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobCompanyDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.industryType, industryType) || other.industryType == industryType)&&(identical(other.numberOfEmployees, numberOfEmployees) || other.numberOfEmployees == numberOfEmployees)&&(identical(other.establishedYear, establishedYear) || other.establishedYear == establishedYear)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.companyLinkedin, companyLinkedin) || other.companyLinkedin == companyLinkedin)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.pincode, pincode) || other.pincode == pincode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,description,companyType,industryType,numberOfEmployees,establishedYear,websiteUrl,companyLinkedin,linkedinUrl,phoneNumber,alternatePhoneNumber,state,city,country,pincode);

@override
String toString() {
  return 'JobCompanyDetails(companyName: $companyName, description: $description, companyType: $companyType, industryType: $industryType, numberOfEmployees: $numberOfEmployees, establishedYear: $establishedYear, websiteUrl: $websiteUrl, companyLinkedin: $companyLinkedin, linkedinUrl: $linkedinUrl, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, state: $state, city: $city, country: $country, pincode: $pincode)';
}


}

/// @nodoc
abstract mixin class _$JobCompanyDetailsCopyWith<$Res> implements $JobCompanyDetailsCopyWith<$Res> {
  factory _$JobCompanyDetailsCopyWith(_JobCompanyDetails value, $Res Function(_JobCompanyDetails) _then) = __$JobCompanyDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? companyName, String? description, String? companyType, String? industryType, String? numberOfEmployees, String? establishedYear, String? websiteUrl, String? companyLinkedin, String? linkedinUrl, String? phoneNumber, String? alternatePhoneNumber, String? state, String? city, String? country, String? pincode
});




}
/// @nodoc
class __$JobCompanyDetailsCopyWithImpl<$Res>
    implements _$JobCompanyDetailsCopyWith<$Res> {
  __$JobCompanyDetailsCopyWithImpl(this._self, this._then);

  final _JobCompanyDetails _self;
  final $Res Function(_JobCompanyDetails) _then;

/// Create a copy of JobCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? description = freezed,Object? companyType = freezed,Object? industryType = freezed,Object? numberOfEmployees = freezed,Object? establishedYear = freezed,Object? websiteUrl = freezed,Object? companyLinkedin = freezed,Object? linkedinUrl = freezed,Object? phoneNumber = freezed,Object? alternatePhoneNumber = freezed,Object? state = freezed,Object? city = freezed,Object? country = freezed,Object? pincode = freezed,}) {
  return _then(_JobCompanyDetails(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,companyType: freezed == companyType ? _self.companyType : companyType // ignore: cast_nullable_to_non_nullable
as String?,industryType: freezed == industryType ? _self.industryType : industryType // ignore: cast_nullable_to_non_nullable
as String?,numberOfEmployees: freezed == numberOfEmployees ? _self.numberOfEmployees : numberOfEmployees // ignore: cast_nullable_to_non_nullable
as String?,establishedYear: freezed == establishedYear ? _self.establishedYear : establishedYear // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,companyLinkedin: freezed == companyLinkedin ? _self.companyLinkedin : companyLinkedin // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,alternatePhoneNumber: freezed == alternatePhoneNumber ? _self.alternatePhoneNumber : alternatePhoneNumber // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,pincode: freezed == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
