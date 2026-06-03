// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_status_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApplicationStatusHistory {

 String? get status;@JsonKey(name: '_id') String? get id; DateTime? get date;
/// Create a copy of ApplicationStatusHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationStatusHistoryCopyWith<ApplicationStatusHistory> get copyWith => _$ApplicationStatusHistoryCopyWithImpl<ApplicationStatusHistory>(this as ApplicationStatusHistory, _$identity);

  /// Serializes this ApplicationStatusHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationStatusHistory&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,id,date);

@override
String toString() {
  return 'ApplicationStatusHistory(status: $status, id: $id, date: $date)';
}


}

/// @nodoc
abstract mixin class $ApplicationStatusHistoryCopyWith<$Res>  {
  factory $ApplicationStatusHistoryCopyWith(ApplicationStatusHistory value, $Res Function(ApplicationStatusHistory) _then) = _$ApplicationStatusHistoryCopyWithImpl;
@useResult
$Res call({
 String? status,@JsonKey(name: '_id') String? id, DateTime? date
});




}
/// @nodoc
class _$ApplicationStatusHistoryCopyWithImpl<$Res>
    implements $ApplicationStatusHistoryCopyWith<$Res> {
  _$ApplicationStatusHistoryCopyWithImpl(this._self, this._then);

  final ApplicationStatusHistory _self;
  final $Res Function(ApplicationStatusHistory) _then;

/// Create a copy of ApplicationStatusHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? id = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationStatusHistory].
extension ApplicationStatusHistoryPatterns on ApplicationStatusHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationStatusHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationStatusHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationStatusHistory value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationStatusHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationStatusHistory value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationStatusHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status, @JsonKey(name: '_id')  String? id,  DateTime? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationStatusHistory() when $default != null:
return $default(_that.status,_that.id,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status, @JsonKey(name: '_id')  String? id,  DateTime? date)  $default,) {final _that = this;
switch (_that) {
case _ApplicationStatusHistory():
return $default(_that.status,_that.id,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status, @JsonKey(name: '_id')  String? id,  DateTime? date)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationStatusHistory() when $default != null:
return $default(_that.status,_that.id,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationStatusHistory implements ApplicationStatusHistory {
  const _ApplicationStatusHistory({this.status, @JsonKey(name: '_id') this.id, this.date});
  factory _ApplicationStatusHistory.fromJson(Map<String, dynamic> json) => _$ApplicationStatusHistoryFromJson(json);

@override final  String? status;
@override@JsonKey(name: '_id') final  String? id;
@override final  DateTime? date;

/// Create a copy of ApplicationStatusHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationStatusHistoryCopyWith<_ApplicationStatusHistory> get copyWith => __$ApplicationStatusHistoryCopyWithImpl<_ApplicationStatusHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationStatusHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationStatusHistory&&(identical(other.status, status) || other.status == status)&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,id,date);

@override
String toString() {
  return 'ApplicationStatusHistory(status: $status, id: $id, date: $date)';
}


}

/// @nodoc
abstract mixin class _$ApplicationStatusHistoryCopyWith<$Res> implements $ApplicationStatusHistoryCopyWith<$Res> {
  factory _$ApplicationStatusHistoryCopyWith(_ApplicationStatusHistory value, $Res Function(_ApplicationStatusHistory) _then) = __$ApplicationStatusHistoryCopyWithImpl;
@override @useResult
$Res call({
 String? status,@JsonKey(name: '_id') String? id, DateTime? date
});




}
/// @nodoc
class __$ApplicationStatusHistoryCopyWithImpl<$Res>
    implements _$ApplicationStatusHistoryCopyWith<$Res> {
  __$ApplicationStatusHistoryCopyWithImpl(this._self, this._then);

  final _ApplicationStatusHistory _self;
  final $Res Function(_ApplicationStatusHistory) _then;

/// Create a copy of ApplicationStatusHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? id = freezed,Object? date = freezed,}) {
  return _then(_ApplicationStatusHistory(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
