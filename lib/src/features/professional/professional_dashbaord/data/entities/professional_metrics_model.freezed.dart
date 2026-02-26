// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'professional_metrics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfessionalMetricsModel {

 int? get totalJobsPosted; int? get approvedJobs; int? get rejectedJobs; int? get totalApplicationsDone;
/// Create a copy of ProfessionalMetricsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfessionalMetricsModelCopyWith<ProfessionalMetricsModel> get copyWith => _$ProfessionalMetricsModelCopyWithImpl<ProfessionalMetricsModel>(this as ProfessionalMetricsModel, _$identity);

  /// Serializes this ProfessionalMetricsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfessionalMetricsModel&&(identical(other.totalJobsPosted, totalJobsPosted) || other.totalJobsPosted == totalJobsPosted)&&(identical(other.approvedJobs, approvedJobs) || other.approvedJobs == approvedJobs)&&(identical(other.rejectedJobs, rejectedJobs) || other.rejectedJobs == rejectedJobs)&&(identical(other.totalApplicationsDone, totalApplicationsDone) || other.totalApplicationsDone == totalApplicationsDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJobsPosted,approvedJobs,rejectedJobs,totalApplicationsDone);

@override
String toString() {
  return 'ProfessionalMetricsModel(totalJobsPosted: $totalJobsPosted, approvedJobs: $approvedJobs, rejectedJobs: $rejectedJobs, totalApplicationsDone: $totalApplicationsDone)';
}


}

/// @nodoc
abstract mixin class $ProfessionalMetricsModelCopyWith<$Res>  {
  factory $ProfessionalMetricsModelCopyWith(ProfessionalMetricsModel value, $Res Function(ProfessionalMetricsModel) _then) = _$ProfessionalMetricsModelCopyWithImpl;
@useResult
$Res call({
 int? totalJobsPosted, int? approvedJobs, int? rejectedJobs, int? totalApplicationsDone
});




}
/// @nodoc
class _$ProfessionalMetricsModelCopyWithImpl<$Res>
    implements $ProfessionalMetricsModelCopyWith<$Res> {
  _$ProfessionalMetricsModelCopyWithImpl(this._self, this._then);

  final ProfessionalMetricsModel _self;
  final $Res Function(ProfessionalMetricsModel) _then;

/// Create a copy of ProfessionalMetricsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalJobsPosted = freezed,Object? approvedJobs = freezed,Object? rejectedJobs = freezed,Object? totalApplicationsDone = freezed,}) {
  return _then(_self.copyWith(
totalJobsPosted: freezed == totalJobsPosted ? _self.totalJobsPosted : totalJobsPosted // ignore: cast_nullable_to_non_nullable
as int?,approvedJobs: freezed == approvedJobs ? _self.approvedJobs : approvedJobs // ignore: cast_nullable_to_non_nullable
as int?,rejectedJobs: freezed == rejectedJobs ? _self.rejectedJobs : rejectedJobs // ignore: cast_nullable_to_non_nullable
as int?,totalApplicationsDone: freezed == totalApplicationsDone ? _self.totalApplicationsDone : totalApplicationsDone // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfessionalMetricsModel].
extension ProfessionalMetricsModelPatterns on ProfessionalMetricsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfessionalMetricsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfessionalMetricsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfessionalMetricsModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfessionalMetricsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfessionalMetricsModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfessionalMetricsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? totalJobsPosted,  int? approvedJobs,  int? rejectedJobs,  int? totalApplicationsDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfessionalMetricsModel() when $default != null:
return $default(_that.totalJobsPosted,_that.approvedJobs,_that.rejectedJobs,_that.totalApplicationsDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? totalJobsPosted,  int? approvedJobs,  int? rejectedJobs,  int? totalApplicationsDone)  $default,) {final _that = this;
switch (_that) {
case _ProfessionalMetricsModel():
return $default(_that.totalJobsPosted,_that.approvedJobs,_that.rejectedJobs,_that.totalApplicationsDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? totalJobsPosted,  int? approvedJobs,  int? rejectedJobs,  int? totalApplicationsDone)?  $default,) {final _that = this;
switch (_that) {
case _ProfessionalMetricsModel() when $default != null:
return $default(_that.totalJobsPosted,_that.approvedJobs,_that.rejectedJobs,_that.totalApplicationsDone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfessionalMetricsModel implements ProfessionalMetricsModel {
  const _ProfessionalMetricsModel({this.totalJobsPosted, this.approvedJobs, this.rejectedJobs, this.totalApplicationsDone});
  factory _ProfessionalMetricsModel.fromJson(Map<String, dynamic> json) => _$ProfessionalMetricsModelFromJson(json);

@override final  int? totalJobsPosted;
@override final  int? approvedJobs;
@override final  int? rejectedJobs;
@override final  int? totalApplicationsDone;

/// Create a copy of ProfessionalMetricsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfessionalMetricsModelCopyWith<_ProfessionalMetricsModel> get copyWith => __$ProfessionalMetricsModelCopyWithImpl<_ProfessionalMetricsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfessionalMetricsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfessionalMetricsModel&&(identical(other.totalJobsPosted, totalJobsPosted) || other.totalJobsPosted == totalJobsPosted)&&(identical(other.approvedJobs, approvedJobs) || other.approvedJobs == approvedJobs)&&(identical(other.rejectedJobs, rejectedJobs) || other.rejectedJobs == rejectedJobs)&&(identical(other.totalApplicationsDone, totalApplicationsDone) || other.totalApplicationsDone == totalApplicationsDone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalJobsPosted,approvedJobs,rejectedJobs,totalApplicationsDone);

@override
String toString() {
  return 'ProfessionalMetricsModel(totalJobsPosted: $totalJobsPosted, approvedJobs: $approvedJobs, rejectedJobs: $rejectedJobs, totalApplicationsDone: $totalApplicationsDone)';
}


}

/// @nodoc
abstract mixin class _$ProfessionalMetricsModelCopyWith<$Res> implements $ProfessionalMetricsModelCopyWith<$Res> {
  factory _$ProfessionalMetricsModelCopyWith(_ProfessionalMetricsModel value, $Res Function(_ProfessionalMetricsModel) _then) = __$ProfessionalMetricsModelCopyWithImpl;
@override @useResult
$Res call({
 int? totalJobsPosted, int? approvedJobs, int? rejectedJobs, int? totalApplicationsDone
});




}
/// @nodoc
class __$ProfessionalMetricsModelCopyWithImpl<$Res>
    implements _$ProfessionalMetricsModelCopyWith<$Res> {
  __$ProfessionalMetricsModelCopyWithImpl(this._self, this._then);

  final _ProfessionalMetricsModel _self;
  final $Res Function(_ProfessionalMetricsModel) _then;

/// Create a copy of ProfessionalMetricsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalJobsPosted = freezed,Object? approvedJobs = freezed,Object? rejectedJobs = freezed,Object? totalApplicationsDone = freezed,}) {
  return _then(_ProfessionalMetricsModel(
totalJobsPosted: freezed == totalJobsPosted ? _self.totalJobsPosted : totalJobsPosted // ignore: cast_nullable_to_non_nullable
as int?,approvedJobs: freezed == approvedJobs ? _self.approvedJobs : approvedJobs // ignore: cast_nullable_to_non_nullable
as int?,rejectedJobs: freezed == rejectedJobs ? _self.rejectedJobs : rejectedJobs // ignore: cast_nullable_to_non_nullable
as int?,totalApplicationsDone: freezed == totalApplicationsDone ? _self.totalApplicationsDone : totalApplicationsDone // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
