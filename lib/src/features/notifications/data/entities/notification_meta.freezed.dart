// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationMeta {

 String? get topic; String? get subtopic; Map<String, dynamic>? get body;
/// Create a copy of NotificationMeta
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationMetaCopyWith<NotificationMeta> get copyWith => _$NotificationMetaCopyWithImpl<NotificationMeta>(this as NotificationMeta, _$identity);

  /// Serializes this NotificationMeta to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationMeta&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.subtopic, subtopic) || other.subtopic == subtopic)&&const DeepCollectionEquality().equals(other.body, body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,subtopic,const DeepCollectionEquality().hash(body));

@override
String toString() {
  return 'NotificationMeta(topic: $topic, subtopic: $subtopic, body: $body)';
}


}

/// @nodoc
abstract mixin class $NotificationMetaCopyWith<$Res>  {
  factory $NotificationMetaCopyWith(NotificationMeta value, $Res Function(NotificationMeta) _then) = _$NotificationMetaCopyWithImpl;
@useResult
$Res call({
 String? topic, String? subtopic, Map<String, dynamic>? body
});




}
/// @nodoc
class _$NotificationMetaCopyWithImpl<$Res>
    implements $NotificationMetaCopyWith<$Res> {
  _$NotificationMetaCopyWithImpl(this._self, this._then);

  final NotificationMeta _self;
  final $Res Function(NotificationMeta) _then;

/// Create a copy of NotificationMeta
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topic = freezed,Object? subtopic = freezed,Object? body = freezed,}) {
  return _then(_self.copyWith(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,subtopic: freezed == subtopic ? _self.subtopic : subtopic // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationMeta].
extension NotificationMetaPatterns on NotificationMeta {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationMeta value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationMeta() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationMeta value)  $default,){
final _that = this;
switch (_that) {
case _NotificationMeta():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationMeta value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationMeta() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? topic,  String? subtopic,  Map<String, dynamic>? body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationMeta() when $default != null:
return $default(_that.topic,_that.subtopic,_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? topic,  String? subtopic,  Map<String, dynamic>? body)  $default,) {final _that = this;
switch (_that) {
case _NotificationMeta():
return $default(_that.topic,_that.subtopic,_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? topic,  String? subtopic,  Map<String, dynamic>? body)?  $default,) {final _that = this;
switch (_that) {
case _NotificationMeta() when $default != null:
return $default(_that.topic,_that.subtopic,_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationMeta implements NotificationMeta {
  const _NotificationMeta({this.topic, this.subtopic, final  Map<String, dynamic>? body}): _body = body;
  factory _NotificationMeta.fromJson(Map<String, dynamic> json) => _$NotificationMetaFromJson(json);

@override final  String? topic;
@override final  String? subtopic;
 final  Map<String, dynamic>? _body;
@override Map<String, dynamic>? get body {
  final value = _body;
  if (value == null) return null;
  if (_body is EqualUnmodifiableMapView) return _body;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of NotificationMeta
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationMetaCopyWith<_NotificationMeta> get copyWith => __$NotificationMetaCopyWithImpl<_NotificationMeta>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationMetaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationMeta&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.subtopic, subtopic) || other.subtopic == subtopic)&&const DeepCollectionEquality().equals(other._body, _body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topic,subtopic,const DeepCollectionEquality().hash(_body));

@override
String toString() {
  return 'NotificationMeta(topic: $topic, subtopic: $subtopic, body: $body)';
}


}

/// @nodoc
abstract mixin class _$NotificationMetaCopyWith<$Res> implements $NotificationMetaCopyWith<$Res> {
  factory _$NotificationMetaCopyWith(_NotificationMeta value, $Res Function(_NotificationMeta) _then) = __$NotificationMetaCopyWithImpl;
@override @useResult
$Res call({
 String? topic, String? subtopic, Map<String, dynamic>? body
});




}
/// @nodoc
class __$NotificationMetaCopyWithImpl<$Res>
    implements _$NotificationMetaCopyWith<$Res> {
  __$NotificationMetaCopyWithImpl(this._self, this._then);

  final _NotificationMeta _self;
  final $Res Function(_NotificationMeta) _then;

/// Create a copy of NotificationMeta
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topic = freezed,Object? subtopic = freezed,Object? body = freezed,}) {
  return _then(_NotificationMeta(
topic: freezed == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String?,subtopic: freezed == subtopic ? _self.subtopic : subtopic // ignore: cast_nullable_to_non_nullable
as String?,body: freezed == body ? _self._body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
