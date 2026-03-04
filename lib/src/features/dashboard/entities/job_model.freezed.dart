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

@JsonKey(name: '_id') String? get id; String? get description; String? get jobTitle; List<String>? get skills; List<String>? get workMode; List<String>? get location; List<String>? get jobRoles; List<String>? get degree; List<String>? get employmentType; List<String>? get studentStreams; String? get eligibilityCriteria; List<String>? get benefits; List<String>? get tags; int? get cgpa; int? get numberOfOpenings; InterviewWindow? get interviewWindow; DateTime? get onlineTestDate; DateTime? get offerRolloutDate; JobPackageDetails? get packageDetails; String? get companyName;
/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobModelCopyWith<JobModel> get copyWith => _$JobModelCopyWithImpl<JobModel>(this as JobModel, _$identity);

  /// Serializes this JobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&const DeepCollectionEquality().equals(other.degree, degree)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,description,jobTitle,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(jobRoles),const DeepCollectionEquality().hash(degree),const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(studentStreams),eligibilityCriteria,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),cgpa,numberOfOpenings,interviewWindow,onlineTestDate,offerRolloutDate,packageDetails,companyName]);

@override
String toString() {
  return 'JobModel(id: $id, description: $description, jobTitle: $jobTitle, skills: $skills, workMode: $workMode, location: $location, jobRoles: $jobRoles, degree: $degree, employmentType: $employmentType, studentStreams: $studentStreams, eligibilityCriteria: $eligibilityCriteria, benefits: $benefits, tags: $tags, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, interviewWindow: $interviewWindow, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, packageDetails: $packageDetails, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class $JobModelCopyWith<$Res>  {
  factory $JobModelCopyWith(JobModel value, $Res Function(JobModel) _then) = _$JobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, String? jobTitle, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? jobRoles, List<String>? degree, List<String>? employmentType, List<String>? studentStreams, String? eligibilityCriteria, List<String>? benefits, List<String>? tags, int? cgpa, int? numberOfOpenings, InterviewWindow? interviewWindow, DateTime? onlineTestDate, DateTime? offerRolloutDate, JobPackageDetails? packageDetails, String? companyName
});


$InterviewWindowCopyWith<$Res>? get interviewWindow;$JobPackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class _$JobModelCopyWithImpl<$Res>
    implements $JobModelCopyWith<$Res> {
  _$JobModelCopyWithImpl(this._self, this._then);

  final JobModel _self;
  final $Res Function(JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? description = freezed,Object? jobTitle = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? jobRoles = freezed,Object? degree = freezed,Object? employmentType = freezed,Object? studentStreams = freezed,Object? eligibilityCriteria = freezed,Object? benefits = freezed,Object? tags = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? interviewWindow = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? packageDetails = freezed,Object? companyName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as int?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as InterviewWindow?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as JobPackageDetails?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of JobModel
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
$JobPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $JobPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobTitle,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  List<String>? degree,  List<String>? employmentType,  List<String>? studentStreams,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? cgpa,  int? numberOfOpenings,  InterviewWindow? interviewWindow,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  JobPackageDetails? packageDetails,  String? companyName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.description,_that.jobTitle,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.degree,_that.employmentType,_that.studentStreams,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.cgpa,_that.numberOfOpenings,_that.interviewWindow,_that.onlineTestDate,_that.offerRolloutDate,_that.packageDetails,_that.companyName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobTitle,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  List<String>? degree,  List<String>? employmentType,  List<String>? studentStreams,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? cgpa,  int? numberOfOpenings,  InterviewWindow? interviewWindow,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  JobPackageDetails? packageDetails,  String? companyName)  $default,) {final _that = this;
switch (_that) {
case _JobModel():
return $default(_that.id,_that.description,_that.jobTitle,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.degree,_that.employmentType,_that.studentStreams,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.cgpa,_that.numberOfOpenings,_that.interviewWindow,_that.onlineTestDate,_that.offerRolloutDate,_that.packageDetails,_that.companyName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? description,  String? jobTitle,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  List<String>? degree,  List<String>? employmentType,  List<String>? studentStreams,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? cgpa,  int? numberOfOpenings,  InterviewWindow? interviewWindow,  DateTime? onlineTestDate,  DateTime? offerRolloutDate,  JobPackageDetails? packageDetails,  String? companyName)?  $default,) {final _that = this;
switch (_that) {
case _JobModel() when $default != null:
return $default(_that.id,_that.description,_that.jobTitle,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.degree,_that.employmentType,_that.studentStreams,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.cgpa,_that.numberOfOpenings,_that.interviewWindow,_that.onlineTestDate,_that.offerRolloutDate,_that.packageDetails,_that.companyName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobModel implements JobModel {
  const _JobModel({@JsonKey(name: '_id') this.id, this.description, this.jobTitle, final  List<String>? skills, final  List<String>? workMode, final  List<String>? location, final  List<String>? jobRoles, final  List<String>? degree, final  List<String>? employmentType, final  List<String>? studentStreams, this.eligibilityCriteria, final  List<String>? benefits, final  List<String>? tags, this.cgpa, this.numberOfOpenings, this.interviewWindow, this.onlineTestDate, this.offerRolloutDate, this.packageDetails, this.companyName}): _skills = skills,_workMode = workMode,_location = location,_jobRoles = jobRoles,_degree = degree,_employmentType = employmentType,_studentStreams = studentStreams,_benefits = benefits,_tags = tags;
  factory _JobModel.fromJson(Map<String, dynamic> json) => _$JobModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? description;
@override final  String? jobTitle;
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

 final  List<String>? _jobRoles;
@override List<String>? get jobRoles {
  final value = _jobRoles;
  if (value == null) return null;
  if (_jobRoles is EqualUnmodifiableListView) return _jobRoles;
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

 final  List<String>? _employmentType;
@override List<String>? get employmentType {
  final value = _employmentType;
  if (value == null) return null;
  if (_employmentType is EqualUnmodifiableListView) return _employmentType;
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

@override final  String? eligibilityCriteria;
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

@override final  int? cgpa;
@override final  int? numberOfOpenings;
@override final  InterviewWindow? interviewWindow;
@override final  DateTime? onlineTestDate;
@override final  DateTime? offerRolloutDate;
@override final  JobPackageDetails? packageDetails;
@override final  String? companyName;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&const DeepCollectionEquality().equals(other._degree, _degree)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.interviewWindow, interviewWindow) || other.interviewWindow == interviewWindow)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.offerRolloutDate, offerRolloutDate) || other.offerRolloutDate == offerRolloutDate)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,description,jobTitle,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_jobRoles),const DeepCollectionEquality().hash(_degree),const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_studentStreams),eligibilityCriteria,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),cgpa,numberOfOpenings,interviewWindow,onlineTestDate,offerRolloutDate,packageDetails,companyName]);

