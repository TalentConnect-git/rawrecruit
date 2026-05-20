// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Education {

 String? get college; String? get degree; String? get specialization; String? get semester; String? get cgpa; String? get yearOfGraduation; String? get startDate; String? get endDate; String? get educationType; bool? get isCurrent; String? get degreeCertificate;
/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EducationCopyWith<Education> get copyWith => _$EducationCopyWithImpl<Education>(this as Education, _$identity);

  /// Serializes this Education to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Education&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.educationType, educationType) || other.educationType == educationType)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,college,degree,specialization,semester,cgpa,yearOfGraduation,startDate,endDate,educationType,isCurrent,degreeCertificate);

@override
String toString() {
  return 'Education(college: $college, degree: $degree, specialization: $specialization, semester: $semester, cgpa: $cgpa, yearOfGraduation: $yearOfGraduation, startDate: $startDate, endDate: $endDate, educationType: $educationType, isCurrent: $isCurrent, degreeCertificate: $degreeCertificate)';
}


}

/// @nodoc
abstract mixin class $EducationCopyWith<$Res>  {
  factory $EducationCopyWith(Education value, $Res Function(Education) _then) = _$EducationCopyWithImpl;
@useResult
$Res call({
 String? college, String? degree, String? specialization, String? semester, String? cgpa, String? yearOfGraduation, String? startDate, String? endDate, String? educationType, bool? isCurrent, String? degreeCertificate
});




}
/// @nodoc
class _$EducationCopyWithImpl<$Res>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._self, this._then);

  final Education _self;
  final $Res Function(Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? college = freezed,Object? degree = freezed,Object? specialization = freezed,Object? semester = freezed,Object? cgpa = freezed,Object? yearOfGraduation = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? educationType = freezed,Object? isCurrent = freezed,Object? degreeCertificate = freezed,}) {
  return _then(_self.copyWith(
college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,educationType: freezed == educationType ? _self.educationType : educationType // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Education].
extension EducationPatterns on Education {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Education value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Education value)  $default,){
final _that = this;
switch (_that) {
case _Education():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Education value)?  $default,){
final _that = this;
switch (_that) {
case _Education() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? college,  String? degree,  String? specialization,  String? semester,  String? cgpa,  String? yearOfGraduation,  String? startDate,  String? endDate,  String? educationType,  bool? isCurrent,  String? degreeCertificate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.college,_that.degree,_that.specialization,_that.semester,_that.cgpa,_that.yearOfGraduation,_that.startDate,_that.endDate,_that.educationType,_that.isCurrent,_that.degreeCertificate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? college,  String? degree,  String? specialization,  String? semester,  String? cgpa,  String? yearOfGraduation,  String? startDate,  String? endDate,  String? educationType,  bool? isCurrent,  String? degreeCertificate)  $default,) {final _that = this;
switch (_that) {
case _Education():
return $default(_that.college,_that.degree,_that.specialization,_that.semester,_that.cgpa,_that.yearOfGraduation,_that.startDate,_that.endDate,_that.educationType,_that.isCurrent,_that.degreeCertificate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? college,  String? degree,  String? specialization,  String? semester,  String? cgpa,  String? yearOfGraduation,  String? startDate,  String? endDate,  String? educationType,  bool? isCurrent,  String? degreeCertificate)?  $default,) {final _that = this;
switch (_that) {
case _Education() when $default != null:
return $default(_that.college,_that.degree,_that.specialization,_that.semester,_that.cgpa,_that.yearOfGraduation,_that.startDate,_that.endDate,_that.educationType,_that.isCurrent,_that.degreeCertificate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Education implements Education {
  const _Education({this.college, this.degree, this.specialization, this.semester, this.cgpa, this.yearOfGraduation, this.startDate, this.endDate, this.educationType, this.isCurrent, this.degreeCertificate});
  factory _Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);

@override final  String? college;
@override final  String? degree;
@override final  String? specialization;
@override final  String? semester;
@override final  String? cgpa;
@override final  String? yearOfGraduation;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? educationType;
@override final  bool? isCurrent;
@override final  String? degreeCertificate;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EducationCopyWith<_Education> get copyWith => __$EducationCopyWithImpl<_Education>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EducationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Education&&(identical(other.college, college) || other.college == college)&&(identical(other.degree, degree) || other.degree == degree)&&(identical(other.specialization, specialization) || other.specialization == specialization)&&(identical(other.semester, semester) || other.semester == semester)&&(identical(other.cgpa, cgpa) || other.cgpa == cgpa)&&(identical(other.yearOfGraduation, yearOfGraduation) || other.yearOfGraduation == yearOfGraduation)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.educationType, educationType) || other.educationType == educationType)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.degreeCertificate, degreeCertificate) || other.degreeCertificate == degreeCertificate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,college,degree,specialization,semester,cgpa,yearOfGraduation,startDate,endDate,educationType,isCurrent,degreeCertificate);

@override
String toString() {
  return 'Education(college: $college, degree: $degree, specialization: $specialization, semester: $semester, cgpa: $cgpa, yearOfGraduation: $yearOfGraduation, startDate: $startDate, endDate: $endDate, educationType: $educationType, isCurrent: $isCurrent, degreeCertificate: $degreeCertificate)';
}


}

/// @nodoc
abstract mixin class _$EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$EducationCopyWith(_Education value, $Res Function(_Education) _then) = __$EducationCopyWithImpl;
@override @useResult
$Res call({
 String? college, String? degree, String? specialization, String? semester, String? cgpa, String? yearOfGraduation, String? startDate, String? endDate, String? educationType, bool? isCurrent, String? degreeCertificate
});




}
/// @nodoc
class __$EducationCopyWithImpl<$Res>
    implements _$EducationCopyWith<$Res> {
  __$EducationCopyWithImpl(this._self, this._then);

  final _Education _self;
  final $Res Function(_Education) _then;

/// Create a copy of Education
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? college = freezed,Object? degree = freezed,Object? specialization = freezed,Object? semester = freezed,Object? cgpa = freezed,Object? yearOfGraduation = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? educationType = freezed,Object? isCurrent = freezed,Object? degreeCertificate = freezed,}) {
  return _then(_Education(
college: freezed == college ? _self.college : college // ignore: cast_nullable_to_non_nullable
as String?,degree: freezed == degree ? _self.degree : degree // ignore: cast_nullable_to_non_nullable
as String?,specialization: freezed == specialization ? _self.specialization : specialization // ignore: cast_nullable_to_non_nullable
as String?,semester: freezed == semester ? _self.semester : semester // ignore: cast_nullable_to_non_nullable
as String?,cgpa: freezed == cgpa ? _self.cgpa : cgpa // ignore: cast_nullable_to_non_nullable
as String?,yearOfGraduation: freezed == yearOfGraduation ? _self.yearOfGraduation : yearOfGraduation // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,educationType: freezed == educationType ? _self.educationType : educationType // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: freezed == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool?,degreeCertificate: freezed == degreeCertificate ? _self.degreeCertificate : degreeCertificate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
