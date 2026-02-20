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

@JsonKey(name: '_id') String? get id; String? get description; List<String>? get skills; List<String>? get workMode; List<String>? get location; List<String>? get jobRoles; String? get internshipDuration; int? get numberOfOpenings; String? get minEducation; List<String>? get benefits; List<String>? get tags; String? get eligibilityCriteria; DateTime? get onlineTestDate; InternshipPackageDetails? get packageDetails; InternshipCompanyPosted? get companyPosted;
/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipModelCopyWith<InternshipModel> get copyWith => _$InternshipModelCopyWithImpl<InternshipModel>(this as InternshipModel, _$identity);

  /// Serializes this InternshipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.workMode, workMode)&&const DeepCollectionEquality().equals(other.location, location)&&const DeepCollectionEquality().equals(other.jobRoles, jobRoles)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(workMode),const DeepCollectionEquality().hash(location),const DeepCollectionEquality().hash(jobRoles),internshipDuration,numberOfOpenings,minEducation,const DeepCollectionEquality().hash(benefits),const DeepCollectionEquality().hash(tags),eligibilityCriteria,onlineTestDate,packageDetails,companyPosted);

@override
String toString() {
  return 'InternshipModel(id: $id, description: $description, skills: $skills, workMode: $workMode, location: $location, jobRoles: $jobRoles, internshipDuration: $internshipDuration, numberOfOpenings: $numberOfOpenings, minEducation: $minEducation, benefits: $benefits, tags: $tags, eligibilityCriteria: $eligibilityCriteria, onlineTestDate: $onlineTestDate, packageDetails: $packageDetails, companyPosted: $companyPosted)';
}


}

/// @nodoc
abstract mixin class $InternshipModelCopyWith<$Res>  {
  factory $InternshipModelCopyWith(InternshipModel value, $Res Function(InternshipModel) _then) = _$InternshipModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? jobRoles, String? internshipDuration, int? numberOfOpenings, String? minEducation, List<String>? benefits, List<String>? tags, String? eligibilityCriteria, DateTime? onlineTestDate, InternshipPackageDetails? packageDetails, InternshipCompanyPosted? companyPosted
});


