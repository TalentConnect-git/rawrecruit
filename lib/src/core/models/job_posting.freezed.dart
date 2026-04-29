// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_posting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobPosting {

@JsonKey(name: '_id') String? get id;@JsonKey(name: 'userId') String? get userId; String? get profileImageUrl; String? get backgroundImageUrl; User? get employerDetails; CompanyDetail? get companyDetails;
/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPostingCopyWith<JobPosting> get copyWith => _$JobPostingCopyWithImpl<JobPosting>(this as JobPosting, _$identity);

  /// Serializes this JobPosting to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPosting&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'JobPosting(id: $id, userId: $userId, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class $JobPostingCopyWith<$Res>  {
  factory $JobPostingCopyWith(JobPosting value, $Res Function(JobPosting) _then) = _$JobPostingCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'userId') String? userId, String? profileImageUrl, String? backgroundImageUrl, User? employerDetails, CompanyDetail? companyDetails
});


$UserCopyWith<$Res>? get employerDetails;$CompanyDetailCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class _$JobPostingCopyWithImpl<$Res>
    implements $JobPostingCopyWith<$Res> {
  _$JobPostingCopyWithImpl(this._self, this._then);

  final JobPosting _self;
  final $Res Function(JobPosting) _then;

/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as User?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as CompanyDetail?,
  ));
}
/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDetailCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $CompanyDetailCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobPosting].
extension JobPostingPatterns on JobPosting {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPosting value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPosting() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPosting value)  $default,){
final _that = this;
switch (_that) {
case _JobPosting():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPosting value)?  $default,){
final _that = this;
switch (_that) {
case _JobPosting() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'userId')  String? userId,  String? profileImageUrl,  String? backgroundImageUrl,  User? employerDetails,  CompanyDetail? companyDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPosting() when $default != null:
return $default(_that.id,_that.userId,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'userId')  String? userId,  String? profileImageUrl,  String? backgroundImageUrl,  User? employerDetails,  CompanyDetail? companyDetails)  $default,) {final _that = this;
switch (_that) {
case _JobPosting():
return $default(_that.id,_that.userId,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id, @JsonKey(name: 'userId')  String? userId,  String? profileImageUrl,  String? backgroundImageUrl,  User? employerDetails,  CompanyDetail? companyDetails)?  $default,) {final _that = this;
switch (_that) {
case _JobPosting() when $default != null:
return $default(_that.id,_that.userId,_that.profileImageUrl,_that.backgroundImageUrl,_that.employerDetails,_that.companyDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPosting implements JobPosting {
  const _JobPosting({@JsonKey(name: '_id') this.id, @JsonKey(name: 'userId') this.userId, this.profileImageUrl, this.backgroundImageUrl, this.employerDetails, this.companyDetails});
  factory _JobPosting.fromJson(Map<String, dynamic> json) => _$JobPostingFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override@JsonKey(name: 'userId') final  String? userId;
@override final  String? profileImageUrl;
@override final  String? backgroundImageUrl;
@override final  User? employerDetails;
@override final  CompanyDetail? companyDetails;

/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPostingCopyWith<_JobPosting> get copyWith => __$JobPostingCopyWithImpl<_JobPosting>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPostingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPosting&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.backgroundImageUrl, backgroundImageUrl) || other.backgroundImageUrl == backgroundImageUrl)&&(identical(other.employerDetails, employerDetails) || other.employerDetails == employerDetails)&&(identical(other.companyDetails, companyDetails) || other.companyDetails == companyDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,profileImageUrl,backgroundImageUrl,employerDetails,companyDetails);

@override
String toString() {
  return 'JobPosting(id: $id, userId: $userId, profileImageUrl: $profileImageUrl, backgroundImageUrl: $backgroundImageUrl, employerDetails: $employerDetails, companyDetails: $companyDetails)';
}


}

/// @nodoc
abstract mixin class _$JobPostingCopyWith<$Res> implements $JobPostingCopyWith<$Res> {
  factory _$JobPostingCopyWith(_JobPosting value, $Res Function(_JobPosting) _then) = __$JobPostingCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id,@JsonKey(name: 'userId') String? userId, String? profileImageUrl, String? backgroundImageUrl, User? employerDetails, CompanyDetail? companyDetails
});


@override $UserCopyWith<$Res>? get employerDetails;@override $CompanyDetailCopyWith<$Res>? get companyDetails;

}
/// @nodoc
class __$JobPostingCopyWithImpl<$Res>
    implements _$JobPostingCopyWith<$Res> {
  __$JobPostingCopyWithImpl(this._self, this._then);

  final _JobPosting _self;
  final $Res Function(_JobPosting) _then;

/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? profileImageUrl = freezed,Object? backgroundImageUrl = freezed,Object? employerDetails = freezed,Object? companyDetails = freezed,}) {
  return _then(_JobPosting(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,backgroundImageUrl: freezed == backgroundImageUrl ? _self.backgroundImageUrl : backgroundImageUrl // ignore: cast_nullable_to_non_nullable
as String?,employerDetails: freezed == employerDetails ? _self.employerDetails : employerDetails // ignore: cast_nullable_to_non_nullable
as User?,companyDetails: freezed == companyDetails ? _self.companyDetails : companyDetails // ignore: cast_nullable_to_non_nullable
as CompanyDetail?,
  ));
}

/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get employerDetails {
    if (_self.employerDetails == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.employerDetails!, (value) {
    return _then(_self.copyWith(employerDetails: value));
  });
}/// Create a copy of JobPosting
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CompanyDetailCopyWith<$Res>? get companyDetails {
    if (_self.companyDetails == null) {
    return null;
  }

  return $CompanyDetailCopyWith<$Res>(_self.companyDetails!, (value) {
    return _then(_self.copyWith(companyDetails: value));
  });
}
}

// dart format on
