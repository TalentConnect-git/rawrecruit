// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InternshipModel {

@JsonKey(name: '_id') String? get id;// Basic
 String? get description; String? get jobType; String? get jobStatus; String? get approvalStatus; String? get visibleTo; String? get broadcastType; String? get eligibilityCriteria; String? get minEducation; String? get minimumStudents; String? get venue; String? get internshipDuration;// Numbers
@JsonKey(fromJson: _doubleFromJson) double? get cgpa; int? get numberOfOpenings; int? get views; int? get matchScore;// Lists
 List<String>? get jobRoles; List<String>? get skills; List<String>? get workMode; List<String>? get location; List<String>? get employmentType; List<String>? get degree; List<String>? get studentStreams; List<String>? get collegeTypes; List<String>? get collegeCategories; List<String>? get companyType; List<String>? get rounds; List<String>? get selectionProcess; List<String>? get certifications; List<String>? get workAchievements; List<String>? get amenitiesRequired; List<String>? get benefits; List<String>? get tags; List<String>? get toolsAndPlatforms; List<String>? get workLocation; List<String>? get numberOfStudent;// Nested
 InternshipPackageDetails? get packageDetails; ContactPerson? get contactPerson; InternshipCompanyPosted? get companyPosted;// Dates
 DateTime? get onlineTestDate; DateTime? get startDate; DateTime? get endDate; DateTime? get expireAt; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipModelCopyWith<InternshipModel> get copyWith => _$InternshipModelCopyWithImpl<InternshipModel>(this as InternshipModel, _$identity);

  /// Serializes this InternshipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.degree, degree)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.collegeTypes, collegeTypes)&&const DeepCollectionEquality().equals(other.collegeCategories, collegeCategories)&&const DeepCollectionEquality().equals(other.companyType, companyType)&&const DeepCollectionEquality().equals(other.rounds, rounds)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&const DeepCollectionEquality().equals(other.workAchievements, workAchievements)&&const DeepCollectionEquality().equals(other.amenitiesRequired, amenitiesRequired)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.toolsAndPlatforms, toolsAndPlatforms)&&const DeepCollectionEquality().equals(other.workLocation, workLocation)&&const DeepCollectionEquality().equals(other.numberOfStudent, numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,description,jobType,jobStatus,approvalStatus,visibleTo,broadcastType,eligibilityCriteria,minEducation,minimumStudents,venue,internshipDuration,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(degree),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(collegeTypes),const DeepCollectionEquality().hash(collegeCategories),const DeepCollectionEquality().hash(companyType),const DeepCollectionEquality().hash(rounds),const DeepCollectionEquality().hash(selectionProcess),const DeepCollectionEquality().hash(certifications),const DeepCollectionEquality().hash(workAchievements),const DeepCollectionEquality().hash(amenitiesRequired),const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(toolsAndPlatforms),const DeepCollectionEquality().hash(workLocation),const DeepCollectionEquality().hash(numberOfStudent),packageDetails,contactPerson,companyPosted,onlineTestDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'InternshipModel(id: $id, description: $description, jobType: $jobType, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, eligibilityCriteria: $eligibilityCriteria, minEducation: $minEducation, minimumStudents: $minimumStudents, venue: $venue, internshipDuration: $internshipDuration, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, workMode: $workMode, location: $location, employmentType: $employmentType, degree: $degree, studentStreams: $studentStreams, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, contactPerson: $contactPerson, companyPosted: $companyPosted, onlineTestDate: $onlineTestDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $InternshipModelCopyWith<$Res>  {
  factory $InternshipModelCopyWith(InternshipModel value, $Res Function(InternshipModel) _then) = _$InternshipModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, String? jobType, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? eligibilityCriteria, String? minEducation, String? minimumStudents, String? venue, String? internshipDuration,@JsonKey(fromJson: _doubleFromJson) double? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? employmentType, List<String>? degree, List<String>? studentStreams, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, InternshipPackageDetails? packageDetails, ContactPerson? contactPerson, InternshipCompanyPosted? companyPosted, DateTime? onlineTestDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


$InternshipPackageDetailsCopyWith<$Res>? get packageDetails;$ContactPersonCopyWith<$Res>? get contactPerson;$InternshipCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class _$InternshipModelCopyWithImpl<$Res>
    implements $InternshipModelCopyWith<$Res> {
  _$InternshipModelCopyWithImpl(this._self, this._then);

  final InternshipModel _self;
  final $Res Function(InternshipModel) _then;

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? description = freezed,Object? jobType = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? eligibilityCriteria = freezed,Object? minEducation = freezed,Object? minimumStudents = freezed,Object? venue = freezed,Object? internshipDuration = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? employmentType = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? contactPerson = freezed,Object? companyPosted = freezed,Object? onlineTestDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
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
as InternshipPackageDetails?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as ContactPerson?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as InternshipCompanyPosted?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $InternshipPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of InternshipModel
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
}/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipCompanyPostedCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $InternshipCompanyPostedCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}
}


