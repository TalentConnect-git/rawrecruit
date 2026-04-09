// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shortlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShortlistModel {

@JsonKey(name: '_id') String? get id; String? get jobType; String? get currentStatus; DateTime? get createdAt;@JsonKey(fromJson: _jobFromJson, toJson: _jobToJson) Job? get job;
/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortlistModelCopyWith<ShortlistModel> get copyWith => _$ShortlistModelCopyWithImpl<ShortlistModel>(this as ShortlistModel, _$identity);

  /// Serializes this ShortlistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobType,currentStatus,createdAt,job);

@override
String toString() {
  return 'ShortlistModel(id: $id, jobType: $jobType, currentStatus: $currentStatus, createdAt: $createdAt, job: $job)';
}


}

/// @nodoc
abstract mixin class $ShortlistModelCopyWith<$Res>  {
  factory $ShortlistModelCopyWith(ShortlistModel value, $Res Function(ShortlistModel) _then) = _$ShortlistModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobType, String? currentStatus, DateTime? createdAt,@JsonKey(fromJson: _jobFromJson, toJson: _jobToJson) Job? job
});


$JobCopyWith<$Res>? get job;

}
/// @nodoc
class _$ShortlistModelCopyWithImpl<$Res>
    implements $ShortlistModelCopyWith<$Res> {
  _$ShortlistModelCopyWithImpl(this._self, this._then);

  final ShortlistModel _self;
  final $Res Function(ShortlistModel) _then;

/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? jobType = freezed,Object? currentStatus = freezed,Object? createdAt = freezed,Object? job = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as Job?,
  ));
}
/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShortlistModel].
extension ShortlistModelPatterns on ShortlistModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShortlistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShortlistModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShortlistModel value)  $default,){
final _that = this;
switch (_that) {
case _ShortlistModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShortlistModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShortlistModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? currentStatus,  DateTime? createdAt, @JsonKey(fromJson: _jobFromJson, toJson: _jobToJson)  Job? job)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShortlistModel() when $default != null:
return $default(_that.id,_that.jobType,_that.currentStatus,_that.createdAt,_that.job);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? currentStatus,  DateTime? createdAt, @JsonKey(fromJson: _jobFromJson, toJson: _jobToJson)  Job? job)  $default,) {final _that = this;
switch (_that) {
case _ShortlistModel():
return $default(_that.id,_that.jobType,_that.currentStatus,_that.createdAt,_that.job);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? jobType,  String? currentStatus,  DateTime? createdAt, @JsonKey(fromJson: _jobFromJson, toJson: _jobToJson)  Job? job)?  $default,) {final _that = this;
switch (_that) {
case _ShortlistModel() when $default != null:
return $default(_that.id,_that.jobType,_that.currentStatus,_that.createdAt,_that.job);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShortlistModel implements ShortlistModel {
  const _ShortlistModel({@JsonKey(name: '_id') this.id, this.jobType, this.currentStatus, this.createdAt, @JsonKey(fromJson: _jobFromJson, toJson: _jobToJson) this.job});
  factory _ShortlistModel.fromJson(Map<String, dynamic> json) => _$ShortlistModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? jobType;
@override final  String? currentStatus;
@override final  DateTime? createdAt;
@override@JsonKey(fromJson: _jobFromJson, toJson: _jobToJson) final  Job? job;

/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortlistModelCopyWith<_ShortlistModel> get copyWith => __$ShortlistModelCopyWithImpl<_ShortlistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShortlistModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShortlistModel&&(identical(other.id, id) || other.id == id)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.currentStatus, currentStatus) || other.currentStatus == currentStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.job, job) || other.job == job));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,jobType,currentStatus,createdAt,job);

@override
String toString() {
  return 'ShortlistModel(id: $id, jobType: $jobType, currentStatus: $currentStatus, createdAt: $createdAt, job: $job)';
}


}

/// @nodoc
abstract mixin class _$ShortlistModelCopyWith<$Res> implements $ShortlistModelCopyWith<$Res> {
  factory _$ShortlistModelCopyWith(_ShortlistModel value, $Res Function(_ShortlistModel) _then) = __$ShortlistModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? jobType, String? currentStatus, DateTime? createdAt,@JsonKey(fromJson: _jobFromJson, toJson: _jobToJson) Job? job
});


@override $JobCopyWith<$Res>? get job;

}
/// @nodoc
class __$ShortlistModelCopyWithImpl<$Res>
    implements _$ShortlistModelCopyWith<$Res> {
  __$ShortlistModelCopyWithImpl(this._self, this._then);

  final _ShortlistModel _self;
  final $Res Function(_ShortlistModel) _then;

/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? jobType = freezed,Object? currentStatus = freezed,Object? createdAt = freezed,Object? job = freezed,}) {
  return _then(_ShortlistModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as String?,currentStatus: freezed == currentStatus ? _self.currentStatus : currentStatus // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as Job?,
  ));
}

/// Create a copy of ShortlistModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}
}

// dart format on
