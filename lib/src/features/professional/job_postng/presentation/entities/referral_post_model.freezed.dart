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

 String get jobTitle; String get description; String get employmentType; String get workMode; String get broadcastType; String get jobType; List<String> get location; String get minEducation; int get numberOfOpenings; PackageDetails get packageDetails; List<String> get skills; List<String> get studentStreams; List<String> get tags; String get workAuthorization; String get yearsOfExperience; List<String> get benefits; List<String> get certifications; String get eligibilityCriteria;
/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralPostModelCopyWith<ReferralPostModel> get copyWith => _$ReferralPostModelCopyWithImpl<ReferralPostModel>(this as ReferralPostModel, _$identity);

  /// Serializes this ReferralPostModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralPostModel&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.studentStreams, studentStreams)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobTitle,description,employmentType,workMode,broadcastType,jobType,const DeepCollectionEquality().hash(location),minEducation,numberOfOpenings,packageDetails,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(studentStreams),const DeepCollectionEquality().hash(tags),workAuthorization,yearsOfExperience,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(certifications),eligibilityCriteria);

@override
String toString() {
  return 'ReferralPostModel(jobTitle: $jobTitle, description: $description, employmentType: $employmentType, workMode: $workMode, broadcastType: $broadcastType, jobType: $jobType, location: $location, minEducation: $minEducation, numberOfOpenings: $numberOfOpenings, packageDetails: $packageDetails, skills: $skills, studentStreams: $studentStreams, tags: $tags, workAuthorization: $workAuthorization, yearsOfExperience: $yearsOfExperience, benefits: $benefits, certifications: $certifications, eligibilityCriteria: $eligibilityCriteria)';
}


}

