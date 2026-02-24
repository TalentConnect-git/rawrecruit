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

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'candidatePosted') CandidatePosted? get candidatePosted; String? get minEducation; String? get workAuthorization; String? get eligibilityCriteria; List<String>? get benefits; List<String>? get tags; int? get numberOfOpenings; String? get status; String? get jobTitle; List<String>? get location; List<String>? get workMode; List<String>? get employmentType; String? get approvalStatus; String? get description; List<String>? get skills; PackageDetails? get packageDetails; String? get yearsOfExperience;
/// Create a copy of ReferralJobModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralJobModelCopyWith<ReferralJobModel> get copyWith => _$ReferralJobModelCopyWithImpl<ReferralJobModel>(this as ReferralJobModel, _$identity);

  /// Serializes this ReferralJobModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.status, status) || other.status == status)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.employmentType, employmentType)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.skills, skills)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,candidatePosted,minEducation,workAuthorization,eligibilityCriteria,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),numberOfOpenings,status,jobTitle,const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(employmentType),approvalStatus,description,const DeepCollectionEquality().hash(skills),packageDetails,yearsOfExperience);

@override
String toString() {
  return 'ReferralJobModel(id: $id, candidatePosted: $candidatePosted, minEducation: $minEducation, workAuthorization: $workAuthorization, eligibilityCriteria: $eligibilityCriteria, benefits: $benefits, tags: $tags, numberOfOpenings: $numberOfOpenings, status: $status, jobTitle: $jobTitle, location: $location, workMode: $workMode, employmentType: $employmentType, approvalStatus: $approvalStatus, description: $description, skills: $skills, packageDetails: $packageDetails, yearsOfExperience: $yearsOfExperience)';
}


}

