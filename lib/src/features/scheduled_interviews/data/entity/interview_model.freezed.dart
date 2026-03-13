// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterviewModel {

@JsonKey(name: '_id') String? get id;// Job reference
 InterviewJobRef? get jobId; String? get jobType; String? get applicationId;// Parties
 String? get companyAuthId; String? get applicantType; String? get applicantAuthId; String? get applicantProfileId;// Snapshots
 InterviewApplicantSnapshot? get applicantSnapshot; InterviewCoordinator? get coordinator; InterviewCompanySnapshot? get companySnapshot;// Details
 List<String>? get jobRole; String? get date; String? get time; String? get meetLink; String? get message; String? get status; String? get emailStatus;// Dates
 DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewModelCopyWith<InterviewModel> get copyWith => _$InterviewModelCopyWithImpl<InterviewModel>(this as InterviewModel, _$identity);

  /// Serializes this InterviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.companyAuthId, companyAuthId) || other.companyAuthId == companyAuthId)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.applicantAuthId, applicantAuthId) || other.applicantAuthId == applicantAuthId)&&(identical(other.applicantProfileId, applicantProfileId) || other.applicantProfileId == applicantProfileId)&&(identical(other.applicantSnapshot, applicantSnapshot) || other.applicantSnapshot == applicantSnapshot)&&(identical(other.coordinator, coordinator) || other.coordinator == coordinator)&&(identical(other.companySnapshot, companySnapshot) || other.companySnapshot == companySnapshot)&&const DeepCollectionEquality().equals(other.jobRole, jobRole)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.emailStatus, emailStatus) || other.emailStatus == emailStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobId,jobType,applicationId,companyAuthId,applicantType,applicantAuthId,applicantProfileId,applicantSnapshot,coordinator,companySnapshot,const DeepCollectionEquality().hash(jobRole),date,time,meetLink,message,status,emailStatus,createdAt,updatedAt]);

@override
String toString() {
  return 'InterviewModel(id: $id, jobId: $jobId, jobType: $jobType, applicationId: $applicationId, companyAuthId: $companyAuthId, applicantType: $applicantType, applicantAuthId: $applicantAuthId, applicantProfileId: $applicantProfileId, applicantSnapshot: $applicantSnapshot, coordinator: $coordinator, companySnapshot: $companySnapshot, jobRole: $jobRole, date: $date, time: $time, meetLink: $meetLink, message: $message, status: $status, emailStatus: $emailStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $InterviewModelCopyWith<$Res>  {
  factory $InterviewModelCopyWith(InterviewModel value, $Res Function(InterviewModel) _then) = _$InterviewModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, InterviewJobRef? jobId, String? jobType, String? applicationId, String? companyAuthId, String? applicantType, String? applicantAuthId, String? applicantProfileId, InterviewApplicantSnapshot? applicantSnapshot, InterviewCoordinator? coordinator, InterviewCompanySnapshot? companySnapshot, List<String>? jobRole, String? date, String? time, String? meetLink, String? message, String? status, String? emailStatus, DateTime? createdAt, DateTime? updatedAt
});


