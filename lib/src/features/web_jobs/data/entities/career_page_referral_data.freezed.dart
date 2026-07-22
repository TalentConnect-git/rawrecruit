// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'career_page_referral_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CareerPageReferralData {

 String? get companyName; String? get careerPageUrl; String? get sourceType; bool? get alumniFound; int get totalAlumniFound; int get totalRequestsSent; List<ReferralAlumni> get alumni; List<ReferralRequest> get requests;
/// Create a copy of CareerPageReferralData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CareerPageReferralDataCopyWith<CareerPageReferralData> get copyWith => _$CareerPageReferralDataCopyWithImpl<CareerPageReferralData>(this as CareerPageReferralData, _$identity);

  /// Serializes this CareerPageReferralData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CareerPageReferralData&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.careerPageUrl, careerPageUrl) || other.careerPageUrl == careerPageUrl)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.alumniFound, alumniFound) || other.alumniFound == alumniFound)&&(identical(other.totalAlumniFound, totalAlumniFound) || other.totalAlumniFound == totalAlumniFound)&&(identical(other.totalRequestsSent, totalRequestsSent) || other.totalRequestsSent == totalRequestsSent)&&const DeepCollectionEquality().equals(other.alumni, alumni)&&const DeepCollectionEquality().equals(other.requests, requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,careerPageUrl,sourceType,alumniFound,totalAlumniFound,totalRequestsSent,const DeepCollectionEquality().hash(alumni),const DeepCollectionEquality().hash(requests));

@override
String toString() {
  return 'CareerPageReferralData(companyName: $companyName, careerPageUrl: $careerPageUrl, sourceType: $sourceType, alumniFound: $alumniFound, totalAlumniFound: $totalAlumniFound, totalRequestsSent: $totalRequestsSent, alumni: $alumni, requests: $requests)';
}


}

/// @nodoc
abstract mixin class $CareerPageReferralDataCopyWith<$Res>  {
  factory $CareerPageReferralDataCopyWith(CareerPageReferralData value, $Res Function(CareerPageReferralData) _then) = _$CareerPageReferralDataCopyWithImpl;
@useResult
$Res call({
 String? companyName, String? careerPageUrl, String? sourceType, bool? alumniFound, int totalAlumniFound, int totalRequestsSent, List<ReferralAlumni> alumni, List<ReferralRequest> requests
});




}
/// @nodoc
class _$CareerPageReferralDataCopyWithImpl<$Res>
    implements $CareerPageReferralDataCopyWith<$Res> {
  _$CareerPageReferralDataCopyWithImpl(this._self, this._then);

  final CareerPageReferralData _self;
  final $Res Function(CareerPageReferralData) _then;

/// Create a copy of CareerPageReferralData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? careerPageUrl = freezed,Object? sourceType = freezed,Object? alumniFound = freezed,Object? totalAlumniFound = null,Object? totalRequestsSent = null,Object? alumni = null,Object? requests = null,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,careerPageUrl: freezed == careerPageUrl ? _self.careerPageUrl : careerPageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,alumniFound: freezed == alumniFound ? _self.alumniFound : alumniFound // ignore: cast_nullable_to_non_nullable
as bool?,totalAlumniFound: null == totalAlumniFound ? _self.totalAlumniFound : totalAlumniFound // ignore: cast_nullable_to_non_nullable
as int,totalRequestsSent: null == totalRequestsSent ? _self.totalRequestsSent : totalRequestsSent // ignore: cast_nullable_to_non_nullable
as int,alumni: null == alumni ? _self.alumni : alumni // ignore: cast_nullable_to_non_nullable
as List<ReferralAlumni>,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<ReferralRequest>,
  ));
}

}