@override
String toString() {
  return 'JobModel(id: $id, description: $description, jobTitle: $jobTitle, skills: $skills, workMode: $workMode, location: $location, jobRoles: $jobRoles, degree: $degree, employmentType: $employmentType, studentStreams: $studentStreams, eligibilityCriteria: $eligibilityCriteria, benefits: $benefits, tags: $tags, cgpa: $cgpa, numberOfOpenings: $numberOfOpenings, interviewWindow: $interviewWindow, onlineTestDate: $onlineTestDate, offerRolloutDate: $offerRolloutDate, packageDetails: $packageDetails, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class _$JobModelCopyWith<$Res> implements $JobModelCopyWith<$Res> {
  factory _$JobModelCopyWith(_JobModel value, $Res Function(_JobModel) _then) = __$JobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, String? jobTitle, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? jobRoles, List<String>? degree, List<String>? employmentType, List<String>? studentStreams, String? eligibilityCriteria, List<String>? benefits, List<String>? tags, int? cgpa, int? numberOfOpenings, InterviewWindow? interviewWindow, DateTime? onlineTestDate, DateTime? offerRolloutDate, JobPackageDetails? packageDetails, String? companyName
});


@override $InterviewWindowCopyWith<$Res>? get interviewWindow;@override $JobPackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class __$JobModelCopyWithImpl<$Res>
    implements _$JobModelCopyWith<$Res> {
  __$JobModelCopyWithImpl(this._self, this._then);

  final _JobModel _self;
  final $Res Function(_JobModel) _then;

/// Create a copy of JobModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? description = freezed,Object? jobTitle = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? jobRoles = freezed,Object? degree = freezed,Object? employmentType = freezed,Object? studentStreams = freezed,Object? eligibilityCriteria = freezed,Object? benefits = freezed,Object? tags = freezed,Object? cgpa = freezed,Object? numberOfOpenings = freezed,Object? interviewWindow = freezed,Object? onlineTestDate = freezed,Object? offerRolloutDate = freezed,Object? packageDetails = freezed,Object? companyName = freezed,}) {
  return _then(_JobModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,degree: freezed == degree ? _self._degree : degree // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as int?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,interviewWindow: freezed == interviewWindow ? _self.interviewWindow : interviewWindow // ignore: cast_nullable_to_non_nullable
as InterviewWindow?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,offerRolloutDate: freezed == offerRolloutDate ? _self.offerRolloutDate : offerRolloutDate // ignore: cast_nullable_to_non_nullable
as DateTime?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as JobPackageDetails?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of JobModel
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
$JobPackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $JobPackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
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

 int? get totalCTC;
/// Create a copy of JobPackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPackageDetailsCopyWith<JobPackageDetails> get copyWith => _$JobPackageDetailsCopyWithImpl<JobPackageDetails>(this as JobPackageDetails, _$identity);

  /// Serializes this JobPackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPackageDetails&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCTC);

@override
String toString() {
  return 'JobPackageDetails(totalCTC: $totalCTC)';
}


}

/// @nodoc
abstract mixin class $JobPackageDetailsCopyWith<$Res>  {
  factory $JobPackageDetailsCopyWith(JobPackageDetails value, $Res Function(JobPackageDetails) _then) = _$JobPackageDetailsCopyWithImpl;
@useResult
$Res call({
 int? totalCTC
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalCTC = freezed,}) {
  return _then(_self.copyWith(
totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalCTC)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPackageDetails() when $default != null:
return $default(_that.totalCTC);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? totalCTC)  $default,) {final _that = this;
switch (_that) {
case _JobPackageDetails():
return $default(_that.totalCTC);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? totalCTC)?  $default,) {final _that = this;
switch (_that) {
case _JobPackageDetails() when $default != null:
return $default(_that.totalCTC);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPackageDetails implements JobPackageDetails {
  const _JobPackageDetails({this.totalCTC});
  factory _JobPackageDetails.fromJson(Map<String, dynamic> json) => _$JobPackageDetailsFromJson(json);

@override final  int? totalCTC;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPackageDetails&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCTC);

@override
String toString() {
  return 'JobPackageDetails(totalCTC: $totalCTC)';
}


}

/// @nodoc
abstract mixin class _$JobPackageDetailsCopyWith<$Res> implements $JobPackageDetailsCopyWith<$Res> {
  factory _$JobPackageDetailsCopyWith(_JobPackageDetails value, $Res Function(_JobPackageDetails) _then) = __$JobPackageDetailsCopyWithImpl;
@override @useResult
$Res call({
 int? totalCTC
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalCTC = freezed,}) {
  return _then(_JobPackageDetails(
totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