$InterviewJobRefCopyWith<$Res>? get jobId;$InterviewApplicantSnapshotCopyWith<$Res>? get applicantSnapshot;$InterviewCoordinatorCopyWith<$Res>? get coordinator;$InterviewCompanySnapshotCopyWith<$Res>? get companySnapshot;

}
/// @nodoc
class _$InterviewModelCopyWithImpl<$Res>
    implements $InterviewModelCopyWith<$Res> {
  _$InterviewModelCopyWithImpl(this._self, this._then);

  final InterviewModel _self;
  final $Res Function(InterviewModel) _then;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobId = freezed,Object? jobType = freezed,Object? applicationId = freezed,Object? companyAuthId = freezed,Object? applicantType = freezed,Object? applicantAuthId = freezed,Object? applicantProfileId = freezed,Object? applicantSnapshot = freezed,Object? coordinator = freezed,Object? companySnapshot = freezed,Object? jobRole = freezed,Object? date = freezed,Object? time = freezed,Object? meetLink = freezed,Object? message = freezed,Object? status = freezed,Object? emailStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as InterviewJobRef?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,companyAuthId: freezed == companyAuthId ? _self.companyAuthId : companyAuthId // ignore: cast_nullable_to_non_nullable
as String?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,applicantAuthId: freezed == applicantAuthId ? _self.applicantAuthId : applicantAuthId // ignore: cast_nullable_to_non_nullable
as String?,applicantProfileId: freezed == applicantProfileId ? _self.applicantProfileId : applicantProfileId // ignore: cast_nullable_to_non_nullable
as String?,applicantSnapshot: freezed == applicantSnapshot ? _self.applicantSnapshot : applicantSnapshot // ignore: cast_nullable_to_non_nullable
as InterviewApplicantSnapshot?,coordinator: freezed == coordinator ? _self.coordinator : coordinator // ignore: cast_nullable_to_non_nullable
as InterviewCoordinator?,companySnapshot: freezed == companySnapshot ? _self.companySnapshot : companySnapshot // ignore: cast_nullable_to_non_nullable
as InterviewCompanySnapshot?,jobRole: freezed == jobRole ? _self.jobRole : jobRole // ignore: cast_nullable_to_non_nullable
as List<String>?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,emailStatus: freezed == emailStatus ? _self.emailStatus : emailStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewJobRefCopyWith<$Res>? get jobId {
    if (_self.jobId == null) {
    return null;
  }

  return $InterviewJobRefCopyWith<$Res>(_self.jobId!, (value) {
    return _then(_self.copyWith(jobId: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewApplicantSnapshotCopyWith<$Res>? get applicantSnapshot {
    if (_self.applicantSnapshot == null) {
    return null;
  }

  return $InterviewApplicantSnapshotCopyWith<$Res>(_self.applicantSnapshot!, (value) {
    return _then(_self.copyWith(applicantSnapshot: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCoordinatorCopyWith<$Res>? get coordinator {
    if (_self.coordinator == null) {
    return null;
  }

  return $InterviewCoordinatorCopyWith<$Res>(_self.coordinator!, (value) {
    return _then(_self.copyWith(coordinator: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCompanySnapshotCopyWith<$Res>? get companySnapshot {
    if (_self.companySnapshot == null) {
    return null;
  }

  return $InterviewCompanySnapshotCopyWith<$Res>(_self.companySnapshot!, (value) {
    return _then(_self.copyWith(companySnapshot: value));
  });
}
}


/// Adds pattern-matching-related methods to [InterviewModel].
extension InterviewModelPatterns on InterviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewModel value)  $default,){
final _that = this;
switch (_that) {
case _InterviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  InterviewJobRef? jobId,  String? jobType,  String? applicationId,  String? companyAuthId,  String? applicantType,  String? applicantAuthId,  String? applicantProfileId,  InterviewApplicantSnapshot? applicantSnapshot,  InterviewCoordinator? coordinator,  InterviewCompanySnapshot? companySnapshot,  List<String>? jobRole,  String? date,  String? time,  String? meetLink,  String? message,  String? status,  String? emailStatus,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
return $default(_that.id,_that.jobId,_that.jobType,_that.applicationId,_that.companyAuthId,_that.applicantType,_that.applicantAuthId,_that.applicantProfileId,_that.applicantSnapshot,_that.coordinator,_that.companySnapshot,_that.jobRole,_that.date,_that.time,_that.meetLink,_that.message,_that.status,_that.emailStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  InterviewJobRef? jobId,  String? jobType,  String? applicationId,  String? companyAuthId,  String? applicantType,  String? applicantAuthId,  String? applicantProfileId,  InterviewApplicantSnapshot? applicantSnapshot,  InterviewCoordinator? coordinator,  InterviewCompanySnapshot? companySnapshot,  List<String>? jobRole,  String? date,  String? time,  String? meetLink,  String? message,  String? status,  String? emailStatus,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _InterviewModel():
return $default(_that.id,_that.jobId,_that.jobType,_that.applicationId,_that.companyAuthId,_that.applicantType,_that.applicantAuthId,_that.applicantProfileId,_that.applicantSnapshot,_that.coordinator,_that.companySnapshot,_that.jobRole,_that.date,_that.time,_that.meetLink,_that.message,_that.status,_that.emailStatus,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  InterviewJobRef? jobId,  String? jobType,  String? applicationId,  String? companyAuthId,  String? applicantType,  String? applicantAuthId,  String? applicantProfileId,  InterviewApplicantSnapshot? applicantSnapshot,  InterviewCoordinator? coordinator,  InterviewCompanySnapshot? companySnapshot,  List<String>? jobRole,  String? date,  String? time,  String? meetLink,  String? message,  String? status,  String? emailStatus,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _InterviewModel() when $default != null:
return $default(_that.id,_that.jobId,_that.jobType,_that.applicationId,_that.companyAuthId,_that.applicantType,_that.applicantAuthId,_that.applicantProfileId,_that.applicantSnapshot,_that.coordinator,_that.companySnapshot,_that.jobRole,_that.date,_that.time,_that.meetLink,_that.message,_that.status,_that.emailStatus,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewModel implements InterviewModel {
  const _InterviewModel({@JsonKey(name: '_id') this.id, this.jobId, this.jobType, this.applicationId, this.companyAuthId, this.applicantType, this.applicantAuthId, this.applicantProfileId, this.applicantSnapshot, this.coordinator, this.companySnapshot, final  List<String>? jobRole, this.date, this.time, this.meetLink, this.message, this.status, this.emailStatus, this.createdAt, this.updatedAt}): _jobRole = jobRole;
  factory _InterviewModel.fromJson(Map<String, dynamic> json) => _$InterviewModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
// Job reference
@override final  InterviewJobRef? jobId;
@override final  String? jobType;
@override final  String? applicationId;
// Parties
@override final  String? companyAuthId;
@override final  String? applicantType;
@override final  String? applicantAuthId;
@override final  String? applicantProfileId;
// Snapshots
@override final  InterviewApplicantSnapshot? applicantSnapshot;
@override final  InterviewCoordinator? coordinator;
@override final  InterviewCompanySnapshot? companySnapshot;
// Details
 final  List<String>? _jobRole;
// Details
@override List<String>? get jobRole {
  final value = _jobRole;
  if (value == null) return null;
  if (_jobRole is EqualUnmodifiableListView) return _jobRole;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? date;
@override final  String? time;
@override final  String? meetLink;
@override final  String? message;
@override final  String? status;
@override final  String? emailStatus;
// Dates
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewModelCopyWith<_InterviewModel> get copyWith => __$InterviewModelCopyWithImpl<_InterviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.companyAuthId, companyAuthId) || other.companyAuthId == companyAuthId)&&(identical(other.applicantType, applicantType) || other.applicantType == applicantType)&&(identical(other.applicantAuthId, applicantAuthId) || other.applicantAuthId == applicantAuthId)&&(identical(other.applicantProfileId, applicantProfileId) || other.applicantProfileId == applicantProfileId)&&(identical(other.applicantSnapshot, applicantSnapshot) || other.applicantSnapshot == applicantSnapshot)&&(identical(other.coordinator, coordinator) || other.coordinator == coordinator)&&(identical(other.companySnapshot, companySnapshot) || other.companySnapshot == companySnapshot)&&const DeepCollectionEquality().equals(other._jobRole, _jobRole)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.meetLink, meetLink) || other.meetLink == meetLink)&&(identical(other.message, message) || other.message == message)&&(identical(other.status, status) || other.status == status)&&(identical(other.emailStatus, emailStatus) || other.emailStatus == emailStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,jobId,jobType,applicationId,companyAuthId,applicantType,applicantAuthId,applicantProfileId,applicantSnapshot,coordinator,companySnapshot,const DeepCollectionEquality().hash(_jobRole),date,time,meetLink,message,status,emailStatus,createdAt,updatedAt]);

@override
String toString() {
  return 'InterviewModel(id: $id, jobId: $jobId, jobType: $jobType, applicationId: $applicationId, companyAuthId: $companyAuthId, applicantType: $applicantType, applicantAuthId: $applicantAuthId, applicantProfileId: $applicantProfileId, applicantSnapshot: $applicantSnapshot, coordinator: $coordinator, companySnapshot: $companySnapshot, jobRole: $jobRole, date: $date, time: $time, meetLink: $meetLink, message: $message, status: $status, emailStatus: $emailStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$InterviewModelCopyWith<$Res> implements $InterviewModelCopyWith<$Res> {
  factory _$InterviewModelCopyWith(_InterviewModel value, $Res Function(_InterviewModel) _then) = __$InterviewModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, InterviewJobRef? jobId, String? jobType, String? applicationId, String? companyAuthId, String? applicantType, String? applicantAuthId, String? applicantProfileId, InterviewApplicantSnapshot? applicantSnapshot, InterviewCoordinator? coordinator, InterviewCompanySnapshot? companySnapshot, List<String>? jobRole, String? date, String? time, String? meetLink, String? message, String? status, String? emailStatus, DateTime? createdAt, DateTime? updatedAt
});


@override $InterviewJobRefCopyWith<$Res>? get jobId;@override $InterviewApplicantSnapshotCopyWith<$Res>? get applicantSnapshot;@override $InterviewCoordinatorCopyWith<$Res>? get coordinator;@override $InterviewCompanySnapshotCopyWith<$Res>? get companySnapshot;

}
/// @nodoc
class __$InterviewModelCopyWithImpl<$Res>
    implements _$InterviewModelCopyWith<$Res> {
  __$InterviewModelCopyWithImpl(this._self, this._then);

  final _InterviewModel _self;
  final $Res Function(_InterviewModel) _then;

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobId = freezed,Object? jobType = freezed,Object? applicationId = freezed,Object? companyAuthId = freezed,Object? applicantType = freezed,Object? applicantAuthId = freezed,Object? applicantProfileId = freezed,Object? applicantSnapshot = freezed,Object? coordinator = freezed,Object? companySnapshot = freezed,Object? jobRole = freezed,Object? date = freezed,Object? time = freezed,Object? meetLink = freezed,Object? message = freezed,Object? status = freezed,Object? emailStatus = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_InterviewModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as InterviewJobRef?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,companyAuthId: freezed == companyAuthId ? _self.companyAuthId : companyAuthId // ignore: cast_nullable_to_non_nullable
as String?,applicantType: freezed == applicantType ? _self.applicantType : applicantType // ignore: cast_nullable_to_non_nullable
as String?,applicantAuthId: freezed == applicantAuthId ? _self.applicantAuthId : applicantAuthId // ignore: cast_nullable_to_non_nullable
as String?,applicantProfileId: freezed == applicantProfileId ? _self.applicantProfileId : applicantProfileId // ignore: cast_nullable_to_non_nullable
as String?,applicantSnapshot: freezed == applicantSnapshot ? _self.applicantSnapshot : applicantSnapshot // ignore: cast_nullable_to_non_nullable
as InterviewApplicantSnapshot?,coordinator: freezed == coordinator ? _self.coordinator : coordinator // ignore: cast_nullable_to_non_nullable
as InterviewCoordinator?,companySnapshot: freezed == companySnapshot ? _self.companySnapshot : companySnapshot // ignore: cast_nullable_to_non_nullable
as InterviewCompanySnapshot?,jobRole: freezed == jobRole ? _self._jobRole : jobRole // ignore: cast_nullable_to_non_nullable
as List<String>?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,meetLink: freezed == meetLink ? _self.meetLink : meetLink // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,emailStatus: freezed == emailStatus ? _self.emailStatus : emailStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewJobRefCopyWith<$Res>? get jobId {
    if (_self.jobId == null) {
    return null;
  }

  return $InterviewJobRefCopyWith<$Res>(_self.jobId!, (value) {
    return _then(_self.copyWith(jobId: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewApplicantSnapshotCopyWith<$Res>? get applicantSnapshot {
    if (_self.applicantSnapshot == null) {
    return null;
  }

  return $InterviewApplicantSnapshotCopyWith<$Res>(_self.applicantSnapshot!, (value) {
    return _then(_self.copyWith(applicantSnapshot: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCoordinatorCopyWith<$Res>? get coordinator {
    if (_self.coordinator == null) {
    return null;
  }

  return $InterviewCoordinatorCopyWith<$Res>(_self.coordinator!, (value) {
    return _then(_self.copyWith(coordinator: value));
  });
}/// Create a copy of InterviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewCompanySnapshotCopyWith<$Res>? get companySnapshot {
    if (_self.companySnapshot == null) {
    return null;
  }

  return $InterviewCompanySnapshotCopyWith<$Res>(_self.companySnapshot!, (value) {
    return _then(_self.copyWith(companySnapshot: value));
  });
}
}


/// @nodoc
mixin _$InterviewJobRef {

@JsonKey(name: '_id') String? get id; String? get jobType; String? get jobTitle; String? get companyName;
/// Create a copy of InterviewJobRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewJobRefCopyWith<InterviewJobRef> get copyWith => _$InterviewJobRefCopyWithImpl<InterviewJobRef>(this as InterviewJobRef, _$identity);

  /// Serializes this InterviewJobRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewJobRef&&(identical(other.id, id) || other.id == id)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobType,jobTitle,companyName);

@override
String toString() {
  return 'InterviewJobRef(id: $id, jobType: $jobType, jobTitle: $jobTitle, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class $InterviewJobRefCopyWith<$Res>  {
  factory $InterviewJobRefCopyWith(InterviewJobRef value, $Res Function(InterviewJobRef) _then) = _$InterviewJobRefCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobType, String? jobTitle, String? companyName
});




}
/// @nodoc
class _$InterviewJobRefCopyWithImpl<$Res>
    implements $InterviewJobRefCopyWith<$Res> {
  _$InterviewJobRefCopyWithImpl(this._self, this._then);

  final InterviewJobRef _self;
  final $Res Function(InterviewJobRef) _then;

/// Create a copy of InterviewJobRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobType = freezed,Object? jobTitle = freezed,Object? companyName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewJobRef].
extension InterviewJobRefPatterns on InterviewJobRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewJobRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewJobRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewJobRef value)  $default,){
final _that = this;
switch (_that) {
case _InterviewJobRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewJobRef value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewJobRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? jobTitle,  String? companyName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewJobRef() when $default != null:
return $default(_that.id,_that.jobType,_that.jobTitle,_that.companyName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? jobTitle,  String? companyName)  $default,) {final _that = this;
switch (_that) {
case _InterviewJobRef():
return $default(_that.id,_that.jobType,_that.jobTitle,_that.companyName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? jobTitle,  String? companyName)?  $default,) {final _that = this;
switch (_that) {
case _InterviewJobRef() when $default != null:
return $default(_that.id,_that.jobType,_that.jobTitle,_that.companyName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewJobRef implements InterviewJobRef {
  const _InterviewJobRef({@JsonKey(name: '_id') this.id, this.jobType, this.jobTitle, this.companyName});
  factory _InterviewJobRef.fromJson(Map<String, dynamic> json) => _$InterviewJobRefFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? jobType;
@override final  String? jobTitle;
@override final  String? companyName;

/// Create a copy of InterviewJobRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewJobRefCopyWith<_InterviewJobRef> get copyWith => __$InterviewJobRefCopyWithImpl<_InterviewJobRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewJobRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewJobRef&&(identical(other.id, id) || other.id == id)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.companyName, companyName) || other.companyName == companyName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobType,jobTitle,companyName);

@override
String toString() {
  return 'InterviewJobRef(id: $id, jobType: $jobType, jobTitle: $jobTitle, companyName: $companyName)';
}


}

/// @nodoc
abstract mixin class _$InterviewJobRefCopyWith<$Res> implements $InterviewJobRefCopyWith<$Res> {
  factory _$InterviewJobRefCopyWith(_InterviewJobRef value, $Res Function(_InterviewJobRef) _then) = __$InterviewJobRefCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobType, String? jobTitle, String? companyName
});




}
/// @nodoc
class __$InterviewJobRefCopyWithImpl<$Res>
    implements _$InterviewJobRefCopyWith<$Res> {
  __$InterviewJobRefCopyWithImpl(this._self, this._then);

  final _InterviewJobRef _self;
  final $Res Function(_InterviewJobRef) _then;

/// Create a copy of InterviewJobRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobType = freezed,Object? jobTitle = freezed,Object? companyName = freezed,}) {
  return _then(_InterviewJobRef(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InterviewApplicantSnapshot {

 String? get name; String? get collegeName; String? get designation; String? get profileType;
/// Create a copy of InterviewApplicantSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewApplicantSnapshotCopyWith<InterviewApplicantSnapshot> get copyWith => _$InterviewApplicantSnapshotCopyWithImpl<InterviewApplicantSnapshot>(this as InterviewApplicantSnapshot, _$identity);

  /// Serializes this InterviewApplicantSnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewApplicantSnapshot&&(identical(other.name, name) || other.name == name)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.profileType, profileType) || other.profileType == profileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,collegeName,designation,profileType);

@override
String toString() {
  return 'InterviewApplicantSnapshot(name: $name, collegeName: $collegeName, designation: $designation, profileType: $profileType)';
}


}

/// @nodoc
abstract mixin class $InterviewApplicantSnapshotCopyWith<$Res>  {
  factory $InterviewApplicantSnapshotCopyWith(InterviewApplicantSnapshot value, $Res Function(InterviewApplicantSnapshot) _then) = _$InterviewApplicantSnapshotCopyWithImpl;
@useResult
$Res call({
 String? name, String? collegeName, String? designation, String? profileType
});




}
/// @nodoc
class _$InterviewApplicantSnapshotCopyWithImpl<$Res>
    implements $InterviewApplicantSnapshotCopyWith<$Res> {
  _$InterviewApplicantSnapshotCopyWithImpl(this._self, this._then);

  final InterviewApplicantSnapshot _self;
  final $Res Function(InterviewApplicantSnapshot) _then;

/// Create a copy of InterviewApplicantSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? collegeName = freezed,Object? designation = freezed,Object? profileType = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewApplicantSnapshot].
extension InterviewApplicantSnapshotPatterns on InterviewApplicantSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewApplicantSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewApplicantSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewApplicantSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? collegeName,  String? designation,  String? profileType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot() when $default != null:
return $default(_that.name,_that.collegeName,_that.designation,_that.profileType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? collegeName,  String? designation,  String? profileType)  $default,) {final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot():
return $default(_that.name,_that.collegeName,_that.designation,_that.profileType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? collegeName,  String? designation,  String? profileType)?  $default,) {final _that = this;
switch (_that) {
case _InterviewApplicantSnapshot() when $default != null:
return $default(_that.name,_that.collegeName,_that.designation,_that.profileType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewApplicantSnapshot implements InterviewApplicantSnapshot {
  const _InterviewApplicantSnapshot({this.name, this.collegeName, this.designation, this.profileType});
  factory _InterviewApplicantSnapshot.fromJson(Map<String, dynamic> json) => _$InterviewApplicantSnapshotFromJson(json);

@override final  String? name;
@override final  String? collegeName;
@override final  String? designation;
@override final  String? profileType;

/// Create a copy of InterviewApplicantSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewApplicantSnapshotCopyWith<_InterviewApplicantSnapshot> get copyWith => __$InterviewApplicantSnapshotCopyWithImpl<_InterviewApplicantSnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewApplicantSnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewApplicantSnapshot&&(identical(other.name, name) || other.name == name)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.profileType, profileType) || other.profileType == profileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,collegeName,designation,profileType);

@override
String toString() {
  return 'InterviewApplicantSnapshot(name: $name, collegeName: $collegeName, designation: $designation, profileType: $profileType)';
}


}

/// @nodoc
abstract mixin class _$InterviewApplicantSnapshotCopyWith<$Res> implements $InterviewApplicantSnapshotCopyWith<$Res> {
  factory _$InterviewApplicantSnapshotCopyWith(_InterviewApplicantSnapshot value, $Res Function(_InterviewApplicantSnapshot) _then) = __$InterviewApplicantSnapshotCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? collegeName, String? designation, String? profileType
});




}
/// @nodoc
class __$InterviewApplicantSnapshotCopyWithImpl<$Res>
    implements _$InterviewApplicantSnapshotCopyWith<$Res> {
  __$InterviewApplicantSnapshotCopyWithImpl(this._self, this._then);

  final _InterviewApplicantSnapshot _self;
  final $Res Function(_InterviewApplicantSnapshot) _then;

/// Create a copy of InterviewApplicantSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? collegeName = freezed,Object? designation = freezed,Object? profileType = freezed,}) {
  return _then(_InterviewApplicantSnapshot(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,profileType: freezed == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InterviewCoordinator {

 String? get name; String? get designation; String? get collegeName;
/// Create a copy of InterviewCoordinator
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewCoordinatorCopyWith<InterviewCoordinator> get copyWith => _$InterviewCoordinatorCopyWithImpl<InterviewCoordinator>(this as InterviewCoordinator, _$identity);

  /// Serializes this InterviewCoordinator to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewCoordinator&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,collegeName);

@override
String toString() {
  return 'InterviewCoordinator(name: $name, designation: $designation, collegeName: $collegeName)';
}


}

/// @nodoc
abstract mixin class $InterviewCoordinatorCopyWith<$Res>  {
  factory $InterviewCoordinatorCopyWith(InterviewCoordinator value, $Res Function(InterviewCoordinator) _then) = _$InterviewCoordinatorCopyWithImpl;
@useResult
$Res call({
 String? name, String? designation, String? collegeName
});




}
/// @nodoc
class _$InterviewCoordinatorCopyWithImpl<$Res>
    implements $InterviewCoordinatorCopyWith<$Res> {
  _$InterviewCoordinatorCopyWithImpl(this._self, this._then);

  final InterviewCoordinator _self;
  final $Res Function(InterviewCoordinator) _then;

/// Create a copy of InterviewCoordinator
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? designation = freezed,Object? collegeName = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewCoordinator].
extension InterviewCoordinatorPatterns on InterviewCoordinator {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewCoordinator value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewCoordinator() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewCoordinator value)  $default,){
final _that = this;
switch (_that) {
case _InterviewCoordinator():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewCoordinator value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewCoordinator() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? collegeName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewCoordinator() when $default != null:
return $default(_that.name,_that.designation,_that.collegeName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? designation,  String? collegeName)  $default,) {final _that = this;
switch (_that) {
case _InterviewCoordinator():
return $default(_that.name,_that.designation,_that.collegeName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? designation,  String? collegeName)?  $default,) {final _that = this;
switch (_that) {
case _InterviewCoordinator() when $default != null:
return $default(_that.name,_that.designation,_that.collegeName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewCoordinator implements InterviewCoordinator {
  const _InterviewCoordinator({this.name, this.designation, this.collegeName});
  factory _InterviewCoordinator.fromJson(Map<String, dynamic> json) => _$InterviewCoordinatorFromJson(json);

@override final  String? name;
@override final  String? designation;
@override final  String? collegeName;

/// Create a copy of InterviewCoordinator
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewCoordinatorCopyWith<_InterviewCoordinator> get copyWith => __$InterviewCoordinatorCopyWithImpl<_InterviewCoordinator>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewCoordinatorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewCoordinator&&(identical(other.name, name) || other.name == name)&&(identical(other.designation, designation) || other.designation == designation)&&(identical(other.collegeName, collegeName) || other.collegeName == collegeName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,designation,collegeName);

@override
String toString() {
  return 'InterviewCoordinator(name: $name, designation: $designation, collegeName: $collegeName)';
}


}

/// @nodoc
abstract mixin class _$InterviewCoordinatorCopyWith<$Res> implements $InterviewCoordinatorCopyWith<$Res> {
  factory _$InterviewCoordinatorCopyWith(_InterviewCoordinator value, $Res Function(_InterviewCoordinator) _then) = __$InterviewCoordinatorCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? designation, String? collegeName
});




}
/// @nodoc
class __$InterviewCoordinatorCopyWithImpl<$Res>
    implements _$InterviewCoordinatorCopyWith<$Res> {
  __$InterviewCoordinatorCopyWithImpl(this._self, this._then);

  final _InterviewCoordinator _self;
  final $Res Function(_InterviewCoordinator) _then;

/// Create a copy of InterviewCoordinator
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? designation = freezed,Object? collegeName = freezed,}) {
  return _then(_InterviewCoordinator(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,collegeName: freezed == collegeName ? _self.collegeName : collegeName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$InterviewCompanySnapshot {

 String? get companyName; InterviewScheduledBy? get scheduledBy;
/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewCompanySnapshotCopyWith<InterviewCompanySnapshot> get copyWith => _$InterviewCompanySnapshotCopyWithImpl<InterviewCompanySnapshot>(this as InterviewCompanySnapshot, _$identity);

  /// Serializes this InterviewCompanySnapshot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewCompanySnapshot&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.scheduledBy, scheduledBy) || other.scheduledBy == scheduledBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,scheduledBy);

@override
String toString() {
  return 'InterviewCompanySnapshot(companyName: $companyName, scheduledBy: $scheduledBy)';
}


}

/// @nodoc
abstract mixin class $InterviewCompanySnapshotCopyWith<$Res>  {
  factory $InterviewCompanySnapshotCopyWith(InterviewCompanySnapshot value, $Res Function(InterviewCompanySnapshot) _then) = _$InterviewCompanySnapshotCopyWithImpl;
@useResult
$Res call({
 String? companyName, InterviewScheduledBy? scheduledBy
});


$InterviewScheduledByCopyWith<$Res>? get scheduledBy;

}
/// @nodoc
class _$InterviewCompanySnapshotCopyWithImpl<$Res>
    implements $InterviewCompanySnapshotCopyWith<$Res> {
  _$InterviewCompanySnapshotCopyWithImpl(this._self, this._then);

  final InterviewCompanySnapshot _self;
  final $Res Function(InterviewCompanySnapshot) _then;

/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? scheduledBy = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,scheduledBy: freezed == scheduledBy ? _self.scheduledBy : scheduledBy // ignore: cast_nullable_to_non_nullable
as InterviewScheduledBy?,
  ));
}
/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewScheduledByCopyWith<$Res>? get scheduledBy {
    if (_self.scheduledBy == null) {
    return null;
  }

  return $InterviewScheduledByCopyWith<$Res>(_self.scheduledBy!, (value) {
    return _then(_self.copyWith(scheduledBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [InterviewCompanySnapshot].
extension InterviewCompanySnapshotPatterns on InterviewCompanySnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewCompanySnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewCompanySnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewCompanySnapshot value)  $default,){
final _that = this;
switch (_that) {
case _InterviewCompanySnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewCompanySnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewCompanySnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companyName,  InterviewScheduledBy? scheduledBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewCompanySnapshot() when $default != null:
return $default(_that.companyName,_that.scheduledBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companyName,  InterviewScheduledBy? scheduledBy)  $default,) {final _that = this;
switch (_that) {
case _InterviewCompanySnapshot():
return $default(_that.companyName,_that.scheduledBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companyName,  InterviewScheduledBy? scheduledBy)?  $default,) {final _that = this;
switch (_that) {
case _InterviewCompanySnapshot() when $default != null:
return $default(_that.companyName,_that.scheduledBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewCompanySnapshot implements InterviewCompanySnapshot {
  const _InterviewCompanySnapshot({this.companyName, this.scheduledBy});
  factory _InterviewCompanySnapshot.fromJson(Map<String, dynamic> json) => _$InterviewCompanySnapshotFromJson(json);

@override final  String? companyName;
@override final  InterviewScheduledBy? scheduledBy;

/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewCompanySnapshotCopyWith<_InterviewCompanySnapshot> get copyWith => __$InterviewCompanySnapshotCopyWithImpl<_InterviewCompanySnapshot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewCompanySnapshotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewCompanySnapshot&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.scheduledBy, scheduledBy) || other.scheduledBy == scheduledBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,scheduledBy);

@override
String toString() {
  return 'InterviewCompanySnapshot(companyName: $companyName, scheduledBy: $scheduledBy)';
}


}

/// @nodoc
abstract mixin class _$InterviewCompanySnapshotCopyWith<$Res> implements $InterviewCompanySnapshotCopyWith<$Res> {
  factory _$InterviewCompanySnapshotCopyWith(_InterviewCompanySnapshot value, $Res Function(_InterviewCompanySnapshot) _then) = __$InterviewCompanySnapshotCopyWithImpl;
@override @useResult
$Res call({
 String? companyName, InterviewScheduledBy? scheduledBy
});


@override $InterviewScheduledByCopyWith<$Res>? get scheduledBy;

}
/// @nodoc
class __$InterviewCompanySnapshotCopyWithImpl<$Res>
    implements _$InterviewCompanySnapshotCopyWith<$Res> {
  __$InterviewCompanySnapshotCopyWithImpl(this._self, this._then);

  final _InterviewCompanySnapshot _self;
  final $Res Function(_InterviewCompanySnapshot) _then;

/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? scheduledBy = freezed,}) {
  return _then(_InterviewCompanySnapshot(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,scheduledBy: freezed == scheduledBy ? _self.scheduledBy : scheduledBy // ignore: cast_nullable_to_non_nullable
as InterviewScheduledBy?,
  ));
}

/// Create a copy of InterviewCompanySnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterviewScheduledByCopyWith<$Res>? get scheduledBy {
    if (_self.scheduledBy == null) {
    return null;
  }

  return $InterviewScheduledByCopyWith<$Res>(_self.scheduledBy!, (value) {
    return _then(_self.copyWith(scheduledBy: value));
  });
}
}


/// @nodoc
mixin _$InterviewScheduledBy {

 String? get name; String? get email; String? get designation;
/// Create a copy of InterviewScheduledBy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterviewScheduledByCopyWith<InterviewScheduledBy> get copyWith => _$InterviewScheduledByCopyWithImpl<InterviewScheduledBy>(this as InterviewScheduledBy, _$identity);

  /// Serializes this InterviewScheduledBy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterviewScheduledBy&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,designation);

@override
String toString() {
  return 'InterviewScheduledBy(name: $name, email: $email, designation: $designation)';
}


}

/// @nodoc
abstract mixin class $InterviewScheduledByCopyWith<$Res>  {
  factory $InterviewScheduledByCopyWith(InterviewScheduledBy value, $Res Function(InterviewScheduledBy) _then) = _$InterviewScheduledByCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? designation
});




}
/// @nodoc
class _$InterviewScheduledByCopyWithImpl<$Res>
    implements $InterviewScheduledByCopyWith<$Res> {
  _$InterviewScheduledByCopyWithImpl(this._self, this._then);

  final InterviewScheduledBy _self;
  final $Res Function(InterviewScheduledBy) _then;

/// Create a copy of InterviewScheduledBy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? designation = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [InterviewScheduledBy].
extension InterviewScheduledByPatterns on InterviewScheduledBy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterviewScheduledBy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterviewScheduledBy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterviewScheduledBy value)  $default,){
final _that = this;
switch (_that) {
case _InterviewScheduledBy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterviewScheduledBy value)?  $default,){
final _that = this;
switch (_that) {
case _InterviewScheduledBy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? designation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterviewScheduledBy() when $default != null:
return $default(_that.name,_that.email,_that.designation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? designation)  $default,) {final _that = this;
switch (_that) {
case _InterviewScheduledBy():
return $default(_that.name,_that.email,_that.designation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? designation)?  $default,) {final _that = this;
switch (_that) {
case _InterviewScheduledBy() when $default != null:
return $default(_that.name,_that.email,_that.designation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterviewScheduledBy implements InterviewScheduledBy {
  const _InterviewScheduledBy({this.name, this.email, this.designation});
  factory _InterviewScheduledBy.fromJson(Map<String, dynamic> json) => _$InterviewScheduledByFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? designation;

/// Create a copy of InterviewScheduledBy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterviewScheduledByCopyWith<_InterviewScheduledBy> get copyWith => __$InterviewScheduledByCopyWithImpl<_InterviewScheduledBy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterviewScheduledByToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterviewScheduledBy&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.designation, designation) || other.designation == designation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,designation);

@override
String toString() {
  return 'InterviewScheduledBy(name: $name, email: $email, designation: $designation)';
}


}

/// @nodoc
abstract mixin class _$InterviewScheduledByCopyWith<$Res> implements $InterviewScheduledByCopyWith<$Res> {
  factory _$InterviewScheduledByCopyWith(_InterviewScheduledBy value, $Res Function(_InterviewScheduledBy) _then) = __$InterviewScheduledByCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? designation
});




}
/// @nodoc
class __$InterviewScheduledByCopyWithImpl<$Res>
    implements _$InterviewScheduledByCopyWith<$Res> {
  __$InterviewScheduledByCopyWithImpl(this._self, this._then);

  final _InterviewScheduledBy _self;
  final $Res Function(_InterviewScheduledBy) _then;

/// Create a copy of InterviewScheduledBy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? designation = freezed,}) {
  return _then(_InterviewScheduledBy(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,designation: freezed == designation ? _self.designation : designation // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