/// Adds pattern-matching-related methods to [InternshipModel].
extension InternshipModelPatterns on InternshipModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternshipModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternshipModel value)  $default,){
final _that = this;
switch (_that) {
case _InternshipModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternshipModel value)?  $default,){
final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minEducation,  String? minimumStudents,  String? venue,  String? internshipDuration, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  InternshipPackageDetails? packageDetails,  ContactPerson? contactPerson,  InternshipCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
return $default(_that.id,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minEducation,_that.minimumStudents,_that.venue,_that.internshipDuration,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minEducation,  String? minimumStudents,  String? venue,  String? internshipDuration, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  InternshipPackageDetails? packageDetails,  ContactPerson? contactPerson,  InternshipCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InternshipModel():
return $default(_that.id,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minEducation,_that.minimumStudents,_that.venue,_that.internshipDuration,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobType,  String? jobStatus,  String? approvalStatus,  String? visibleTo,  String? broadcastType,  String? eligibilityCriteria,  String? minEducation,  String? minimumStudents,  String? venue,  String? internshipDuration, @JsonKey(fromJson: _doubleFromJson)  double? cgpa,  int? numberOfOpenings,  int? views,  int? matchScore,  List<String>? jobRoles,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? employmentType,  List<String>? degree,  List<String>? studentStreams,  List<String>? collegeTypes,  List<String>? collegeCategories,  List<String>? companyType,  List<String>? rounds,  List<String>? selectionProcess,  List<String>? certifications,  List<String>? workAchievements,  List<String>? amenitiesRequired,  List<String>? benefits,  List<String>? tags,  List<String>? toolsAndPlatforms,  List<String>? workLocation,  List<String>? numberOfStudent,  InternshipPackageDetails? packageDetails,  ContactPerson? contactPerson,  InternshipCompanyPosted? companyPosted,  DateTime? onlineTestDate,  DateTime? startDate,  DateTime? endDate,  DateTime? expireAt,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
return $default(_that.id,_that.description,_that.jobType,_that.jobStatus,_that.approvalStatus,_that.visibleTo,_that.broadcastType,_that.eligibilityCriteria,_that.minEducation,_that.minimumStudents,_that.venue,_that.internshipDuration,_that.cgpa,_that.numberOfOpenings,_that.views,_that.matchScore,_that.jobRoles,_that.skills,_that.workMode,_that.location,_that.employmentType,_that.degree,_that.studentStreams,_that.collegeTypes,_that.collegeCategories,_that.companyType,_that.rounds,_that.selectionProcess,_that.certifications,_that.workAchievements,_that.amenitiesRequired,_that.benefits,_that.tags,_that.toolsAndPlatforms,_that.workLocation,_that.numberOfStudent,_that.packageDetails,_that.contactPerson,_that.companyPosted,_that.onlineTestDate,_that.startDate,_that.endDate,_that.expireAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipModel implements InternshipModel {
  const _InternshipModel({@JsonKey(name: '_id') this.id, this.description, this.jobType, this.jobStatus, this.approvalStatus, this.visibleTo, this.broadcastType, this.eligibilityCriteria, this.minEducation, this.minimumStudents, this.venue, this.internshipDuration, @JsonKey(fromJson: _doubleFromJson) this.cgpa, this.numberOfOpenings, this.views, this.matchScore, final  List<String>? jobRoles, final  List<String>? skills, final  List<String>? workMode, final  List<String>? location, final  List<String>? employmentType, final  List<String>? degree, final  List<String>? studentStreams, final  List<String>? collegeTypes, final  List<String>? collegeCategories, final  List<String>? companyType, final  List<String>? rounds, final  List<String>? selectionProcess, final  List<String>? certifications, final  List<String>? workAchievements, final  List<String>? amenitiesRequired, final  List<String>? benefits, final  List<String>? tags, final  List<String>? toolsAndPlatforms, final  List<String>? workLocation, final  List<String>? numberOfStudent, this.packageDetails, this.contactPerson, this.companyPosted, this.onlineTestDate, this.startDate, this.endDate, this.expireAt, this.createdAt, this.updatedAt}): _jobRoles = jobRoles,_skills = skills,_workMode = workMode,_location = location,_employmentType = employmentType,_degree = degree,_studentStreams = studentStreams,_collegeTypes = collegeTypes,_collegeCategories = collegeCategories,_companyType = companyType,_rounds = rounds,_selectionProcess = selectionProcess,_certifications = certifications,_workAchievements = workAchievements,_amenitiesRequired = amenitiesRequired,_benefits = benefits,_tags = tags,_toolsAndPlatforms = toolsAndPlatforms,_workLocation = workLocation,_numberOfStudent = numberOfStudent;
  factory _InternshipModel.fromJson(Map<String, dynamic> json) => _$InternshipModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
// Basic
@override final  String? description;
@override final  String? jobType;
@override final  String? jobStatus;
@override final  String? approvalStatus;
@override final  String? visibleTo;
@override final  String? broadcastType;
@override final  String? eligibilityCriteria;
@override final  String? minEducation;
@override final  String? minimumStudents;
@override final  String? venue;
@override final  String? internshipDuration;
// Numbers
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
@override final  InternshipPackageDetails? packageDetails;
@override final  ContactPerson? contactPerson;
@override final  InternshipCompanyPosted? companyPosted;
// Dates
@override final  DateTime? onlineTestDate;
@override final  DateTime? startDate;
@override final  DateTime? endDate;
@override final  DateTime? expireAt;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternshipModelCopyWith<_InternshipModel> get copyWith => __$InternshipModelCopyWithImpl<_InternshipModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternshipModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobStatus, jobStatus) || other.jobStatus == jobStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.visibleTo, visibleTo) || other.visibleTo == visibleTo)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.minimumStudents, minimumStudents) || other.minimumStudents == minimumStudents)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.views, views) || other.views == views)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._degree, _degree)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._collegeTypes, _collegeTypes)&&const DeepCollectionEquality().equals(other._collegeCategories, _collegeCategories)&&const DeepCollectionEquality().equals(other._companyType, _companyType)&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&const DeepCollectionEquality().equals(other._workAchievements, _workAchievements)&&const DeepCollectionEquality().equals(other._amenitiesRequired, _amenitiesRequired)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._toolsAndPlatforms, _toolsAndPlatforms)&&const DeepCollectionEquality().equals(other._workLocation, _workLocation)&&const DeepCollectionEquality().equals(other._numberOfStudent, _numberOfStudent)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.contactPerson, contactPerson) || other.contactPerson == contactPerson)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,description,jobType,jobStatus,approvalStatus,visibleTo,broadcastType,eligibilityCriteria,minEducation,minimumStudents,venue,internshipDuration,cgpa,numberOfOpenings,views,matchScore,const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_degree),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_collegeTypes),const DeepCollectionEquality().hash(_collegeCategories),const DeepCollectionEquality().hash(_companyType),const DeepCollectionEquality().hash(_rounds),const DeepCollectionEquality().hash(_selectionProcess),const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_workAchievements),const DeepCollectionEquality().hash(_amenitiesRequired),const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_toolsAndPlatforms),const DeepCollectionEquality().hash(_workLocation),const DeepCollectionEquality().hash(_numberOfStudent),packageDetails,contactPerson,companyPosted,onlineTestDate,startDate,endDate,expireAt,createdAt,updatedAt]);