/// @nodoc
abstract mixin class $ReferralJobModelCopyWith<$Res>  {
  factory $ReferralJobModelCopyWith(ReferralJobModel value, $Res Function(ReferralJobModel) _then) = _$ReferralJobModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'candidatePosted') CandidatePosted? candidatePosted, String? minEducation, String? workAuthorization, String? eligibilityCriteria, List<String>? benefits, List<String>? tags, int? numberOfOpenings, String? status, String? jobTitle, List<String>? location, List<String>? workMode, List<String>? employmentType, String? approvalStatus, String? description, List<String>? skills, PackageDetails? packageDetails, String? yearsOfExperience
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? candidatePosted = freezed,Object? minEducation = freezed,Object? workAuthorization = freezed,Object? eligibilityCriteria = freezed,Object? benefits = freezed,Object? tags = freezed,Object? numberOfOpenings = freezed,Object? status = freezed,Object? jobTitle = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? approvalStatus = freezed,Object? description = freezed,Object? skills = freezed,Object? packageDetails = freezed,Object? yearsOfExperience = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as CandidatePosted?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? numberOfOpenings,  String? status,  String? jobTitle,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  String? approvalStatus,  String? description,  List<String>? skills,  PackageDetails? packageDetails,  String? yearsOfExperience)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
return $default(_that.id,_that.candidatePosted,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.numberOfOpenings,_that.status,_that.jobTitle,_that.location,_that.workMode,_that.employmentType,_that.approvalStatus,_that.description,_that.skills,_that.packageDetails,_that.yearsOfExperience);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? numberOfOpenings,  String? status,  String? jobTitle,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  String? approvalStatus,  String? description,  List<String>? skills,  PackageDetails? packageDetails,  String? yearsOfExperience)  $default,) {final _that = this;
switch (_that) {
case _ReferralJobModel():
return $default(_that.id,_that.candidatePosted,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.numberOfOpenings,_that.status,_that.jobTitle,_that.location,_that.workMode,_that.employmentType,_that.approvalStatus,_that.description,_that.skills,_that.packageDetails,_that.yearsOfExperience);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'candidatePosted')  CandidatePosted? candidatePosted,  String? minEducation,  String? workAuthorization,  String? eligibilityCriteria,  List<String>? benefits,  List<String>? tags,  int? numberOfOpenings,  String? status,  String? jobTitle,  List<String>? location,  List<String>? workMode,  List<String>? employmentType,  String? approvalStatus,  String? description,  List<String>? skills,  PackageDetails? packageDetails,  String? yearsOfExperience)?  $default,) {final _that = this;
switch (_that) {
case _ReferralJobModel() when $default != null:
return $default(_that.id,_that.candidatePosted,_that.minEducation,_that.workAuthorization,_that.eligibilityCriteria,_that.benefits,_that.tags,_that.numberOfOpenings,_that.status,_that.jobTitle,_that.location,_that.workMode,_that.employmentType,_that.approvalStatus,_that.description,_that.skills,_that.packageDetails,_that.yearsOfExperience);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralJobModel implements ReferralJobModel {
  const _ReferralJobModel({@JsonKey(name: '_id') this.id, @JsonKey(name: 'candidatePosted') this.candidatePosted, this.minEducation, this.workAuthorization, this.eligibilityCriteria, final  List<String>? benefits, final  List<String>? tags, this.numberOfOpenings, this.status, this.jobTitle, final  List<String>? location, final  List<String>? workMode, final  List<String>? employmentType, this.approvalStatus, this.description, final  List<String>? skills, this.packageDetails, this.yearsOfExperience}): _benefits = benefits,_tags = tags,_location = location,_workMode = workMode,_employmentType = employmentType,_skills = skills;
  factory _ReferralJobModel.fromJson(Map<String, dynamic> json) => _$ReferralJobModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'candidatePosted') final  CandidatePosted? candidatePosted;
@override final  String? minEducation;
@override final  String? workAuthorization;
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

@override final  int? numberOfOpenings;
@override final  String? status;
@override final  String? jobTitle;
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

@override final  String? approvalStatus;
@override final  String? description;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  PackageDetails? packageDetails;
@override final  String? yearsOfExperience;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralJobModel&&(identical(other.id, id) || other.id == id)&&(identical(other.candidatePosted, candidatePosted) || other.candidatePosted == candidatePosted)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.status, status) || other.status == status)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._employmentType, _employmentType)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._skills, _skills)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,candidatePosted,minEducation,workAuthorization,eligibilityCriteria,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),numberOfOpenings,status,jobTitle,const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_employmentType),approvalStatus,description,const DeepCollectionEquality().hash(_skills),packageDetails,yearsOfExperience);

@override
String toString() {
  return 'ReferralJobModel(id: $id, candidatePosted: $candidatePosted, minEducation: $minEducation, workAuthorization: $workAuthorization, eligibilityCriteria: $eligibilityCriteria, benefits: $benefits, tags: $tags, numberOfOpenings: $numberOfOpenings, status: $status, jobTitle: $jobTitle, location: $location, workMode: $workMode, employmentType: $employmentType, approvalStatus: $approvalStatus, description: $description, skills: $skills, packageDetails: $packageDetails, yearsOfExperience: $yearsOfExperience)';
}


}

