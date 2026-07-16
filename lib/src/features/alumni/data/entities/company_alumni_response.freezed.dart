// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_alumni_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CompanyAlumniResponse {

@JsonKey(name: 'companiesChecked') List<CompanyChecked>? get companies;@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? get alumni;
/// Create a copy of CompanyAlumniResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyAlumniResponseCopyWith<CompanyAlumniResponse> get copyWith => _$CompanyAlumniResponseCopyWithImpl<CompanyAlumniResponse>(this as CompanyAlumniResponse, _$identity);

  /// Serializes this CompanyAlumniResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyAlumniResponse&&const DeepCollectionEquality().equals(other.companies, companies)&&const DeepCollectionEquality().equals(other.alumni, alumni));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(companies),const DeepCollectionEquality().hash(alumni));

@override
String toString() {
  return 'CompanyAlumniResponse(companies: $companies, alumni: $alumni)';
}


}

/// @nodoc
abstract mixin class $CompanyAlumniResponseCopyWith<$Res>  {
  factory $CompanyAlumniResponseCopyWith(CompanyAlumniResponse value, $Res Function(CompanyAlumniResponse) _then) = _$CompanyAlumniResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'companiesChecked') List<CompanyChecked>? companies,@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni
});




}
/// @nodoc
class _$CompanyAlumniResponseCopyWithImpl<$Res>
    implements $CompanyAlumniResponseCopyWith<$Res> {
  _$CompanyAlumniResponseCopyWithImpl(this._self, this._then);

  final CompanyAlumniResponse _self;
  final $Res Function(CompanyAlumniResponse) _then;

/// Create a copy of CompanyAlumniResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companies = freezed,Object? alumni = freezed,}) {
  return _then(_self.copyWith(
companies: freezed == companies ? _self.companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyChecked>?,alumni: freezed == alumni ? _self.alumni : alumni // ignore: cast_nullable_to_non_nullable
as Map<String, List<User>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyAlumniResponse].
extension CompanyAlumniResponsePatterns on CompanyAlumniResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyAlumniResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyAlumniResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyAlumniResponse value)  $default,){
final _that = this;
switch (_that) {
case _CompanyAlumniResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyAlumniResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyAlumniResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'companiesChecked')  List<CompanyChecked>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyAlumniResponse() when $default != null:
return $default(_that.companies,_that.alumni);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'companiesChecked')  List<CompanyChecked>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)  $default,) {final _that = this;
switch (_that) {
case _CompanyAlumniResponse():
return $default(_that.companies,_that.alumni);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'companiesChecked')  List<CompanyChecked>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)?  $default,) {final _that = this;
switch (_that) {
case _CompanyAlumniResponse() when $default != null:
return $default(_that.companies,_that.alumni);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyAlumniResponse implements CompanyAlumniResponse {
  const _CompanyAlumniResponse({@JsonKey(name: 'companiesChecked') final  List<CompanyChecked>? companies, @JsonKey(name: 'alumniByCompany') final  Map<String, List<User>>? alumni}): _companies = companies,_alumni = alumni;
  factory _CompanyAlumniResponse.fromJson(Map<String, dynamic> json) => _$CompanyAlumniResponseFromJson(json);

 final  List<CompanyChecked>? _companies;
@override@JsonKey(name: 'companiesChecked') List<CompanyChecked>? get companies {
  final value = _companies;
  if (value == null) return null;
  if (_companies is EqualUnmodifiableListView) return _companies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, List<User>>? _alumni;
@override@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? get alumni {
  final value = _alumni;
  if (value == null) return null;
  if (_alumni is EqualUnmodifiableMapView) return _alumni;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CompanyAlumniResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyAlumniResponseCopyWith<_CompanyAlumniResponse> get copyWith => __$CompanyAlumniResponseCopyWithImpl<_CompanyAlumniResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyAlumniResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyAlumniResponse&&const DeepCollectionEquality().equals(other._companies, _companies)&&const DeepCollectionEquality().equals(other._alumni, _alumni));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_companies),const DeepCollectionEquality().hash(_alumni));

@override
String toString() {
  return 'CompanyAlumniResponse(companies: $companies, alumni: $alumni)';
}


}

/// @nodoc
abstract mixin class _$CompanyAlumniResponseCopyWith<$Res> implements $CompanyAlumniResponseCopyWith<$Res> {
  factory _$CompanyAlumniResponseCopyWith(_CompanyAlumniResponse value, $Res Function(_CompanyAlumniResponse) _then) = __$CompanyAlumniResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'companiesChecked') List<CompanyChecked>? companies,@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni
});




}
/// @nodoc
class __$CompanyAlumniResponseCopyWithImpl<$Res>
    implements _$CompanyAlumniResponseCopyWith<$Res> {
  __$CompanyAlumniResponseCopyWithImpl(this._self, this._then);

  final _CompanyAlumniResponse _self;
  final $Res Function(_CompanyAlumniResponse) _then;

/// Create a copy of CompanyAlumniResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companies = freezed,Object? alumni = freezed,}) {
  return _then(_CompanyAlumniResponse(
companies: freezed == companies ? _self._companies : companies // ignore: cast_nullable_to_non_nullable
as List<CompanyChecked>?,alumni: freezed == alumni ? _self._alumni : alumni // ignore: cast_nullable_to_non_nullable
as Map<String, List<User>>?,
  ));
}


}


