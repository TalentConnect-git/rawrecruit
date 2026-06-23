// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral_post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralPostModel {

@JsonKey(name: '_id') String? get id; List<String>? get jobTitle; String? get description; String? get approvalStatus; List<String>? get employmentType; List<String>? get workMode; String? get broadcastType; String? get jobType; List<String>? get location; String? get minEducation; int? get numberOfOpenings; PackageDetails? get packageDetails; List<String>? get skills; List<String>? get studentStreams; List<String>? get tags; String? get workAuthorization; String? get yearsOfExperience; String? get minYearofExperience; List<String>? get rounds; List<String>? get selectionProcess; bool? get isAskForReferral; String? get endDate; bool? get inactive; List<String>? get benefits; List<String>? get certifications; String? get eligibilityCriteria; Metrics? get metrics;
/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralPostModelCopyWith<ReferralPostModel> get copyWith => _$ReferralPostModelCopyWithImpl<ReferralPostModel>(this as ReferralPostModel, _$identity);

  /// Serializes this ReferralPostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralPostModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.jobTitle, jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.minYearofExperience, minYearofExperience) || other.minYearofExperience == minYearofExperience)&&const DeepCollectionEquality().equals(other.rounds, rounds)&&const DeepCollectionEquality().equals(other.selectionProcess, selectionProcess)&&(identical(other.isAskForReferral, isAskForReferral) || other.isAskForReferral == isAskForReferral)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.inactive, inactive) || other.inactive == inactive)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.metrics, metrics) || other.metrics == metrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(jobTitle),description,approvalStatus,const DeepCollectionEquality().hash(employmentType),const DeepCollectionEquality().hash(workMode),broadcastType,jobType,const DeepCollectionEquality().hash(location),minEducation,numberOfOpenings,packageDetails,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(tags),workAuthorization,yearsOfExperience,minYearofExperience,const DeepCollectionEquality().hash(rounds),const DeepCollectionEquality().hash(selectionProcess),isAskForReferral,endDate,inactive,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(certifications),eligibilityCriteria,metrics]);

@override
String toString() {
  return 'ReferralPostModel(id: $id, jobTitle: $jobTitle, description: $description, approvalStatus: $approvalStatus, employmentType: $employmentType, workMode: $workMode, broadcastType: $broadcastType, jobType: $jobType, location: $location, minEducation: $minEducation, numberOfOpenings: $numberOfOpenings, packageDetails: $packageDetails, skills: $skills, studentStreams: $studentStreams, tags: $tags, workAuthorization: $workAuthorization, yearsOfExperience: $yearsOfExperience, minYearofExperience: $minYearofExperience, rounds: $rounds, selectionProcess: $selectionProcess, isAskForReferral: $isAskForReferral, endDate: $endDate, inactive: $inactive, benefits: $benefits, certifications: $certifications, eligibilityCriteria: $eligibilityCriteria, metrics: $metrics)';
}


}

/// @nodoc
abstract mixin class $ReferralPostModelCopyWith<$Res>  {
  factory $ReferralPostModelCopyWith(ReferralPostModel value, $Res Function(ReferralPostModel) _then) = _$ReferralPostModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, List<String>? jobTitle, String? description, String? approvalStatus, List<String>? employmentType, List<String>? workMode, String? broadcastType, String? jobType, List<String>? location, String? minEducation, int? numberOfOpenings, PackageDetails? packageDetails, List<String>? skills, List<String>? studentStreams, List<String>? tags, String? workAuthorization, String? yearsOfExperience, String? minYearofExperience, List<String>? rounds, List<String>? selectionProcess, bool? isAskForReferral, String? endDate, bool? inactive, List<String>? benefits, List<String>? certifications, String? eligibilityCriteria, Metrics? metrics
});