/// @nodoc
abstract mixin class $ReferralPostModelCopyWith<$Res>  {
  factory $ReferralPostModelCopyWith(ReferralPostModel value, $Res Function(ReferralPostModel) _then) = _$ReferralPostModelCopyWithImpl;
@useResult
$Res call({
 String jobTitle, String description, String employmentType, String workMode, String broadcastType, String jobType, List<String> location, String minEducation, int numberOfOpenings, PackageDetails packageDetails, List<String> skills, List<String> studentStreams, List<String> tags, String workAuthorization, String yearsOfExperience, List<String> benefits, List<String> certifications, String eligibilityCriteria
});


$PackageDetailsCopyWith<$Res> get packageDetails;

}
/// @nodoc
class _$ReferralPostModelCopyWithImpl<$Res>
    implements $ReferralPostModelCopyWith<$Res> {
  _$ReferralPostModelCopyWithImpl(this._self, this._then);

  final ReferralPostModel _self;
  final $Res Function(ReferralPostModel) _then;

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? jobTitle = null,Object? description = null,Object? employmentType = null,Object? workMode = null,Object? broadcastType = null,Object? jobType = null,Object? location = null,Object? minEducation = null,Object? numberOfOpenings = null,Object? packageDetails = null,Object? skills = null,Object? studentStreams = null,Object? tags = null,Object? workAuthorization = null,Object? yearsOfExperience = null,Object? benefits = null,Object? certifications = null,Object? eligibilityCriteria = null,}) {
  return _then(_self.copyWith(
jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,employmentType: null == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String,workMode: null == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as String,broadcastType: null == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>,minEducation: null == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String,numberOfOpenings: null == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int,packageDetails: null == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails,skills: null == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,studentStreams: null == studentStreams ? _self.studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,workAuthorization: null == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String,yearsOfExperience: null == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String,benefits: null == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: null == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,eligibilityCriteria: null == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res> get packageDetails {
  
  return $PackageDetailsCopyWith<$Res>(_self.packageDetails, (value) {
    return _then(_self.copyWith(packageDetails: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String jobTitle,  String description,  String employmentType,  String workMode,  String broadcastType,  String jobType,  List<String> location,  String minEducation,  int numberOfOpenings,  PackageDetails packageDetails,  List<String> skills,  List<String> studentStreams,  List<String> tags,  String workAuthorization,  String yearsOfExperience,  List<String> benefits,  List<String> certifications,  String eligibilityCriteria)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
return $default(_that.jobTitle,_that.description,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.benefits,_that.certifications,_that.eligibilityCriteria);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String jobTitle,  String description,  String employmentType,  String workMode,  String broadcastType,  String jobType,  List<String> location,  String minEducation,  int numberOfOpenings,  PackageDetails packageDetails,  List<String> skills,  List<String> studentStreams,  List<String> tags,  String workAuthorization,  String yearsOfExperience,  List<String> benefits,  List<String> certifications,  String eligibilityCriteria)  $default,) {final _that = this;
switch (_that) {
case _ReferralPostModel():
return $default(_that.jobTitle,_that.description,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.benefits,_that.certifications,_that.eligibilityCriteria);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String jobTitle,  String description,  String employmentType,  String workMode,  String broadcastType,  String jobType,  List<String> location,  String minEducation,  int numberOfOpenings,  PackageDetails packageDetails,  List<String> skills,  List<String> studentStreams,  List<String> tags,  String workAuthorization,  String yearsOfExperience,  List<String> benefits,  List<String> certifications,  String eligibilityCriteria)?  $default,) {final _that = this;
switch (_that) {
case _ReferralPostModel() when $default != null:
return $default(_that.jobTitle,_that.description,_that.employmentType,_that.workMode,_that.broadcastType,_that.jobType,_that.location,_that.minEducation,_that.numberOfOpenings,_that.packageDetails,_that.skills,_that.studentStreams,_that.tags,_that.workAuthorization,_that.yearsOfExperience,_that.benefits,_that.certifications,_that.eligibilityCriteria);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralPostModel implements ReferralPostModel {
  const _ReferralPostModel({required this.jobTitle, required this.description, required this.employmentType, required this.workMode, required this.broadcastType, required this.jobType, required final  List<String> location, required this.minEducation, required this.numberOfOpenings, required this.packageDetails, required final  List<String> skills, required final  List<String> studentStreams, required final  List<String> tags, required this.workAuthorization, required this.yearsOfExperience, required final  List<String> benefits, required final  List<String> certifications, required this.eligibilityCriteria}): _location = location,_skills = skills,_studentStreams = studentStreams,_tags = tags,_benefits = benefits,_certifications = certifications;
  factory _ReferralPostModel.fromJson(Map<String, dynamic> json) => _$ReferralPostModelFromJson(json);

@override final  String jobTitle;
@override final  String description;
@override final  String employmentType;
@override final  String workMode;
@override final  String broadcastType;
@override final  String jobType;
 final  List<String> _location;
@override List<String> get location {
  if (_location is EqualUnmodifiableListView) return _location;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_location);
}

@override final  String minEducation;
@override final  int numberOfOpenings;
@override final  PackageDetails packageDetails;
 final  List<String> _skills;
@override List<String> get skills {
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_skills);
}

 final  List<String> _studentStreams;
@override List<String> get studentStreams {
  if (_studentStreams is EqualUnmodifiableListView) return _studentStreams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_studentStreams);
}

 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override final  String workAuthorization;
@override final  String yearsOfExperience;
 final  List<String> _benefits;
@override List<String> get benefits {
  if (_benefits is EqualUnmodifiableListView) return _benefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_benefits);
}

 final  List<String> _certifications;
@override List<String> get certifications {
  if (_certifications is EqualUnmodifiableListView) return _certifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certifications);
}

@override final  String eligibilityCriteria;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralPostModel&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.workMode, workMode) || other.workMode == workMode)&&(identical(other.broadcastType, broadcastType) || other.broadcastType == broadcastType)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&const DeepCollectionEquality().equals(other._location, _location)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._studentStreams, _studentStreams)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.workAuthorization, workAuthorization) || other.workAuthorization == workAuthorization)&&(identical(other.yearsOfExperience, yearsOfExperience) || other.yearsOfExperience == yearsOfExperience)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,jobTitle,description,employmentType,workMode,broadcastType,jobType,const DeepCollectionEquality().hash(_location),minEducation,numberOfOpenings,packageDetails,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_studentStreams),const DeepCollectionEquality().hash(_tags),workAuthorization,yearsOfExperience,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_certifications),eligibilityCriteria);

@override
String toString() {
  return 'ReferralPostModel(jobTitle: $jobTitle, description: $description, employmentType: $employmentType, workMode: $workMode, broadcastType: $broadcastType, jobType: $jobType, location: $location, minEducation: $minEducation, numberOfOpenings: $numberOfOpenings, packageDetails: $packageDetails, skills: $skills, studentStreams: $studentStreams, tags: $tags, workAuthorization: $workAuthorization, yearsOfExperience: $yearsOfExperience, benefits: $benefits, certifications: $certifications, eligibilityCriteria: $eligibilityCriteria)';
}


}