/// @nodoc
mixin _$CompanyChecked {

 String? get key; String? get canonicalId; String? get companyName; String? get displayName;
/// Create a copy of CompanyChecked
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompanyCheckedCopyWith<CompanyChecked> get copyWith => _$CompanyCheckedCopyWithImpl<CompanyChecked>(this as CompanyChecked, _$identity);

  /// Serializes this CompanyChecked to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyChecked&&(identical(other.key, key) || other.key == key)&&(identical(other.canonicalId, canonicalId) || other.canonicalId == canonicalId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,canonicalId,companyName,displayName);

@override
String toString() {
  return 'CompanyChecked(key: $key, canonicalId: $canonicalId, companyName: $companyName, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class $CompanyCheckedCopyWith<$Res>  {
  factory $CompanyCheckedCopyWith(CompanyChecked value, $Res Function(CompanyChecked) _then) = _$CompanyCheckedCopyWithImpl;
@useResult
$Res call({
 String? key, String? canonicalId, String? companyName, String? displayName
});




}
/// @nodoc
class _$CompanyCheckedCopyWithImpl<$Res>
    implements $CompanyCheckedCopyWith<$Res> {
  _$CompanyCheckedCopyWithImpl(this._self, this._then);

  final CompanyChecked _self;
  final $Res Function(CompanyChecked) _then;

/// Create a copy of CompanyChecked
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = freezed,Object? canonicalId = freezed,Object? companyName = freezed,Object? displayName = freezed,}) {
  return _then(_self.copyWith(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,canonicalId: freezed == canonicalId ? _self.canonicalId : canonicalId // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CompanyChecked].
extension CompanyCheckedPatterns on CompanyChecked {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CompanyChecked value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CompanyChecked() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CompanyChecked value)  $default,){
final _that = this;
switch (_that) {
case _CompanyChecked():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CompanyChecked value)?  $default,){
final _that = this;
switch (_that) {
case _CompanyChecked() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? key,  String? canonicalId,  String? companyName,  String? displayName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CompanyChecked() when $default != null:
return $default(_that.key,_that.canonicalId,_that.companyName,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? key,  String? canonicalId,  String? companyName,  String? displayName)  $default,) {final _that = this;
switch (_that) {
case _CompanyChecked():
return $default(_that.key,_that.canonicalId,_that.companyName,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? key,  String? canonicalId,  String? companyName,  String? displayName)?  $default,) {final _that = this;
switch (_that) {
case _CompanyChecked() when $default != null:
return $default(_that.key,_that.canonicalId,_that.companyName,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CompanyChecked implements CompanyChecked {
  const _CompanyChecked({this.key, this.canonicalId, this.companyName, this.displayName});
  factory _CompanyChecked.fromJson(Map<String, dynamic> json) => _$CompanyCheckedFromJson(json);

@override final  String? key;
@override final  String? canonicalId;
@override final  String? companyName;
@override final  String? displayName;

/// Create a copy of CompanyChecked
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompanyCheckedCopyWith<_CompanyChecked> get copyWith => __$CompanyCheckedCopyWithImpl<_CompanyChecked>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CompanyCheckedToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompanyChecked&&(identical(other.key, key) || other.key == key)&&(identical(other.canonicalId, canonicalId) || other.canonicalId == canonicalId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,canonicalId,companyName,displayName);

@override
String toString() {
  return 'CompanyChecked(key: $key, canonicalId: $canonicalId, companyName: $companyName, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$CompanyCheckedCopyWith<$Res> implements $CompanyCheckedCopyWith<$Res> {
  factory _$CompanyCheckedCopyWith(_CompanyChecked value, $Res Function(_CompanyChecked) _then) = __$CompanyCheckedCopyWithImpl;
@override @useResult
$Res call({
 String? key, String? canonicalId, String? companyName, String? displayName
});




}
/// @nodoc
class __$CompanyCheckedCopyWithImpl<$Res>
    implements _$CompanyCheckedCopyWith<$Res> {
  __$CompanyCheckedCopyWithImpl(this._self, this._then);

  final _CompanyChecked _self;
  final $Res Function(_CompanyChecked) _then;

/// Create a copy of CompanyChecked
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = freezed,Object? canonicalId = freezed,Object? companyName = freezed,Object? displayName = freezed,}) {
  return _then(_CompanyChecked(
key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,canonicalId: freezed == canonicalId ? _self.canonicalId : canonicalId // ignore: cast_nullable_to_non_nullable
as String?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
