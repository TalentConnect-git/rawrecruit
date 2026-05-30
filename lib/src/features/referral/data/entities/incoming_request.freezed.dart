// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incoming_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IncomingRequest {

@JsonKey(name: '_id') String? get id; String? get currentStatus; num? get matchScore; String? get createdAt; String? get jobTitle; String? get applicantName; String? get applicantEmail; String? get applicantPhone; List<String>? get skills; Map<String, dynamic>? get academicBackground;
/// Create a copy of IncomingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IncomingRequestCopyWith<IncomingRequest> get copyWith => _$IncomingRequestCopyWithImpl<IncomingRequest>(this as IncomingRequest, _$identity);

  /// Serializes this IncomingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IncomingRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.applicantName, applicantName) || other.applicantName == applicantName)&&(identical(other.applicantEmail, applicantEmail) || other.applicantEmail == applicantEmail)&&(identical(other.applicantPhone, applicantPhone) || other.applicantPhone == applicantPhone)&&const DeepCollectionEquality().equals(other.skills, skills)&&const DeepCollectionEquality().equals(other.academicBackground, academicBackground));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentStatus,matchScore,createdAt,jobTitle,applicantName,applicantEmail,applicantPhone,const DeepCollectionEquality().hash(skills),const DeepCollectionEquality().hash(academicBackground));

@override
String toString() {
  return 'IncomingRequest(id: $id, currentStatus: $currentStatus, matchScore: $matchScore, createdAt: $createdAt, jobTitle: $jobTitle, applicantName: $applicantName, applicantEmail: $applicantEmail, applicantPhone: $applicantPhone, skills: $skills, academicBackground: $academicBackground)';
}


}

/// @nodoc
abstract mixin class $IncomingRequestCopyWith<$Res>  {
  factory $IncomingRequestCopyWith(IncomingRequest value, $Res Function(IncomingRequest) _then) = _$IncomingRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? currentStatus, num? matchScore, String? createdAt, String? jobTitle, String? applicantName, String? applicantEmail, String? applicantPhone, List<String>? skills, Map<String, dynamic>? academicBackground
});




}
/// @nodoc
class _$IncomingRequestCopyWithImpl<$Res>
    implements $IncomingRequestCopyWith<$Res> {
  _$IncomingRequestCopyWithImpl(this._self, this._then);

  final IncomingRequest _self;
  final $Res Function(IncomingRequest) _then;

/// Create a copy of IncomingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? currentStatus = freezed,Object? matchScore = freezed,Object? createdAt = freezed,Object? jobTitle = freezed,Object? applicantName = freezed,Object? applicantEmail = freezed,Object? applicantPhone = freezed,Object? skills = freezed,Object? academicBackground = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,applicantName: freezed == applicantName ? _self.applicantName : applicantName // ignore: cast_nullable_to_non_nullable
as String?,applicantEmail: freezed == applicantEmail ? _self.applicantEmail : applicantEmail // ignore: cast_nullable_to_non_nullable
as String?,applicantPhone: freezed == applicantPhone ? _self.applicantPhone : applicantPhone // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self.skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,academicBackground: freezed == academicBackground ? _self.academicBackground : academicBackground // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [IncomingRequest].
extension IncomingRequestPatterns on IncomingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IncomingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncomingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IncomingRequest value)  $default,){
final _that = this;
switch (_that) {
case _IncomingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IncomingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _IncomingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? currentStatus,  num? matchScore,  String? createdAt,  String? jobTitle,  String? applicantName,  String? applicantEmail,  String? applicantPhone,  List<String>? skills,  Map<String, dynamic>? academicBackground)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncomingRequest() when $default != null:
return $default(_that.id,_that.currentStatus,_that.matchScore,_that.createdAt,_that.jobTitle,_that.applicantName,_that.applicantEmail,_that.applicantPhone,_that.skills,_that.academicBackground);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? currentStatus,  num? matchScore,  String? createdAt,  String? jobTitle,  String? applicantName,  String? applicantEmail,  String? applicantPhone,  List<String>? skills,  Map<String, dynamic>? academicBackground)  $default,) {final _that = this;
switch (_that) {
case _IncomingRequest():
return $default(_that.id,_that.currentStatus,_that.matchScore,_that.createdAt,_that.jobTitle,_that.applicantName,_that.applicantEmail,_that.applicantPhone,_that.skills,_that.academicBackground);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? currentStatus,  num? matchScore,  String? createdAt,  String? jobTitle,  String? applicantName,  String? applicantEmail,  String? applicantPhone,  List<String>? skills,  Map<String, dynamic>? academicBackground)?  $default,) {final _that = this;
switch (_that) {
case _IncomingRequest() when $default != null:
return $default(_that.id,_that.currentStatus,_that.matchScore,_that.createdAt,_that.jobTitle,_that.applicantName,_that.applicantEmail,_that.applicantPhone,_that.skills,_that.academicBackground);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IncomingRequest implements IncomingRequest {
  const _IncomingRequest({@JsonKey(name: '_id') this.id, this.currentStatus, this.matchScore, this.createdAt, this.jobTitle, this.applicantName, this.applicantEmail, this.applicantPhone, final  List<String>? skills, final  Map<String, dynamic>? academicBackground}): _skills = skills,_academicBackground = academicBackground;
  factory _IncomingRequest.fromJson(Map<String, dynamic> json) => _$IncomingRequestFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? currentStatus;
@override final  num? matchScore;
@override final  String? createdAt;
@override final  String? jobTitle;
@override final  String? applicantName;
@override final  String? applicantEmail;
@override final  String? applicantPhone;
 final  List<String>? _skills;
@override List<String>? get skills {
  final value = _skills;
  if (value == null) return null;
  if (_skills is EqualUnmodifiableListView) return _skills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _academicBackground;
@override Map<String, dynamic>? get academicBackground {
  final value = _academicBackground;
  if (value == null) return null;
  if (_academicBackground is EqualUnmodifiableMapView) return _academicBackground;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of IncomingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IncomingRequestCopyWith<_IncomingRequest> get copyWith => __$IncomingRequestCopyWithImpl<_IncomingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IncomingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncomingRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.matchScore, matchScore) || other.matchScore == matchScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.jobTitle, jobTitle) || other.jobTitle == jobTitle)&&(identical(other.applicantName, applicantName) || other.applicantName == applicantName)&&(identical(other.applicantEmail, applicantEmail) || other.applicantEmail == applicantEmail)&&(identical(other.applicantPhone, applicantPhone) || other.applicantPhone == applicantPhone)&&const DeepCollectionEquality().equals(other._skills, _skills)&&const DeepCollectionEquality().equals(other._academicBackground, _academicBackground));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,currentStatus,matchScore,createdAt,jobTitle,applicantName,applicantEmail,applicantPhone,const DeepCollectionEquality().hash(_skills),const DeepCollectionEquality().hash(_academicBackground));