@override
String toString() {
  return 'InternshipModel(id: $id, description: $description, jobType: $jobType, jobStatus: $jobStatus, approvalStatus: $approvalStatus, visibleTo: $visibleTo, broadcastType: $broadcastType, eligibilityCriteria: $eligibilityCriteria, minEducation: $minEducation, minimumStudents: $minimumStudents, venue: $venue, internshipDuration: $internshipDuration, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, views: $views, matchScore: $matchScore, jobRoles: $jobRoles, skills: $skills, workMode: $workMode, location: $location, employmentType: $employmentType, degree: $degree, studentStreams: $studentStreams, collegeTypes: $collegeTypes, collegeCategories: $collegeCategories, companyType: $companyType, rounds: $rounds, selectionProcess: $selectionProcess, certifications: $certifications, workAchievements: $workAchievements, amenitiesRequired: $amenitiesRequired, benefits: $benefits, tags: $tags, toolsAndPlatforms: $toolsAndPlatforms, workLocation: $workLocation, numberOfStudent: $numberOfStudent, packageDetails: $packageDetails, contactPerson: $contactPerson, companyPosted: $companyPosted, onlineTestDate: $onlineTestDate, startDate: $startDate, endDate: $endDate, expireAt: $expireAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InternshipModelCopyWith<$Res> implements $InternshipModelCopyWith<$Res> {
  factory _$InternshipModelCopyWith(_InternshipModel value, $Res Function(_InternshipModel) _then) = __$InternshipModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, String? jobType, String? jobStatus, String? approvalStatus, String? visibleTo, String? broadcastType, String? eligibilityCriteria, String? minEducation, String? minimumStudents, String? venue, String? internshipDuration,@JsonKey(fromJson: _doubleFromJson) double? cgpa, int? numberOfOpenings, int? views, int? matchScore, List<String>? jobRoles, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? employmentType, List<String>? degree, List<String>? studentStreams, List<String>? collegeTypes, List<String>? collegeCategories, List<String>? companyType, List<String>? rounds, List<String>? selectionProcess, List<String>? certifications, List<String>? workAchievements, List<String>? amenitiesRequired, List<String>? benefits, List<String>? tags, List<String>? toolsAndPlatforms, List<String>? workLocation, List<String>? numberOfStudent, InternshipPackageDetails? packageDetails, ContactPerson? contactPerson, InternshipCompanyPosted? companyPosted, DateTime? onlineTestDate, DateTime? startDate, DateTime? endDate, DateTime? expireAt, DateTime? createdAt, DateTime? updatedAt
});