$InternshipPackageDetailsCopyWith<$Res>? get packageDetails;$InternshipCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class _$InternshipModelCopyWithImpl<$Res>
    implements $InternshipModelCopyWith<$Res> {
  _$InternshipModelCopyWithImpl(this._self, this._then);

  final InternshipModel _self;
  final $Res Function(InternshipModel) _then;

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? description = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? jobRoles = freezed,Object? internshipDuration = freezed,Object? numberOfOpenings = freezed,Object? minEducation = freezed,Object? benefits = freezed,Object? tags = freezed,Object? eligibilityCriteria = freezed,Object? onlineTestDate = freezed,Object? packageDetails = freezed,Object? companyPosted = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self.workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self.jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as InternshipPackageDetails?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as InternshipCompanyPosted?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  String? internshipDuration,  int? numberOfOpenings,  String? minEducation,  List<String>? benefits,  List<String>? tags,  String? eligibilityCriteria,  DateTime? onlineTestDate,  InternshipPackageDetails? packageDetails,  InternshipCompanyPosted? companyPosted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
return $default(_that.id,_that.description,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.internshipDuration,_that.numberOfOpenings,_that.minEducation,_that.benefits,_that.tags,_that.eligibilityCriteria,_that.onlineTestDate,_that.packageDetails,_that.companyPosted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? description,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  String? internshipDuration,  int? numberOfOpenings,  String? minEducation,  List<String>? benefits,  List<String>? tags,  String? eligibilityCriteria,  DateTime? onlineTestDate,  InternshipPackageDetails? packageDetails,  InternshipCompanyPosted? companyPosted)  $default,) {final _that = this;
switch (_that) {
case _InternshipModel():
return $default(_that.id,_that.description,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.internshipDuration,_that.numberOfOpenings,_that.minEducation,_that.benefits,_that.tags,_that.eligibilityCriteria,_that.onlineTestDate,_that.packageDetails,_that.companyPosted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? description,  List<String>? skills,  List<String>? workMode,  List<String>? location,  List<String>? jobRoles,  String? internshipDuration,  int? numberOfOpenings,  String? minEducation,  List<String>? benefits,  List<String>? tags,  String? eligibilityCriteria,  DateTime? onlineTestDate,  InternshipPackageDetails? packageDetails,  InternshipCompanyPosted? companyPosted)?  $default,) {final _that = this;
switch (_that) {
case _InternshipModel() when $default != null:
return $default(_that.id,_that.description,_that.skills,_that.workMode,_that.location,_that.jobRoles,_that.internshipDuration,_that.numberOfOpenings,_that.minEducation,_that.benefits,_that.tags,_that.eligibilityCriteria,_that.onlineTestDate,_that.packageDetails,_that.companyPosted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipModel implements InternshipModel {
  const _InternshipModel({@JsonKey(name: '_id') this.id, this.description, final  List<String>? skills, final  List<String>? workMode, final  List<String>? location, final  List<String>? jobRoles, this.internshipDuration, this.numberOfOpenings, this.minEducation, final  List<String>? benefits, final  List<String>? tags, this.eligibilityCriteria, this.onlineTestDate, this.packageDetails, this.companyPosted}): _skills = skills,_workMode = workMode,_location = location,_jobRoles = jobRoles,_benefits = benefits,_tags = tags;
  factory _InternshipModel.fromJson(Map<String, dynamic> json) => _$InternshipModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? description;
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

@override final  String? internshipDuration;
@override final  int? numberOfOpenings;
@override final  String? minEducation;
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

@override final  String? eligibilityCriteria;
@override final  DateTime? onlineTestDate;
@override final  InternshipPackageDetails? packageDetails;
@override final  InternshipCompanyPosted? companyPosted;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._workMode, _workMode)&&const DeepCollectionEquality().equals(other._location, _location)&&const DeepCollectionEquality().equals(other._jobRoles, _jobRoles)&&(identical(other.internshipDuration, internshipDuration) || other.internshipDuration == internshipDuration)&&(identical(other.numberOfOpenings, numberOfOpenings) || other.numberOfOpenings == numberOfOpenings)&&(identical(other.minEducation, minEducation) || other.minEducation == minEducation)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.eligibilityCriteria, eligibilityCriteria) || other.eligibilityCriteria == eligibilityCriteria)&&(identical(other.onlineTestDate, onlineTestDate) || other.onlineTestDate == onlineTestDate)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails)&&(identical(other.companyPosted, companyPosted) || other.companyPosted == companyPosted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_workMode),const DeepCollectionEquality().hash(_location),const DeepCollectionEquality().hash(_jobRoles),internshipDuration,numberOfOpenings,minEducation,const DeepCollectionEquality().hash(_benefits),const DeepCollectionEquality().hash(_tags),eligibilityCriteria,onlineTestDate,packageDetails,companyPosted);

@override
String toString() {
  return 'InternshipModel(id: $id, description: $description, skills: $skills, workMode: $workMode, location: $location, jobRoles: $jobRoles, internshipDuration: $internshipDuration, numberOfOpenings: $numberOfOpenings, minEducation: $minEducation, benefits: $benefits, tags: $tags, eligibilityCriteria: $eligibilityCriteria, onlineTestDate: $onlineTestDate, packageDetails: $packageDetails, companyPosted: $companyPosted)';
}


}

/// @nodoc
abstract mixin class _$InternshipModelCopyWith<$Res> implements $InternshipModelCopyWith<$Res> {
  factory _$InternshipModelCopyWith(_InternshipModel value, $Res Function(_InternshipModel) _then) = __$InternshipModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? description, List<String>? skills, List<String>? workMode, List<String>? location, List<String>? jobRoles, String? internshipDuration, int? numberOfOpenings, String? minEducation, List<String>? benefits, List<String>? tags, String? eligibilityCriteria, DateTime? onlineTestDate, InternshipPackageDetails? packageDetails, InternshipCompanyPosted? companyPosted
});