@override
String toString() {
  return 'IncomingRequest(id: $id, currentStatus: $currentStatus, matchScore: $matchScore, createdAt: $createdAt, jobTitle: $jobTitle, applicantName: $applicantName, applicantEmail: $applicantEmail, applicantPhone: $applicantPhone, skills: $skills, academicBackground: $academicBackground)';
}


}

/// @nodoc
abstract mixin class _$IncomingRequestCopyWith<$Res> implements $IncomingRequestCopyWith<$Res> {
  factory _$IncomingRequestCopyWith(_IncomingRequest value, $Res Function(_IncomingRequest) _then) = __$IncomingRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? currentStatus, num? matchScore, String? createdAt, String? jobTitle, String? applicantName, String? applicantEmail, String? applicantPhone, List<String>? skills, Map<String, dynamic>? academicBackground
});




}
/// @nodoc
class __$IncomingRequestCopyWithImpl<$Res>
    implements _$IncomingRequestCopyWith<$Res> {
  __$IncomingRequestCopyWithImpl(this._self, this._then);

  final _IncomingRequest _self;
  final $Res Function(_IncomingRequest) _then;

/// Create a copy of IncomingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? currentStatus = freezed,Object? matchScore = freezed,Object? createdAt = freezed,Object? jobTitle = freezed,Object? applicantName = freezed,Object? applicantEmail = freezed,Object? applicantPhone = freezed,Object? skills = freezed,Object? academicBackground = freezed,}) {
  return _then(_IncomingRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,matchScore: freezed == matchScore ? _self.matchScore : matchScore // ignore: cast_nullable_to_non_nullable
as num?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,jobTitle: freezed == jobTitle ? _self.jobTitle : jobTitle // ignore: cast_nullable_to_non_nullable
as String?,applicantName: freezed == applicantName ? _self.applicantName : applicantName // ignore: cast_nullable_to_non_nullable
as String?,applicantEmail: freezed == applicantEmail ? _self.applicantEmail : applicantEmail // ignore: cast_nullable_to_non_nullable
as String?,applicantPhone: freezed == applicantPhone ? _self.applicantPhone : applicantPhone // ignore: cast_nullable_to_non_nullable
as String?,skills: freezed == skills ? _self._skills : skills // ignore: cast_nullable_to_non_nullable
as List<String>?,academicBackground: freezed == academicBackground ? _self._academicBackground : academicBackground // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