@override $InternshipPackageDetailsCopyWith<$Res>? get packageDetails;@override $ContactPersonCopyWith<$Res>? get contactPerson;@override $InternshipCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class __$InternshipModelCopyWithImpl<$Res>
    implements _$InternshipModelCopyWith<$Res> {
  __$InternshipModelCopyWithImpl(this._self, this._then);

  final _InternshipModel _self;
  final $Res Function(_InternshipModel) _then;

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? description = freezed,Object? jobType = freezed,Object? jobStatus = freezed,Object? approvalStatus = freezed,Object? visibleTo = freezed,Object? broadcastType = freezed,Object? eligibilityCriteria = freezed,Object? minEducation = freezed,Object? minimumStudents = freezed,Object? venue = freezed,Object? internshipDuration = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? views = freezed,Object? matchScore = freezed,Object? jobRoles = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? employmentType = freezed,Object? degree = freezed,Object? studentStreams = freezed,Object? collegeTypes = freezed,Object? collegeCategories = freezed,Object? companyType = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? certifications = freezed,Object? workAchievements = freezed,Object? amenitiesRequired = freezed,Object? benefits = freezed,Object? tags = freezed,Object? toolsAndPlatforms = freezed,Object? workLocation = freezed,Object? numberOfStudent = freezed,Object? packageDetails = freezed,Object? contactPerson = freezed,Object? companyPosted = freezed,Object? onlineTestDate = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? expireAt = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_InternshipModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobStatus: freezed == jobStatus ? _self.jobStatus : jobStatus // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,visibleTo: freezed == visibleTo ? _self.visibleTo : visibleTo // ignore: cast_nullable_to_non_nullable
as String?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,minimumStudents: freezed == minimumStudents ? _self.minimumStudents : minimumStudents // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as String?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
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
as InternshipPackageDetails?,contactPerson: freezed == contactPerson ? _self.contactPerson : contactPerson // ignore: cast_nullable_to_non_nullable
as ContactPerson?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as InternshipCompanyPosted?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,expireAt: freezed == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $InternshipPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}/// Create a copy of InternshipModel
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
}/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipCompanyPostedCopyWith<$Res>? get companyPosted {
    if (_self.companyPosted == null) {
    return null;
  }

  return $InternshipCompanyPostedCopyWith<$Res>(_self.companyPosted!, (value) {
    return _then(_self.copyWith(companyPosted: value));
  });
}
}