$PackageDetailsCopyWith<$Res>? get packageDetails;$MetricsCopyWith<$Res>? get metrics;

}
/// @nodoc
class _$ReferralPostModelCopyWithImpl<$Res>
    implements $ReferralPostModelCopyWith<$Res> {
  _$ReferralPostModelCopyWithImpl(this._self, this._then);

  final ReferralPostModel _self;
  final $Res Function(ReferralPostModel) _then;

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? approvalStatus = freezed,Object? employmentType = freezed,Object? workMode = freezed,Object? broadcastType = freezed,Object? jobType = freezed,Object? location = freezed,Object? minEducation = freezed,Object? numberOfOpenings = freezed,Object? packageDetails = freezed,Object? skills = freezed,Object? studentStreams = freezed,Object? tags = freezed,Object? workAuthorization = freezed,Object? yearsOfExperience = freezed,Object? minYearofExperience = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? isAskForReferral = freezed,Object? endDate = freezed,Object? inactive = freezed,Object? benefits = freezed,Object? certifications = freezed,Object? eligibilityCriteria = freezed,Object? metrics = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,minYearofExperience: freezed == minYearofExperience ? _self.minYearofExperience : minYearofExperience // ignore: cast_nullable_to_non_nullable
as String?,rounds: freezed == rounds ? _self.rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self.selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,isAskForReferral: freezed == isAskForReferral ? _self.isAskForReferral : isAskForReferral // ignore: cast_nullable_to_non_nullable
as bool?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,inactive: freezed == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as bool?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as Metrics?,
  ));
}
/// Create a copy of ReferralPostModel
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
}/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsCopyWith<$Res>? get metrics {
    if (_self.metrics == null) {
    return null;
  }

  return $MetricsCopyWith<$Res>(_self.metrics!, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReferralPostModel].
extension ReferralPostModelPatterns on ReferralPostModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralPostModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralPostModel value)  $default,){
final _that = this;
switch (_that) {
case _ReferralPostModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralPostModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  List<String>? jobTitle,  String? description,  String? approvalStatus,  List<String>? employmentType,  List<String>? workMode,  String? broadcastType,  String? jobType,  List<String>? location,  String? minEducation,  int? numberOfOpenings,  PackageDetails? packageDetails,  List<String>? skills,  List<String>? studentStreams,  List<String>? tags,  String? workAuthorization,  String? yearsOfExperience,  String? minYearofExperience,  List<String>? rounds,  List<String>? selectionProcess,  bool? isAskForReferral,  String? endDate,  bool? inactive,  List<String>? benefits,  List<String>? certifications,  String? eligibilityCriteria,  Metrics? metrics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.approvalStatus,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.minYearofExperience,_that.rounds,_that.selectionProcess,_that.isAskForReferral,_that.endDate,_that.inactive,_that.benefits,_that.certifications,_that.eligibilityCriteria,_that.metrics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  List<String>? jobTitle,  String? description,  String? approvalStatus,  List<String>? employmentType,  List<String>? workMode,  String? broadcastType,  String? jobType,  List<String>? location,  String? minEducation,  int? numberOfOpenings,  PackageDetails? packageDetails,  List<String>? skills,  List<String>? studentStreams,  List<String>? tags,  String? workAuthorization,  String? yearsOfExperience,  String? minYearofExperience,  List<String>? rounds,  List<String>? selectionProcess,  bool? isAskForReferral,  String? endDate,  bool? inactive,  List<String>? benefits,  List<String>? certifications,  String? eligibilityCriteria,  Metrics? metrics)  $default,) {final _that = this;
switch (_that) {
case _ReferralPostModel():
return $default(_that.id,_that.jobTitle,_that.description,_that.approvalStatus,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.minYearofExperience,_that.rounds,_that.selectionProcess,_that.isAskForReferral,_that.endDate,_that.inactive,_that.benefits,_that.certifications,_that.eligibilityCriteria,_that.metrics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  List<String>? jobTitle,  String? description,  String? approvalStatus,  List<String>? employmentType,  List<String>? workMode,  String? broadcastType,  String? jobType,  List<String>? location,  String? minEducation,  int? numberOfOpenings,  PackageDetails? packageDetails,  List<String>? skills,  List<String>? studentStreams,  List<String>? tags,  String? workAuthorization,  String? yearsOfExperience,  String? minYearofExperience,  List<String>? rounds,  List<String>? selectionProcess,  bool? isAskForReferral,  String? endDate,  bool? inactive,  List<String>? benefits,  List<String>? certifications,  String? eligibilityCriteria,  Metrics? metrics)?  $default,) {final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
return $default(_that.id,_that.jobTitle,_that.description,_that.approvalStatus,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.minYearofExperience,_that.rounds,_that.selectionProcess,_that.isAskForReferral,_that.endDate,_that.inactive,_that.benefits,_that.certifications,_that.eligibilityCriteria,_that.metrics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralPostModel implements ReferralPostModel {
  const _ReferralPostModel({@JsonKey(name: '_id') this.id, final  List<String>? jobTitle, this.description, this.approvalStatus, final  List<String>? employmentType, final  List<String>? workMode, this.broadcastType, this.jobType, final  List<String>? location, this.minEducation, this.numberOfOpenings, this.packageDetails, final  List<String>? skills, final  List<String>? studentStreams, final  List<String>? tags, this.workAuthorization, this.yearsOfExperience, this.minYearofExperience, final  List<String>? rounds, final  List<String>? selectionProcess, this.isAskForReferral, this.endDate, this.inactive, final  List<String>? benefits, final  List<String>? certifications, this.eligibilityCriteria, this.metrics}): _jobTitle = jobTitle,_employmentType = employmentType,_workMode = workMode,_location = location,_skills = skills,_studentStreams = studentStreams,_tags = tags,_rounds = rounds,_selectionProcess = selectionProcess,_benefits = benefits,_certifications = certifications;
  factory _ReferralPostModel.fromJson(Map<String, dynamic> json) => _$ReferralPostModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
 final  List<String>? _jobTitle;
@override List<String>? get jobTitle {
  final value = _jobTitle;
  if (value == null) return null;
  if (_jobTitle is EqualUnmodifiableListView) return _jobTitle;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? description;
@override final  String? approvalStatus;
 final  List<String>? _employmentType;
@override List<String>? get employmentType {
  final value = _employmentType;
  if (value == null) return null;
  if (_employmentType is EqualUnmodifiableListView) return _employmentType;
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

@override final  String? broadcastType;
@override final  String? jobType;
 final  List<String>? _location;
@override List<String>? get location {
  final value = _location;
  if (value == null) return null;
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? minEducation;
@override final  int? numberOfOpenings;
@override final  PackageDetails? packageDetails;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
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

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? workAuthorization;
@override final  String? yearsOfExperience;
@override final  String? minYearofExperience;
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

@override final  bool? isAskForReferral;
@override final  String? endDate;
@override final  bool? inactive;
 final  List<String>? _benefits;
@override List<String>? get benefits {
  final value = _benefits;
  if (value == null) return null;
  if (_benefits is EqualUnmodifiableListView) return _benefits;
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

@override final  String? eligibilityCriteria;
@override final  Metrics? metrics;

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralPostModelCopyWith<_ReferralPostModel> get copyWith => __$ReferralPostModelCopyWithImpl<_ReferralPostModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralPostModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralPostModel&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._jobTitle, _jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&(identical(other.minYearofExperience, minYearofExperience) || other.minYearofExperience == minYearofExperience)&&const DeepCollectionEquality().equals(other._rounds, _rounds)&&const DeepCollectionEquality().equals(other._selectionProcess, _selectionProcess)&&(identical(other.isAskForReferral, isAskForReferral) || other.isAskForReferral == isAskForReferral)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.inactive, inactive) || other.inactive == inactive)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.metrics, metrics) || other.metrics == metrics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,const DeepCollectionEquality().hash(_jobTitle),description,approvalStatus,const DeepCollectionEquality().hash(_employmentType),const DeepCollectionEquality().hash(_workMode),broadcastType,jobType,const DeepCollectionEquality().hash(_location),minEducation,numberOfOpenings,packageDetails,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_tags),workAuthorization,yearsOfExperience,minYearofExperience,const DeepCollectionEquality().hash(_rounds),const DeepCollectionEquality().hash(_selectionProcess),isAskForReferral,endDate,inactive,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_certifications),eligibilityCriteria,metrics]);

@override
String toString() {
  return 'ReferralPostModel(id: $id, jobTitle: $jobTitle, description: $description, approvalStatus: $approvalStatus, employmentType: $employmentType, workMode: $workMode, broadcastType: $broadcastType, jobType: $jobType, location: $location, minEducation: $minEducation, numberOfOpenings: $numberOfOpenings, packageDetails: $packageDetails, skills: $skills, studentStreams: $studentStreams, tags: $tags, workAuthorization: $workAuthorization, yearsOfExperience: $yearsOfExperience, minYearofExperience: $minYearofExperience, rounds: $rounds, selectionProcess: $selectionProcess, isAskForReferral: $isAskForReferral, endDate: $endDate, inactive: $inactive, benefits: $benefits, certifications: $certifications, eligibilityCriteria: $eligibilityCriteria, metrics: $metrics)';
}


}