/// @nodoc
abstract mixin class _$ReferralPostModelCopyWith<$Res> implements $ReferralPostModelCopyWith<$Res> {
  factory _$ReferralPostModelCopyWith(_ReferralPostModel value, $Res Function(_ReferralPostModel) _then) = __$ReferralPostModelCopyWithImpl;
@override @useResult
$Res call({
 String jobTitle, String description, String employmentType, String workMode, String broadcastType, String jobType, List<String> location, String minEducation, int numberOfOpenings, PackageDetails packageDetails, List<String> skills, List<String> studentStreams, List<String> tags, String workAuthorization, String yearsOfExperience, List<String> benefits, List<String> certifications, String eligibilityCriteria
});


@override $PackageDetailsCopyWith<$Res> get packageDetails;

}
/// @nodoc
class __$ReferralPostModelCopyWithImpl<$Res>
    implements _$ReferralPostModelCopyWith<$Res> {
  __$ReferralPostModelCopyWithImpl(this._self, this._then);

  final _ReferralPostModel _self;
  final $Res Function(_ReferralPostModel) _then;

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? jobTitle = null,Object? description = null,Object? employmentType = null,Object? workMode = null,Object? broadcastType = null,Object? jobType = null,Object? location = null,Object? minEducation = null,Object? numberOfOpenings = null,Object? packageDetails = null,Object? skills = null,Object? studentStreams = null,Object? tags = null,Object? workAuthorization = null,Object? yearsOfExperience = null,Object? benefits = null,Object? certifications = null,Object? eligibilityCriteria = null,}) {
  return _then(_ReferralPostModel(
jobTitle: null == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,employmentType: null == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String,workMode: null == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as String,broadcastType: null == broadcastType ? _self.broadcastType : broadcastType // ignore: cast_nullable_to_non_nullable
as String,jobType: null == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>,minEducation: null == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String,numberOfOpenings: null == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int,packageDetails: null == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails,skills: null == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>,studentStreams: null == studentStreams ? _self._studentStreams : studentStreams // ignore: cast_nullable_to_non_nullable
as List<String>,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,workAuthorization: null == workAuthorization ? _self.workAuthorization : workAuthorization // ignore: cast_nullable_to_non_nullable
as String,yearsOfExperience: null == yearsOfExperience ? _self.yearsOfExperience : yearsOfExperience // ignore: cast_nullable_to_non_nullable
as String,benefits: null == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: null == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,eligibilityCriteria: null == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ReferralPostModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res> get packageDetails {
  
  return $PackageDetailsCopyWith<$Res>(_self.packageDetails, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}
}


/// @nodoc
mixin _$PackageDetails {

 String get currency; int get totalCTC; int get fixedPay; int get joiningBonus;
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
 String currency, int totalCTC, int fixedPay, int joiningBonus
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
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? totalCTC = null,Object? fixedPay = null,Object? joiningBonus = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,totalCTC: null == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int,fixedPay: null == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int,joiningBonus: null == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency,  int totalCTC,  int fixedPay,  int joiningBonus)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency,  int totalCTC,  int fixedPay,  int joiningBonus)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency,  int totalCTC,  int fixedPay,  int joiningBonus)?  $default,) {final _that = this;
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
  const _PackageDetails({required this.currency, required this.totalCTC, required this.fixedPay, required this.joiningBonus});
  factory _PackageDetails.fromJson(Map<String, dynamic> json) => _$PackageDetailsFromJson(json);

@override final  String currency;
@override final  int totalCTC;
@override final  int fixedPay;
@override final  int joiningBonus;

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
 String currency, int totalCTC, int fixedPay, int joiningBonus
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
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? totalCTC = null,Object? fixedPay = null,Object? joiningBonus = null,}) {
  return _then(_PackageDetails(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,totalCTC: null == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int,fixedPay: null == fixedPay ? _self.fixedPay : fixedPay // ignore: cast_nullable_to_non_nullable
as int,joiningBonus: null == joiningBonus ? _self.joiningBonus : joiningBonus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