/// @nodoc
mixin _$InternshipPackageDetails {

 String? get currency; int? get totalCTC; int? get fixedPay; int? get joiningBonus;
/// Create a copy of InternshipPackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipPackageDetailsCopyWith<InternshipPackageDetails> get copyWith => _$InternshipPackageDetailsCopyWithImpl<InternshipPackageDetails>(this as InternshipPackageDetails, _$identity);

  /// Serializes this InternshipPackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipPackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'InternshipPackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class $InternshipPackageDetailsCopyWith<$Res>  {
  factory $InternshipPackageDetailsCopyWith(InternshipPackageDetails value, $Res Function(InternshipPackageDetails) _then) = _$InternshipPackageDetailsCopyWithImpl;
@useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class _$InternshipPackageDetailsCopyWithImpl<$Res>
    implements $InternshipPackageDetailsCopyWith<$Res> {
  _$InternshipPackageDetailsCopyWithImpl(this._self, this._then);

  final InternshipPackageDetails _self;
  final $Res Function(InternshipPackageDetails) _then;

/// Create a copy of InternshipPackageDetails
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


/// Adds pattern-matching-related methods to [InternshipPackageDetails].
extension InternshipPackageDetailsPatterns on InternshipPackageDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternshipPackageDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternshipPackageDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternshipPackageDetails value)  $default,){
final _that = this;
switch (_that) {
case _InternshipPackageDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternshipPackageDetails value)?  $default,){
final _that = this;
switch (_that) {
case _InternshipPackageDetails() when $default != null:
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
case _InternshipPackageDetails() when $default != null:
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
case _InternshipPackageDetails():
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
case _InternshipPackageDetails() when $default != null:
return $default(_that.currency,_that.totalCTC,_that.fixedPay,_that.joiningBonus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipPackageDetails implements InternshipPackageDetails {
  const _InternshipPackageDetails({this.currency, this.totalCTC, this.fixedPay, this.joiningBonus});
  factory _InternshipPackageDetails.fromJson(Map<String, dynamic> json) => _$InternshipPackageDetailsFromJson(json);

@override final  String? currency;
@override final  int? totalCTC;
@override final  int? fixedPay;
@override final  int? joiningBonus;

/// Create a copy of InternshipPackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternshipPackageDetailsCopyWith<_InternshipPackageDetails> get copyWith => __$InternshipPackageDetailsCopyWithImpl<_InternshipPackageDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternshipPackageDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipPackageDetails&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC)&&(identical(other.fixedPay, fixedPay) || other.fixedPay == fixedPay)&&(identical(other.joiningBonus, joiningBonus) || other.joiningBonus == joiningBonus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,totalCTC,fixedPay,joiningBonus);

@override
String toString() {
  return 'InternshipPackageDetails(currency: $currency, totalCTC: $totalCTC, fixedPay: $fixedPay, joiningBonus: $joiningBonus)';
}


}

/// @nodoc
abstract mixin class _$InternshipPackageDetailsCopyWith<$Res> implements $InternshipPackageDetailsCopyWith<$Res> {
  factory _$InternshipPackageDetailsCopyWith(_InternshipPackageDetails value, $Res Function(_InternshipPackageDetails) _then) = __$InternshipPackageDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? currency, int? totalCTC, int? fixedPay, int? joiningBonus
});




}
/// @nodoc
class __$InternshipPackageDetailsCopyWithImpl<$Res>
    implements _$InternshipPackageDetailsCopyWith<$Res> {
  __$InternshipPackageDetailsCopyWithImpl(this._self, this._then);

  final _InternshipPackageDetails _self;
  final $Res Function(_InternshipPackageDetails) _then;

/// Create a copy of InternshipPackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = freezed,Object? totalCTC = freezed,Object? fixedPay = freezed,Object? joiningBonus = freezed,}) {
  return _then(_InternshipPackageDetails(
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
mixin _$InternshipCompanyPosted {

@JsonKey(name: '_id') String? get id; String? get profileImageUrl; String? get backgroundImageUrl; InternshipEmployerDetails? get employerDetails; InternshipCompanyDetails? get companyDetails;
/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipCompanyPostedCopyWith<InternshipCompanyPosted> get copyWith => _$InternshipCompanyPostedCopyWithImpl<InternshipCompanyPosted>(this as InternshipCompanyPosted, _$identity);

  /// Serializes this InternshipCompanyPosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipCompanyPosted&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'InternshipCompanyPosted(id: $id, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class $InternshipCompanyPostedCopyWith<$Res>  {
  factory $InternshipCompanyPostedCopyWith(InternshipCompanyPosted value, $Res Function(InternshipCompanyPosted) _then) = _$InternshipCompanyPostedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? profileImageUrl, String? backgroundImageUrl, InternshipEmployerDetails? employerDetails, InternshipCompanyDetails? companyDetails
});


$InternshipEmployerDetailsCopyWith<$Res>? get employerDetails;$InternshipCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class _$InternshipCompanyPostedCopyWithImpl<$Res>
    implements $InternshipCompanyPostedCopyWith<$Res> {
  _$InternshipCompanyPostedCopyWithImpl(this._self, this._then);

  final InternshipCompanyPosted _self;
  final $Res Function(InternshipCompanyPosted) _then;

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as InternshipEmployerDetails?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as InternshipCompanyDetails?,
  ));
}
/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipEmployerDetailsCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $InternshipEmployerDetailsCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipCompanyDetailsCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $InternshipCompanyDetailsCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [InternshipCompanyPosted].
extension InternshipCompanyPostedPatterns on InternshipCompanyPosted {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternshipCompanyPosted value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternshipCompanyPosted value)  $default,){
final _that = this;
switch (_that) {
case _InternshipCompanyPosted():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternshipCompanyPosted value)?  $default,){
final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  InternshipEmployerDetails? employerDetails,  InternshipCompanyDetails? companyDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  InternshipEmployerDetails? employerDetails,  InternshipCompanyDetails? companyDetails)  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? profileImageUrl,  String? backgroundImageUrl,  InternshipEmployerDetails? employerDetails,  InternshipCompanyDetails? companyDetails)?  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
return $default(_that.id,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipCompanyPosted implements InternshipCompanyPosted {
  const _InternshipCompanyPosted({@JsonKey(name: '_id') this.id, this.profileImageUrl, this.backgroundImageUrl, this.employerDetails, this.companyDetails});
  factory _InternshipCompanyPosted.fromJson(Map<String, dynamic> json) => _$InternshipCompanyPostedFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? profileImageUrl;
@override final  String? backgroundImageUrl;
@override final  InternshipEmployerDetails? employerDetails;
@override final  InternshipCompanyDetails? companyDetails;

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternshipCompanyPostedCopyWith<_InternshipCompanyPosted> get copyWith => __$InternshipCompanyPostedCopyWithImpl<_InternshipCompanyPosted>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternshipCompanyPostedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipCompanyPosted&&(identical(other.id, id) || other.id == id)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'InternshipCompanyPosted(id: $id, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class _$InternshipCompanyPostedCopyWith<$Res> implements $InternshipCompanyPostedCopyWith<$Res> {
  factory _$InternshipCompanyPostedCopyWith(_InternshipCompanyPosted value, $Res Function(_InternshipCompanyPosted) _then) = __$InternshipCompanyPostedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? profileImageUrl, String? backgroundImageUrl, InternshipEmployerDetails? employerDetails, InternshipCompanyDetails? companyDetails
});