@override $InternshipPackageDetailsCopyWith<$Res>? get packageDetails;@override $InternshipCompanyPostedCopyWith<$Res>? get companyPosted;

}
/// @nodoc
class __$InternshipModelCopyWithImpl<$Res>
    implements _$InternshipModelCopyWith<$Res> {
  __$InternshipModelCopyWithImpl(this._self, this._then);

  final _InternshipModel _self;
  final $Res Function(_InternshipModel) _then;

/// Create a copy of InternshipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? description = freezed,Object? skills = freezed,Object? workMode = freezed,Object? location = freezed,Object? jobRoles = freezed,Object? internshipDuration = freezed,Object? numberOfOpenings = freezed,Object? minEducation = freezed,Object? benefits = freezed,Object? tags = freezed,Object? eligibilityCriteria = freezed,Object? onlineTestDate = freezed,Object? packageDetails = freezed,Object? companyPosted = freezed,}) {
  return _then(_InternshipModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,workMode: freezed == workMode ? _self._workMode : workMode // ignore: cast_nullable_to_non_nullable
as List<String>?,location: freezed == location ? _self._location : location // ignore: cast_nullable_to_non_nullable
as List<String>?,jobRoles: freezed == jobRoles ? _self._jobRoles : jobRoles // ignore: cast_nullable_to_non_nullable
as List<String>?,internshipDuration: freezed == internshipDuration ? _self.internshipDuration : internshipDuration // ignore: cast_nullable_to_non_nullable
as String?,numberOfOpenings: freezed == numberOfOpenings ? _self.numberOfOpenings : numberOfOpenings // ignore: cast_nullable_to_non_nullable
as int?,minEducation: freezed == minEducation ? _self.minEducation : minEducation // ignore: cast_nullable_to_non_nullable
as String?,benefits: freezed == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<String>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibilityCriteria: freezed == eligibilityCriteria ? _self.eligibilityCriteria : eligibilityCriteria // ignore: cast_nullable_to_non_nullable
as String?,onlineTestDate: freezed == onlineTestDate ? _self.onlineTestDate : onlineTestDate // ignore: cast_nullable_to_non_nullable
as DateTime?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as InternshipPackageDetails?,companyPosted: freezed == companyPosted ? _self.companyPosted : companyPosted // ignore: cast_nullable_to_non_nullable
as InternshipCompanyPosted?,
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

 int? get totalCTC;
/// Create a copy of InternshipPackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipPackageDetailsCopyWith<InternshipPackageDetails> get copyWith => _$InternshipPackageDetailsCopyWithImpl<InternshipPackageDetails>(this as InternshipPackageDetails, _$identity);

  /// Serializes this InternshipPackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipPackageDetails&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCTC);

@override
String toString() {
  return 'InternshipPackageDetails(totalCTC: $totalCTC)';
}


}

/// @nodoc
abstract mixin class $InternshipPackageDetailsCopyWith<$Res>  {
  factory $InternshipPackageDetailsCopyWith(InternshipPackageDetails value, $Res Function(InternshipPackageDetails) _then) = _$InternshipPackageDetailsCopyWithImpl;
@useResult
$Res call({
 int? totalCTC
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
@pragma('vm:prefer-inline') @override $Res call({Object? totalCTC = freezed,}) {
  return _then(_self.copyWith(
totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalCTC)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipPackageDetails() when $default != null:
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
case _InternshipPackageDetails():
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
case _InternshipPackageDetails() when $default != null:
return $default(_that.totalCTC);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipPackageDetails implements InternshipPackageDetails {
  const _InternshipPackageDetails({this.totalCTC});
  factory _InternshipPackageDetails.fromJson(Map<String, dynamic> json) => _$InternshipPackageDetailsFromJson(json);

@override final  int? totalCTC;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipPackageDetails&&(identical(other.totalCTC, totalCTC) || other.totalCTC == totalCTC));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalCTC);

@override
String toString() {
  return 'InternshipPackageDetails(totalCTC: $totalCTC)';
}


}

/// @nodoc
abstract mixin class _$InternshipPackageDetailsCopyWith<$Res> implements $InternshipPackageDetailsCopyWith<$Res> {
  factory _$InternshipPackageDetailsCopyWith(_InternshipPackageDetails value, $Res Function(_InternshipPackageDetails) _then) = __$InternshipPackageDetailsCopyWithImpl;
@override @useResult
$Res call({
 int? totalCTC
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
@override @pragma('vm:prefer-inline') $Res call({Object? totalCTC = freezed,}) {
  return _then(_InternshipPackageDetails(
totalCTC: freezed == totalCTC ? _self.totalCTC : totalCTC // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$InternshipCompanyPosted {

 InternshipCompanyDetails? get companyDetails; String? get profileImageUrl;
/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipCompanyPostedCopyWith<InternshipCompanyPosted> get copyWith => _$InternshipCompanyPostedCopyWithImpl<InternshipCompanyPosted>(this as InternshipCompanyPosted, _$identity);

  /// Serializes this InternshipCompanyPosted to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipCompanyPosted&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyDetails,profileImageUrl);

@override
String toString() {
  return 'InternshipCompanyPosted(companyDetails: $companyDetails, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class $InternshipCompanyPostedCopyWith<$Res>  {
  factory $InternshipCompanyPostedCopyWith(InternshipCompanyPosted value, $Res Function(InternshipCompanyPosted) _then) = _$InternshipCompanyPostedCopyWithImpl;
@useResult
$Res call({
 InternshipCompanyDetails? companyDetails, String? profileImageUrl
});


$InternshipCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class _$InternshipCompanyPostedCopyWithImpl<$Res>
    implements $InternshipCompanyPostedCopyWith<$Res> {
  _$InternshipCompanyPostedCopyWithImpl(this._self, this._then);

  final InternshipCompanyPosted _self;
  final $Res Function(InternshipCompanyPosted) _then;

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyDetails = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_self.copyWith(
companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as InternshipCompanyDetails?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of InternshipCompanyPosted
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InternshipCompanyDetails? companyDetails,  String? profileImageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
return $default(_that.companyDetails,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InternshipCompanyDetails? companyDetails,  String? profileImageUrl)  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted():
return $default(_that.companyDetails,_that.profileImageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InternshipCompanyDetails? companyDetails,  String? profileImageUrl)?  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyPosted() when $default != null:
return $default(_that.companyDetails,_that.profileImageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipCompanyPosted implements InternshipCompanyPosted {
  const _InternshipCompanyPosted({this.companyDetails, this.profileImageUrl});
  factory _InternshipCompanyPosted.fromJson(Map<String, dynamic> json) => _$InternshipCompanyPostedFromJson(json);

@override final  InternshipCompanyDetails? companyDetails;
@override final  String? profileImageUrl;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipCompanyPosted&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyDetails,profileImageUrl);

@override
String toString() {
  return 'InternshipCompanyPosted(companyDetails: $companyDetails, profileImageUrl: $profileImageUrl)';
}


}

/// @nodoc
abstract mixin class _$InternshipCompanyPostedCopyWith<$Res> implements $InternshipCompanyPostedCopyWith<$Res> {
  factory _$InternshipCompanyPostedCopyWith(_InternshipCompanyPosted value, $Res Function(_InternshipCompanyPosted) _then) = __$InternshipCompanyPostedCopyWithImpl;
@override @useResult
$Res call({
 InternshipCompanyDetails? companyDetails, String? profileImageUrl
});


@override $InternshipCompanyDetailsCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class __$InternshipCompanyPostedCopyWithImpl<$Res>
    implements _$InternshipCompanyPostedCopyWith<$Res> {
  __$InternshipCompanyPostedCopyWithImpl(this._self, this._then);

  final _InternshipCompanyPosted _self;
  final $Res Function(_InternshipCompanyPosted) _then;

/// Create a copy of InternshipCompanyPosted
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyDetails = freezed,Object? profileImageUrl = freezed,}) {
  return _then(_InternshipCompanyPosted(
companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as InternshipCompanyDetails?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of InternshipCompanyPosted
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
mixin _$InternshipCompanyDetails {

 String? get companyName;
/// Create a copy of InternshipCompanyDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InternshipCompanyDetailsCopyWith<InternshipCompanyDetails> get copyWith => _$InternshipCompanyDetailsCopyWithImpl<InternshipCompanyDetails>(this as InternshipCompanyDetails, _$identity);

  /// Serializes this InternshipCompanyDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InternshipCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName);

@override
String toString() {
  return 'InternshipCompanyDetails(companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class $InternshipCompanyDetailsCopyWith<$Res>  {
  factory $InternshipCompanyDetailsCopyWith(InternshipCompanyDetails value, $Res Function(InternshipCompanyDetails) _then) = _$InternshipCompanyDetailsCopyWithImpl;
@useResult
$Res call({
 String? companyName
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
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companyName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InternshipCompanyDetails() when $default != null:
return $default(_that.companyName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companyName)  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyDetails():
return $default(_that.companyName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companyName)?  $default,) {final _that = this;
switch (_that) {
case _InternshipCompanyDetails() when $default != null:
return $default(_that.companyName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InternshipCompanyDetails implements InternshipCompanyDetails {
  const _InternshipCompanyDetails({this.companyName});
  factory _InternshipCompanyDetails.fromJson(Map<String, dynamic> json) => _$InternshipCompanyDetailsFromJson(json);

@override final  String? companyName;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternshipCompanyDetails&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName);

@override
String toString() {
  return 'InternshipCompanyDetails(companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class _$InternshipCompanyDetailsCopyWith<$Res> implements $InternshipCompanyDetailsCopyWith<$Res> {
  factory _$InternshipCompanyDetailsCopyWith(_InternshipCompanyDetails value, $Res Function(_InternshipCompanyDetails) _then) = __$InternshipCompanyDetailsCopyWithImpl;
@override @useResult
$Res call({
 String? companyName
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
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,}) {
  return _then(_InternshipCompanyDetails(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
