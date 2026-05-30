// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'award.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Award {

@JsonKey(name: '_id') String? get id; String? get title; String? get organization; String? get startDate; String? get endDate; String? get description;
/// Create a copy of Award
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AwardCopyWith<Award> get copyWith => _$AwardCopyWithImpl<Award>(this as Award, _$identity);

  /// Serializes this Award to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Award&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,organization,startDate,endDate,description);

@override
String toString() {
  return 'Award(id: $id, title: $title, organization: $organization, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class $AwardCopyWith<$Res>  {
  factory $AwardCopyWith(Award value, $Res Function(Award) _then) = _$AwardCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? organization, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class _$AwardCopyWithImpl<$Res>
    implements $AwardCopyWith<$Res> {
  _$AwardCopyWithImpl(this._self, this._then);

  final Award _self;
  final $Res Function(Award) _then;

/// Create a copy of Award
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? organization = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Award].
extension AwardPatterns on Award {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Award value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Award() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Award value)  $default,){
final _that = this;
switch (_that) {
case _Award():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Award value)?  $default,){
final _that = this;
switch (_that) {
case _Award() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? organization,  String? startDate,  String? endDate,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Award() when $default != null:
return $default(_that.id,_that.title,_that.organization,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? title,  String? organization,  String? startDate,  String? endDate,  String? description)  $default,) {final _that = this;
switch (_that) {
case _Award():
return $default(_that.id,_that.title,_that.organization,_that.startDate,_that.endDate,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? title,  String? organization,  String? startDate,  String? endDate,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _Award() when $default != null:
return $default(_that.id,_that.title,_that.organization,_that.startDate,_that.endDate,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Award implements Award {
   _Award({@JsonKey(name: '_id') this.id, this.title, this.organization, this.startDate, this.endDate, this.description});
  factory _Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? title;
@override final  String? organization;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? description;

/// Create a copy of Award
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AwardCopyWith<_Award> get copyWith => __$AwardCopyWithImpl<_Award>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AwardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Award&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.organization, organization) || other.organization == organization)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,organization,startDate,endDate,description);

@override
String toString() {
  return 'Award(id: $id, title: $title, organization: $organization, startDate: $startDate, endDate: $endDate, description: $description)';
}


}

/// @nodoc
abstract mixin class _$AwardCopyWith<$Res> implements $AwardCopyWith<$Res> {
  factory _$AwardCopyWith(_Award value, $Res Function(_Award) _then) = __$AwardCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? title, String? organization, String? startDate, String? endDate, String? description
});




}
/// @nodoc
class __$AwardCopyWithImpl<$Res>
    implements _$AwardCopyWith<$Res> {
  __$AwardCopyWithImpl(this._self, this._then);

  final _Award _self;
  final $Res Function(_Award) _then;

/// Create a copy of Award
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? organization = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? description = freezed,}) {
  return _then(_Award(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,organization: freezed == organization ? _self.organization : organization // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