@override $InternshipEmployerDetailsCopyWith<$Res>? get employerDetails;@override $InternshipCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class __$InternshipCompanyPostedCopyWithImpl<$Res>
    implements _$InternshipCompanyPostedCopyWith<$Res> {
  __$InternshipCompanyPostedCopyWithImpl(this._self, this._then);

  final _InternshipCompanyPosted _self;
  final $Res Function(_InternshipCompanyPosted) _then;

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_InternshipCompanyPosted(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as InternshipEmployerDetails?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as InternshipCompanyDetails?,
  ));
}

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipEmployerDetailsCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $InternshipEmployerDetailsCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InternshipCompanyDetailsCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $InternshipCompanyDetailsCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}


/// @nodoc
mixin _$InternshipEmployerDetails {

 String? get name; String? get designation; String? get workEmail; String? get mobile; String? get linkedIn;
/// Create a copy of InternshipEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipEmployerDetailsCopyWith<InternshipEmployerDetails> get copyWith => _$InternshipEmployerDetailsCopyWithImpl<InternshipEmployerDetails>(this as InternshipEmployerDetails, _$identity);

  /// Serializes this InternshipEmployerDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipEmployerDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.workEmail, workEmail) || other.workEmail == workEmail)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,workEmail,mobile,linkedIn);

@override
String toString() {
  return 'InternshipEmployerDetails(name: $name, designation: $designation, workEmail: $workEmail, mobile: $mobile, linkedIn: $linkedIn)';
}


}