/// @nodoc
abstract mixin class _$ReferralPostModelCopyWith<$Res> implements $ReferralPostModelCopyWith<$Res> {
  factory _$ReferralPostModelCopyWith(_ReferralPostModel value, $Res Function(_ReferralPostModel) _then) = __$ReferralPostModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, List<String>? jobTitle, String? description, String? approvalStatus, List<String>? employmentType, List<String>? workMode, String? broadcastType, String? jobType, List<String>? location, String? minEducation, int? numberOfOpenings, PackageDetails? packageDetails, List<String>? skills, List<String>? studentStreams, List<String>? tags, String? workAuthorization, String? yearsOfExperience, String? minYearofExperience, List<String>? rounds, List<String>? selectionProcess, bool? isAskForReferral, String? endDate, bool? inactive, List<String>? benefits, List<String>? certifications, String? eligibilityCriteria, Metrics? metrics
});


@override $PackageDetailsCopyWith<$Res>? get packageDetails;@override $MetricsCopyWith<$Res>? get metrics;

}
/// @nodoc
class __$ReferralPostModelCopyWithImpl<$Res>
    implements _$ReferralPostModelCopyWith<$Res> {
  __$ReferralPostModelCopyWithImpl(this._self, this._then);

  final _ReferralPostModel _self;
  final $Res Function(_ReferralPostModel) _then;

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobTitle = freezed,Object? description = freezed,Object? approvalStatus = freezed,Object? employmentType = freezed,Object? workMode = freezed,Object? broadcastType = freezed,Object? jobType = freezed,Object? location = freezed,Object? minEducation = freezed,Object? numberOfOpenings = freezed,Object? packageDetails = freezed,Object? skills = freezed,Object? studentStreams = freezed,Object? tags = freezed,Object? workAuthorization = freezed,Object? yearsOfExperience = freezed,Object? minYearofExperience = freezed,Object? rounds = freezed,Object? selectionProcess = freezed,Object? isAskForReferral = freezed,Object? endDate = freezed,Object? inactive = freezed,Object? benefits = freezed,Object? certifications = freezed,Object? eligibilityCriteria = freezed,Object? metrics = freezed,}) {
  return _then(_ReferralPostModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self._jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,broadcastType: freezed == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,studentStreams: freezed == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,minYearofExperience: freezed == minYearofExperience ? _self.minYearofExperience : minYearofExperience // ignore: cast_nullable_to_non_nullable
as String?,rounds: freezed == rounds ? _self._rounds : rounds // ignore: cast_nullable_to_non_nullable
as List<String>?,selectionProcess: freezed == selectionProcess ? _self._selectionProcess : selectionProcess // ignore: cast_nullable_to_non_nullable
as List<String>?,isAskForReferral: freezed == isAskForReferral ? _self.isAskForReferral : isAskForReferral // ignore: cast_nullable_to_non_nullable
as bool?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,inactive: freezed == inactive ? _self.inactive : inactive // ignore: cast_nullable_to_non_nullable
as bool?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,certifications: freezed == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,metrics: freezed == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as Metrics?,
  ));
}

