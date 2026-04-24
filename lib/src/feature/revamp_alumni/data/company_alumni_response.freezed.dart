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

@JsonKey(name: 'companiesChecked') List<String>? get companies;@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? get alumni;
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
@JsonKey(name: 'companiesChecked') List<String>? companies,@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni
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
as List<String>?,alumni: freezed == alumni ? _self.alumni : alumni // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'companiesChecked')  List<String>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'companiesChecked')  List<String>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'companiesChecked')  List<String>? companies, @JsonKey(name: 'alumniByCompany')  Map<String, List<User>>? alumni)?  $default,) {final _that = this;
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
  const _CompanyAlumniResponse({@JsonKey(name: 'companiesChecked') final  List<String>? companies, @JsonKey(name: 'alumniByCompany') final  Map<String, List<User>>? alumni}): _companies = companies,_alumni = alumni;
  factory _CompanyAlumniResponse.fromJson(Map<String, dynamic> json) => _$CompanyAlumniResponseFromJson(json);

 final  List<String>? _companies;
@override@JsonKey(name: 'companiesChecked') List<String>? get companies {
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
@JsonKey(name: 'companiesChecked') List<String>? companies,@JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni
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
as List<String>?,alumni: freezed == alumni ? _self._alumni : alumni // ignore: cast_nullable_to_non_nullable
as Map<String, List<User>>?,
  ));
}


}

// dart format on