/// Adds pattern-matching-related methods to [CareerPageReferralData].
extension CareerPageReferralDataPatterns on CareerPageReferralData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CareerPageReferralData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CareerPageReferralData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CareerPageReferralData value)  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CareerPageReferralData value)?  $default,){
final _that = this;
switch (_that) {
case _CareerPageReferralData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? companyName,  String? careerPageUrl,  String? sourceType,  bool? alumniFound,  int totalAlumniFound,  int totalRequestsSent,  List<ReferralAlumni> alumni,  List<ReferralRequest> requests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CareerPageReferralData() when $default != null:
return $default(_that.companyName,_that.careerPageUrl,_that.sourceType,_that.alumniFound,_that.totalAlumniFound,_that.totalRequestsSent,_that.alumni,_that.requests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? companyName,  String? careerPageUrl,  String? sourceType,  bool? alumniFound,  int totalAlumniFound,  int totalRequestsSent,  List<ReferralAlumni> alumni,  List<ReferralRequest> requests)  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralData():
return $default(_that.companyName,_that.careerPageUrl,_that.sourceType,_that.alumniFound,_that.totalAlumniFound,_that.totalRequestsSent,_that.alumni,_that.requests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? companyName,  String? careerPageUrl,  String? sourceType,  bool? alumniFound,  int totalAlumniFound,  int totalRequestsSent,  List<ReferralAlumni> alumni,  List<ReferralRequest> requests)?  $default,) {final _that = this;
switch (_that) {
case _CareerPageReferralData() when $default != null:
return $default(_that.companyName,_that.careerPageUrl,_that.sourceType,_that.alumniFound,_that.totalAlumniFound,_that.totalRequestsSent,_that.alumni,_that.requests);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CareerPageReferralData implements CareerPageReferralData {
  const _CareerPageReferralData({this.companyName, this.careerPageUrl, this.sourceType, this.alumniFound, this.totalAlumniFound = 0, this.totalRequestsSent = 0, final  List<ReferralAlumni> alumni = const [], final  List<ReferralRequest> requests = const []}): _alumni = alumni,_requests = requests;
  factory _CareerPageReferralData.fromJson(Map<String, dynamic> json) => _$CareerPageReferralDataFromJson(json);

@override final  String? companyName;
@override final  String? careerPageUrl;
@override final  String? sourceType;
@override final  bool? alumniFound;
@override@JsonKey() final  int totalAlumniFound;
@override@JsonKey() final  int totalRequestsSent;
 final  List<ReferralAlumni> _alumni;
@override@JsonKey() List<ReferralAlumni> get alumni {
  if (_alumni is EqualUnmodifiableListView) return _alumni;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alumni);
}

 final  List<ReferralRequest> _requests;
@override@JsonKey() List<ReferralRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}


/// Create a copy of CareerPageReferralData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CareerPageReferralDataCopyWith<_CareerPageReferralData> get copyWith => __$CareerPageReferralDataCopyWithImpl<_CareerPageReferralData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CareerPageReferralDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CareerPageReferralData&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.careerPageUrl, careerPageUrl) || other.careerPageUrl == careerPageUrl)&&(identical(other.sourceType, sourceType) || other.sourceType == sourceType)&&(identical(other.alumniFound, alumniFound) || other.alumniFound == alumniFound)&&(identical(other.totalAlumniFound, totalAlumniFound) || other.totalAlumniFound == totalAlumniFound)&&(identical(other.totalRequestsSent, totalRequestsSent) || other.totalRequestsSent == totalRequestsSent)&&const DeepCollectionEquality().equals(other._alumni, _alumni)&&const DeepCollectionEquality().equals(other._requests, _requests));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,careerPageUrl,sourceType,alumniFound,totalAlumniFound,totalRequestsSent,const DeepCollectionEquality().hash(_alumni),const DeepCollectionEquality().hash(_requests));

@override
String toString() {
  return 'CareerPageReferralData(companyName: $companyName, careerPageUrl: $careerPageUrl, sourceType: $sourceType, alumniFound: $alumniFound, totalAlumniFound: $totalAlumniFound, totalRequestsSent: $totalRequestsSent, alumni: $alumni, requests: $requests)';
}


}

/// @nodoc
abstract mixin class _$CareerPageReferralDataCopyWith<$Res> implements $CareerPageReferralDataCopyWith<$Res> {
  factory _$CareerPageReferralDataCopyWith(_CareerPageReferralData value, $Res Function(_CareerPageReferralData) _then) = __$CareerPageReferralDataCopyWithImpl;
@override @useResult
$Res call({
 String? companyName, String? careerPageUrl, String? sourceType, bool? alumniFound, int totalAlumniFound, int totalRequestsSent, List<ReferralAlumni> alumni, List<ReferralRequest> requests
});




}
/// @nodoc
class __$CareerPageReferralDataCopyWithImpl<$Res>
    implements _$CareerPageReferralDataCopyWith<$Res> {
  __$CareerPageReferralDataCopyWithImpl(this._self, this._then);

  final _CareerPageReferralData _self;
  final $Res Function(_CareerPageReferralData) _then;

/// Create a copy of CareerPageReferralData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? careerPageUrl = freezed,Object? sourceType = freezed,Object? alumniFound = freezed,Object? totalAlumniFound = null,Object? totalRequestsSent = null,Object? alumni = null,Object? requests = null,}) {
  return _then(_CareerPageReferralData(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,careerPageUrl: freezed == careerPageUrl ? _self.careerPageUrl : careerPageUrl // ignore: cast_nullable_to_non_nullable
as String?,sourceType: freezed == sourceType ? _self.sourceType : sourceType // ignore: cast_nullable_to_non_nullable
as String?,alumniFound: freezed == alumniFound ? _self.alumniFound : alumniFound // ignore: cast_nullable_to_non_nullable
as bool?,totalAlumniFound: null == totalAlumniFound ? _self.totalAlumniFound : totalAlumniFound // ignore: cast_nullable_to_non_nullable
as int,totalRequestsSent: null == totalRequestsSent ? _self.totalRequestsSent : totalRequestsSent // ignore: cast_nullable_to_non_nullable
as int,alumni: null == alumni ? _self._alumni : alumni // ignore: cast_nullable_to_non_nullable
as List<ReferralAlumni>,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<ReferralRequest>,
  ));
}


}

// dart format on