/// Create a copy of ReferralPostModel
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
}/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetricsCopyWith<$Res>? get metrics {
    if (_self.metrics == null) {
    return null;
  }

  return $MetricsCopyWith<$Res>(_self.metrics!, (value) {
    return _then(_self.copyWith(metrics: value));
  });
}
}


/// @nodoc
mixin _$Metrics {

 int? get totalApplicationsReceived; int? get totalReferredToCompany; int? get totalAcceptedByCompany; int? get totalInterviewScheduled; int? get responseRate; int? get referralSuccessRate;
/// Create a copy of Metrics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsCopyWith<Metrics> get copyWith => _$MetricsCopyWithImpl<Metrics>(this as Metrics, _$identity);

  /// Serializes this Metrics to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metrics&&(identical(other.totalApplicationsReceived, totalApplicationsReceived) || other.totalApplicationsReceived == totalApplicationsReceived)&&(identical(other.totalReferredToCompany, totalReferredToCompany) || other.totalReferredToCompany == totalReferredToCompany)&&(identical(other.totalAcceptedByCompany, totalAcceptedByCompany) || other.totalAcceptedByCompany == totalAcceptedByCompany)&&(identical(other.totalInterviewScheduled, totalInterviewScheduled) || other.totalInterviewScheduled == totalInterviewScheduled)&&(identical(other.responseRate, responseRate) || other.responseRate == responseRate)&&(identical(other.referralSuccessRate, referralSuccessRate) || other.referralSuccessRate == referralSuccessRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalApplicationsReceived,totalReferredToCompany,totalAcceptedByCompany,totalInterviewScheduled,responseRate,referralSuccessRate);

@override
String toString() {
  return 'Metrics(totalApplicationsReceived: $totalApplicationsReceived, totalReferredToCompany: $totalReferredToCompany, totalAcceptedByCompany: $totalAcceptedByCompany, totalInterviewScheduled: $totalInterviewScheduled, responseRate: $responseRate, referralSuccessRate: $referralSuccessRate)';
}


}