/// @nodoc
abstract mixin class _$ReferralJobModelCopyWith<$Res> implements $ReferralJobModelCopyWith<$Res> {
  factory _$ReferralJobModelCopyWith(_ReferralJobModel value, $Res Function(_ReferralJobModel) _then) = __$ReferralJobModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'candidatePosted') CandidatePosted? candidatePosted, String? minEducation, String? workAuthorization, String? eligibilityCriteria, List<String>? benefits, List<String>? tags, int? numberOfOpenings, String? status, String? jobTitle, List<String>? location, List<String>? workMode, List<String>? employmentType, String? approvalStatus, String? description, List<String>? skills, PackageDetails? packageDetails, String? yearsOfExperience
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? candidatePosted = freezed,Object? minEducation = freezed,Object? workAuthorization = freezed,Object? eligibilityCriteria = freezed,Object? benefits = freezed,Object? tags = freezed,Object? numberOfOpenings = freezed,Object? status = freezed,Object? jobTitle = freezed,Object? location = freezed,Object? workMode = freezed,Object? employmentType = freezed,Object? approvalStatus = freezed,Object? description = freezed,Object? skills = freezed,Object? packageDetails = freezed,Object? yearsOfExperience = freezed,}) {
  return _then(_ReferralJobModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,candidatePosted: freezed == candidatePosted ? _self.candidatePosted : candidatePosted // ignore: cast_nullable_to_non_nullable
as CandidatePosted?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,workAuthorization: freezed == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,employmentType: freezed == employmentType ? _self._employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as List<String>?,approvalStatus: freezed == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,yearsOfExperience: freezed == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String?,
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

@JsonKey(name: '_id') String? get id; String? get name; List<dynamic>? get experiences; List<dynamic>? get jobRoles;
/// Create a copy of CandidatePosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatePostedCopyWith<CandidatePosted> get copyWith => _$CandidatePostedCopyWithImpl<CandidatePosted>(this as CandidatePosted, _$identity);

  /// Serializes this CandidatePosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatePosted&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.experiences, experiences)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(experiences),const DeepCollectionEquality().hash(jobRoles));

@override
String toString() {
  return 'CandidatePosted(id: $id, name: $name, experiences: $experiences, jobRoles: $jobRoles)';
}


}

/// @nodoc
abstract mixin class $CandidatePostedCopyWith<$Res>  {
  factory $CandidatePostedCopyWith(CandidatePosted value, $Res Function(CandidatePosted) _then) = _$CandidatePostedCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, List<dynamic>? experiences, List<dynamic>? jobRoles
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? experiences = freezed,Object? jobRoles = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,experiences: freezed == experiences ? _self.experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  List<dynamic>? experiences,  List<dynamic>? jobRoles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
return $default(_that.id,_that.name,_that.experiences,_that.jobRoles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  List<dynamic>? experiences,  List<dynamic>? jobRoles)  $default,) {final _that = this;
switch (_that) {
case _CandidatePosted():
return $default(_that.id,_that.name,_that.experiences,_that.jobRoles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? name,  List<dynamic>? experiences,  List<dynamic>? jobRoles)?  $default,) {final _that = this;
switch (_that) {
case _CandidatePosted() when $default != null:
return $default(_that.id,_that.name,_that.experiences,_that.jobRoles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidatePosted implements CandidatePosted {
  const _CandidatePosted({@JsonKey(name: '_id') this.id, this.name, final  List<dynamic>? experiences, final  List<dynamic>? jobRoles}): _experiences = experiences,_jobRoles = jobRoles;
  factory _CandidatePosted.fromJson(Map<String, dynamic> json) => _$CandidatePostedFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? name;
 final  List<dynamic>? _experiences;
@override List<dynamic>? get experiences {
  final value = _experiences;
  if (value == null) return null;
  if (_experiences is EqualUnmodifiableListView) return _experiences;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatePosted&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._experiences, _experiences)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_experiences),const DeepCollectionEquality().hash(_jobRoles));

@override
String toString() {
  return 'CandidatePosted(id: $id, name: $name, experiences: $experiences, jobRoles: $jobRoles)';
}


}

/// @nodoc
abstract mixin class _$CandidatePostedCopyWith<$Res> implements $CandidatePostedCopyWith<$Res> {
  factory _$CandidatePostedCopyWith(_CandidatePosted value, $Res Function(_CandidatePosted) _then) = __$CandidatePostedCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, List<dynamic>? experiences, List<dynamic>? jobRoles
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? experiences = freezed,Object? jobRoles = freezed,}) {
  return _then(_CandidatePosted(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,experiences: freezed == experiences ? _self._experiences : experiences // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
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