/// @nodoc
abstract mixin class $InternshipEmployerDetailsCopyWith<$Res>  {
  factory $InternshipEmployerDetailsCopyWith(InternshipEmployerDetails value, $Res Function(InternshipEmployerDetails) _then) = _$InternshipEmployerDetailsCopyWithImpl;
@useResult
$Res call({
 String? name, String? designation, String? workEmail, String? mobile, String? linkedIn
});




}
/// @nodoc
class _$InternshipEmployerDetailsCopyWithImpl<$Res>
    implements $InternshipEmployerDetailsCopyWith<$Res> {
  _$InternshipEmployerDetailsCopyWithImpl(this._self, this._then);

  final InternshipEmployerDetails _self;
  final $Res Function(InternshipEmployerDetails) _then;

/// Create a copy of InternshipEmployerDetails
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


/// Adds pattern-matching-related methods to [InternshipEmployerDetails].
extension InternshipEmployerDetailsPatterns on InternshipEmployerDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternshipEmployerDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternshipEmployerDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternshipEmployerDetails value)  $default,){
final _that = this;
switch (_that) {
case _InternshipEmployerDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternshipEmployerDetails value)?  $default,){
final _that = this;
switch (_that) {
case _InternshipEmployerDetails() when $default != null:
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
case _InternshipEmployerDetails() when $default != null:
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
case _InternshipEmployerDetails():
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
case _InternshipEmployerDetails() when $default != null:
return $default(_that.name,_that.designation,_that.workEmail,_that.mobile,_that.linkedIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipEmployerDetails implements InternshipEmployerDetails {
  const _InternshipEmployerDetails({this.name, this.designation, this.workEmail, this.mobile, this.linkedIn});
  factory _InternshipEmployerDetails.fromJson(Map<String, dynamic> json) => _$InternshipEmployerDetailsFromJson(json);

@override final  String? name;
@override final  String? designation;
@override final  String? workEmail;
@override final  String? mobile;
@override final  String? linkedIn;

/// Create a copy of InternshipEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternshipEmployerDetailsCopyWith<_InternshipEmployerDetails> get copyWith => __$InternshipEmployerDetailsCopyWithImpl<_InternshipEmployerDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternshipEmployerDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipEmployerDetails&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.workEmail, workEmail) || other.workEmail == workEmail)&&(identical(other.mobile, mobile) || other.mobile == mobile)&&(identical(other.linkedIn, linkedIn) || other.linkedIn == linkedIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,workEmail,mobile,linkedIn);

@override
String toString() {
  return 'InternshipEmployerDetails(name: $name, designation: $designation, workEmail: $workEmail, mobile: $mobile, linkedIn: $linkedIn)';
}


}

/// @nodoc
abstract mixin class _$InternshipEmployerDetailsCopyWith<$Res> implements $InternshipEmployerDetailsCopyWith<$Res> {
  factory _$InternshipEmployerDetailsCopyWith(_InternshipEmployerDetails value, $Res Function(_InternshipEmployerDetails) _then) = __$InternshipEmployerDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? designation, String? workEmail, String? mobile, String? linkedIn
});




}
/// @nodoc
class __$InternshipEmployerDetailsCopyWithImpl<$Res>
    implements _$InternshipEmployerDetailsCopyWith<$Res> {
  __$InternshipEmployerDetailsCopyWithImpl(this._self, this._then);

  final _InternshipEmployerDetails _self;
  final $Res Function(_InternshipEmployerDetails) _then;

/// Create a copy of InternshipEmployerDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? designation = freezed,Object? workEmail = freezed,Object? mobile = freezed,Object? linkedIn = freezed,}) {
  return _then(_InternshipEmployerDetails(
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
mixin _$InternshipCompanyDetails {

 String? get companyName; String? get description; String? get companyType; String? get industryType; String? get numberOfEmployees; String? get establishedYear; String? get websiteUrl; String? get companyLinkedin; String? get linkedinUrl; String? get phoneNumber; String? get alternatePhoneNumber; String? get state; String? get city; String? get country; String? get pincode;
/// Create a copy of InternshipCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipCompanyDetailsCopyWith<InternshipCompanyDetails> get copyWith => _$InternshipCompanyDetailsCopyWithImpl<InternshipCompanyDetails>(this as InternshipCompanyDetails, _$identity);

  /// Serializes this InternshipCompanyDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.industryType, industryType) || other.industryType == industryType)&&(identical(other.numberOfEmployees, numberOfEmployees) || other.numberOfEmployees == numberOfEmployees)&&(identical(other.establishedYear, establishedYear) || other.establishedYear == establishedYear)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.companyLinkedin, companyLinkedin) || other.companyLinkedin == companyLinkedin)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.pincode, pincode) || other.pincode == pincode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,description,companyType,industryType,numberOfEmployees,establishedYear,websiteUrl,companyLinkedin,linkedinUrl,phoneNumber,alternatePhoneNumber,state,city,country,pincode);

@override
String toString() {
  return 'InternshipCompanyDetails(companyName: $companyName, description: $description, companyType: $companyType, industryType: $industryType, numberOfEmployees: $numberOfEmployees, establishedYear: $establishedYear, websiteUrl: $websiteUrl, companyLinkedin: $companyLinkedin, linkedinUrl: $linkedinUrl, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, state: $state, city: $city, country: $country, pincode: $pincode)';
}


}

/// @nodoc
abstract mixin class $InternshipCompanyDetailsCopyWith<$Res>  {
  factory $InternshipCompanyDetailsCopyWith(InternshipCompanyDetails value, $Res Function(InternshipCompanyDetails) _then) = _$InternshipCompanyDetailsCopyWithImpl;
@useResult
$Res call({
 String? companyName, String? description, String? companyType, String? industryType, String? numberOfEmployees, String? establishedYear, String? websiteUrl, String? companyLinkedin, String? linkedinUrl, String? phoneNumber, String? alternatePhoneNumber, String? state, String? city, String? country, String? pincode
});




}
/// @nodoc
class _$InternshipCompanyDetailsCopyWithImpl<$Res>
    implements $InternshipCompanyDetailsCopyWith<$Res> {
  _$InternshipCompanyDetailsCopyWithImpl(this._self, this._then);

  final InternshipCompanyDetails _self;
  final $Res Function(InternshipCompanyDetails) _then;

/// Create a copy of InternshipCompanyDetails
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


/// Adds pattern-matching-related methods to [InternshipCompanyDetails].
extension InternshipCompanyDetailsPatterns on InternshipCompanyDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InternshipCompanyDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InternshipCompanyDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InternshipCompanyDetails value)  $default,){
final _that = this;
switch (_that) {
case _InternshipCompanyDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InternshipCompanyDetails value)?  $default,){
final _that = this;
switch (_that) {
case _InternshipCompanyDetails() when $default != null:
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
case _InternshipCompanyDetails() when $default != null:
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
case _InternshipCompanyDetails():
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
case _InternshipCompanyDetails() when $default != null:
return $default(_that.companyName,_that.description,_that.companyType,_that.industryType,_that.numberOfEmployees,_that.establishedYear,_that.websiteUrl,_that.companyLinkedin,_that.linkedinUrl,_that.phoneNumber,_that.alternatePhoneNumber,_that.state,_that.city,_that.country,_that.pincode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipCompanyDetails implements InternshipCompanyDetails {
  const _InternshipCompanyDetails({this.companyName, this.description, this.companyType, this.industryType, this.numberOfEmployees, this.establishedYear, this.websiteUrl, this.companyLinkedin, this.linkedinUrl, this.phoneNumber, this.alternatePhoneNumber, this.state, this.city, this.country, this.pincode});
  factory _InternshipCompanyDetails.fromJson(Map<String, dynamic> json) => _$InternshipCompanyDetailsFromJson(json);

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

/// Create a copy of InternshipCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InternshipCompanyDetailsCopyWith<_InternshipCompanyDetails> get copyWith => __$InternshipCompanyDetailsCopyWithImpl<_InternshipCompanyDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InternshipCompanyDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.description, description) || other.description == description)&&(identical(other.companyType, companyType) || other.companyType == companyType)&&(identical(other.industryType, industryType) || other.industryType == industryType)&&(identical(other.numberOfEmployees, numberOfEmployees) || other.numberOfEmployees == numberOfEmployees)&&(identical(other.establishedYear, establishedYear) || other.establishedYear == establishedYear)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.companyLinkedin, companyLinkedin) || other.companyLinkedin == companyLinkedin)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.alternatePhoneNumber, alternatePhoneNumber) || other.alternatePhoneNumber == alternatePhoneNumber)&&(identical(other.state, state) || other.state == state)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.pincode, pincode) || other.pincode == pincode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,description,companyType,industryType,numberOfEmployees,establishedYear,websiteUrl,companyLinkedin,linkedinUrl,phoneNumber,alternatePhoneNumber,state,city,country,pincode);

@override
String toString() {
  return 'InternshipCompanyDetails(companyName: $companyName, description: $description, companyType: $companyType, industryType: $industryType, numberOfEmployees: $numberOfEmployees, establishedYear: $establishedYear, websiteUrl: $websiteUrl, companyLinkedin: $companyLinkedin, linkedinUrl: $linkedinUrl, phoneNumber: $phoneNumber, alternatePhoneNumber: $alternatePhoneNumber, state: $state, city: $city, country: $country, pincode: $pincode)';
}


}

/// @nodoc
abstract mixin class _$InternshipCompanyDetailsCopyWith<$Res> implements $InternshipCompanyDetailsCopyWith<$Res> {
  factory _$InternshipCompanyDetailsCopyWith(_InternshipCompanyDetails value, $Res Function(_InternshipCompanyDetails) _then) = __$InternshipCompanyDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? companyName, String? description, String? companyType, String? industryType, String? numberOfEmployees, String? establishedYear, String? websiteUrl, String? companyLinkedin, String? linkedinUrl, String? phoneNumber, String? alternatePhoneNumber, String? state, String? city, String? country, String? pincode
});




}
/// @nodoc
class __$InternshipCompanyDetailsCopyWithImpl<$Res>
    implements _$InternshipCompanyDetailsCopyWith<$Res> {
  __$InternshipCompanyDetailsCopyWithImpl(this._self, this._then);

  final _InternshipCompanyDetails _self;
  final $Res Function(_InternshipCompanyDetails) _then;

/// Create a copy of InternshipCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? description = freezed,Object? companyType = freezed,Object? industryType = freezed,Object? numberOfEmployees = freezed,Object? establishedYear = freezed,Object? websiteUrl = freezed,Object? companyLinkedin = freezed,Object? linkedinUrl = freezed,Object? phoneNumber = freezed,Object? alternatePhoneNumber = freezed,Object? state = freezed,Object? city = freezed,Object? country = freezed,Object? pincode = freezed,}) {
  return _then(_InternshipCompanyDetails(
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