/// @nodoc
abstract mixin class $MetricsCopyWith<$Res>  {
  factory $MetricsCopyWith(Metrics value, $Res Function(Metrics) _then) = _$MetricsCopyWithImpl;
@useResult
$Res call({
 int? totalApplicationsReceived, int? totalReferredToCompany, int? totalAcceptedByCompany, int? totalInterviewScheduled, int? responseRate, int? referralSuccessRate
});




}
/// @nodoc
class _$MetricsCopyWithImpl<$Res>
    implements $MetricsCopyWith<$Res> {
  _$MetricsCopyWithImpl(this._self, this._then);

  final Metrics _self;
  final $Res Function(Metrics) _then;

/// Create a copy of Metrics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalApplicationsReceived = freezed,Object? totalReferredToCompany = freezed,Object? totalAcceptedByCompany = freezed,Object? totalInterviewScheduled = freezed,Object? responseRate = freezed,Object? referralSuccessRate = freezed,}) {
  return _then(_self.copyWith(
totalApplicationsReceived: freezed == totalApplicationsReceived ? _self.totalApplicationsReceived : totalApplicationsReceived // ignore: cast_nullable_to_non_nullable
as int?,totalReferredToCompany: freezed == totalReferredToCompany ? _self.totalReferredToCompany : totalReferredToCompany // ignore: cast_nullable_to_non_nullable
as int?,totalAcceptedByCompany: freezed == totalAcceptedByCompany ? _self.totalAcceptedByCompany : totalAcceptedByCompany // ignore: cast_nullable_to_non_nullable
as int?,totalInterviewScheduled: freezed == totalInterviewScheduled ? _self.totalInterviewScheduled : totalInterviewScheduled // ignore: cast_nullable_to_non_nullable
as int?,responseRate: freezed == responseRate ? _self.responseRate : responseRate // ignore: cast_nullable_to_non_nullable
as int?,referralSuccessRate: freezed == referralSuccessRate ? _self.referralSuccessRate : referralSuccessRate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Metrics].
extension MetricsPatterns on Metrics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metrics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metrics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metrics value)  $default,){
final _that = this;
switch (_that) {
case _Metrics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metrics value)?  $default,){
final _that = this;
switch (_that) {
case _Metrics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalApplicationsReceived,  int? totalReferredToCompany,  int? totalAcceptedByCompany,  int? totalInterviewScheduled,  int? responseRate,  int? referralSuccessRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metrics() when $default != null:
return $default(_that.totalApplicationsReceived,_that.totalReferredToCompany,_that.totalAcceptedByCompany,_that.totalInterviewScheduled,_that.responseRate,_that.referralSuccessRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? totalApplicationsReceived,  int? totalReferredToCompany,  int? totalAcceptedByCompany,  int? totalInterviewScheduled,  int? responseRate,  int? referralSuccessRate)  $default,) {final _that = this;
switch (_that) {
case _Metrics():
return $default(_that.totalApplicationsReceived,_that.totalReferredToCompany,_that.totalAcceptedByCompany,_that.totalInterviewScheduled,_that.responseRate,_that.referralSuccessRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? totalApplicationsReceived,  int? totalReferredToCompany,  int? totalAcceptedByCompany,  int? totalInterviewScheduled,  int? responseRate,  int? referralSuccessRate)?  $default,) {final _that = this;
switch (_that) {
case _Metrics() when $default != null:
return $default(_that.totalApplicationsReceived,_that.totalReferredToCompany,_that.totalAcceptedByCompany,_that.totalInterviewScheduled,_that.responseRate,_that.referralSuccessRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metrics implements Metrics {
  const _Metrics({this.totalApplicationsReceived, this.totalReferredToCompany, this.totalAcceptedByCompany, this.totalInterviewScheduled, this.responseRate, this.referralSuccessRate});
  factory _Metrics.fromJson(Map<String, dynamic> json) => _$MetricsFromJson(json);

@override final  int? totalApplicationsReceived;
@override final  int? totalReferredToCompany;
@override final  int? totalAcceptedByCompany;
@override final  int? totalInterviewScheduled;
@override final  int? responseRate;
@override final  int? referralSuccessRate;

/// Create a copy of Metrics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsCopyWith<_Metrics> get copyWith => __$MetricsCopyWithImpl<_Metrics>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metrics&&(identical(other.totalApplicationsReceived, totalApplicationsReceived) || other.totalApplicationsReceived == totalApplicationsReceived)&&(identical(other.totalReferredToCompany, totalReferredToCompany) || other.totalReferredToCompany == totalReferredToCompany)&&(identical(other.totalAcceptedByCompany, totalAcceptedByCompany) || other.totalAcceptedByCompany == totalAcceptedByCompany)&&(identical(other.totalInterviewScheduled, totalInterviewScheduled) || other.totalInterviewScheduled == totalInterviewScheduled)&&(identical(other.responseRate, responseRate) || other.responseRate == responseRate)&&(identical(other.referralSuccessRate, referralSuccessRate) || other.referralSuccessRate == referralSuccessRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalApplicationsReceived,totalReferredToCompany,totalAcceptedByCompany,totalInterviewScheduled,responseRate,referralSuccessRate);

@override
String toString() {
  return 'Metrics(totalApplicationsReceived: $totalApplicationsReceived, totalReferredToCompany: $totalReferredToCompany, totalAcceptedByCompany: $totalAcceptedByCompany, totalInterviewScheduled: $totalInterviewScheduled, responseRate: $responseRate, referralSuccessRate: $referralSuccessRate)';
}


}

/// @nodoc
abstract mixin class _$MetricsCopyWith<$Res> implements $MetricsCopyWith<$Res> {
  factory _$MetricsCopyWith(_Metrics value, $Res Function(_Metrics) _then) = __$MetricsCopyWithImpl;
@override @useResult
$Res call({
 int? totalApplicationsReceived, int? totalReferredToCompany, int? totalAcceptedByCompany, int? totalInterviewScheduled, int? responseRate, int? referralSuccessRate
});




}
/// @nodoc
class __$MetricsCopyWithImpl<$Res>
    implements _$MetricsCopyWith<$Res> {
  __$MetricsCopyWithImpl(this._self, this._then);

  final _Metrics _self;
  final $Res Function(_Metrics) _then;

/// Create a copy of Metrics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalApplicationsReceived = freezed,Object? totalReferredToCompany = freezed,Object? totalAcceptedByCompany = freezed,Object? totalInterviewScheduled = freezed,Object? responseRate = freezed,Object? referralSuccessRate = freezed,}) {
  return _then(_Metrics(
totalApplicationsReceived: freezed == totalApplicationsReceived ? _self.totalApplicationsReceived : totalApplicationsReceived // ignore: cast_nullable_to_non_nullable
as int?,totalReferredToCompany: freezed == totalReferredToCompany ? _self.totalReferredToCompany : totalReferredToCompany // ignore: cast_nullable_to_non_nullable
as int?,totalAcceptedByCompany: freezed == totalAcceptedByCompany ? _self.totalAcceptedByCompany : totalAcceptedByCompany // ignore: cast_nullable_to_non_nullable
as int?,totalInterviewScheduled: freezed == totalInterviewScheduled ? _self.totalInterviewScheduled : totalInterviewScheduled // ignore: cast_nullable_to_non_nullable
as int?,responseRate: freezed == responseRate ? _self.responseRate : responseRate // ignore: cast_nullable_to_non_nullable
as int?,referralSuccessRate: freezed == referralSuccessRate ? _self.referralSuccessRate : referralSuccessRate // ignore: cast_nullable_to_non_nullable
as int?,
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
