// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Notification {

@JsonKey(name: '_id') String? get id; String? get recipientId;@UserOrStringConvertor() User? get senderId; NotificationType? get type; String? get message; String? get referenceId; String? get fileUrl; String? get fileName; String? get eventTitle; String? get meetingLink; JobType? get jobType; bool? get read; String? get jobId; NotificationMeta? get meta; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCopyWith<Notification> get copyWith => _$NotificationCopyWithImpl<Notification>(this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Notification&&(identical(other.id, id) || other.id == id)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.meetingLink, meetingLink) || other.meetingLink == meetingLink)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.read, read) || other.read == read)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipientId,senderId,type,message,referenceId,fileUrl,fileName,eventTitle,meetingLink,jobType,read,jobId,meta,createdAt,updatedAt);

@override
String toString() {
  return 'Notification(id: $id, recipientId: $recipientId, senderId: $senderId, type: $type, message: $message, referenceId: $referenceId, fileUrl: $fileUrl, fileName: $fileName, eventTitle: $eventTitle, meetingLink: $meetingLink, jobType: $jobType, read: $read, jobId: $jobId, meta: $meta, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res>  {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) _then) = _$NotificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? recipientId,@UserOrStringConvertor() User? senderId, NotificationType? type, String? message, String? referenceId, String? fileUrl, String? fileName, String? eventTitle, String? meetingLink, JobType? jobType, bool? read, String? jobId, NotificationMeta? meta, DateTime? createdAt, DateTime? updatedAt
});


$UserCopyWith<$Res>? get senderId;$NotificationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$NotificationCopyWithImpl<$Res>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? recipientId = freezed,Object? senderId = freezed,Object? type = freezed,Object? message = freezed,Object? referenceId = freezed,Object? fileUrl = freezed,Object? fileName = freezed,Object? eventTitle = freezed,Object? meetingLink = freezed,Object? jobType = freezed,Object? read = freezed,Object? jobId = freezed,Object? meta = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as User?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,eventTitle: freezed == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String?,meetingLink: freezed == meetingLink ? _self.meetingLink : meetingLink // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as JobType?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as NotificationMeta?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get senderId {
    if (_self.senderId == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.senderId!, (value) {
    return _then(_self.copyWith(senderId: value));
  });
}/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $NotificationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [Notification].
extension NotificationPatterns on Notification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Notification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Notification value)  $default,){
final _that = this;
switch (_that) {
case _Notification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Notification value)?  $default,){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? recipientId, @UserOrStringConvertor()  User? senderId,  NotificationType? type,  String? message,  String? referenceId,  String? fileUrl,  String? fileName,  String? eventTitle,  String? meetingLink,  JobType? jobType,  bool? read,  String? jobId,  NotificationMeta? meta,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.recipientId,_that.senderId,_that.type,_that.message,_that.referenceId,_that.fileUrl,_that.fileName,_that.eventTitle,_that.meetingLink,_that.jobType,_that.read,_that.jobId,_that.meta,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? recipientId, @UserOrStringConvertor()  User? senderId,  NotificationType? type,  String? message,  String? referenceId,  String? fileUrl,  String? fileName,  String? eventTitle,  String? meetingLink,  JobType? jobType,  bool? read,  String? jobId,  NotificationMeta? meta,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Notification():
return $default(_that.id,_that.recipientId,_that.senderId,_that.type,_that.message,_that.referenceId,_that.fileUrl,_that.fileName,_that.eventTitle,_that.meetingLink,_that.jobType,_that.read,_that.jobId,_that.meta,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? recipientId, @UserOrStringConvertor()  User? senderId,  NotificationType? type,  String? message,  String? referenceId,  String? fileUrl,  String? fileName,  String? eventTitle,  String? meetingLink,  JobType? jobType,  bool? read,  String? jobId,  NotificationMeta? meta,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.recipientId,_that.senderId,_that.type,_that.message,_that.referenceId,_that.fileUrl,_that.fileName,_that.eventTitle,_that.meetingLink,_that.jobType,_that.read,_that.jobId,_that.meta,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notification implements Notification {
  const _Notification({@JsonKey(name: '_id') this.id, this.recipientId, @UserOrStringConvertor() this.senderId, this.type, this.message, this.referenceId, this.fileUrl, this.fileName, this.eventTitle, this.meetingLink, this.jobType, this.read = false, this.jobId, this.meta, this.createdAt, this.updatedAt});
  factory _Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? recipientId;
@override@UserOrStringConvertor() final  User? senderId;
@override final  NotificationType? type;
@override final  String? message;
@override final  String? referenceId;
@override final  String? fileUrl;
@override final  String? fileName;
@override final  String? eventTitle;
@override final  String? meetingLink;
@override final  JobType? jobType;
@override@JsonKey() final  bool? read;
@override final  String? jobId;
@override final  NotificationMeta? meta;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCopyWith<_Notification> get copyWith => __$NotificationCopyWithImpl<_Notification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notification&&(identical(other.id, id) || other.id == id)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.eventTitle, eventTitle) || other.eventTitle == eventTitle)&&(identical(other.meetingLink, meetingLink) || other.meetingLink == meetingLink)&&(identical(other.jobType, jobType) || other.jobType == jobType)&&(identical(other.read, read) || other.read == read)&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.meta, meta) || other.meta == meta)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipientId,senderId,type,message,referenceId,fileUrl,fileName,eventTitle,meetingLink,jobType,read,jobId,meta,createdAt,updatedAt);

@override
String toString() {
  return 'Notification(id: $id, recipientId: $recipientId, senderId: $senderId, type: $type, message: $message, referenceId: $referenceId, fileUrl: $fileUrl, fileName: $fileName, eventTitle: $eventTitle, meetingLink: $meetingLink, jobType: $jobType, read: $read, jobId: $jobId, meta: $meta, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(_Notification value, $Res Function(_Notification) _then) = __$NotificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? recipientId,@UserOrStringConvertor() User? senderId, NotificationType? type, String? message, String? referenceId, String? fileUrl, String? fileName, String? eventTitle, String? meetingLink, JobType? jobType, bool? read, String? jobId, NotificationMeta? meta, DateTime? createdAt, DateTime? updatedAt
});


@override $UserCopyWith<$Res>? get senderId;@override $NotificationMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? recipientId = freezed,Object? senderId = freezed,Object? type = freezed,Object? message = freezed,Object? referenceId = freezed,Object? fileUrl = freezed,Object? fileName = freezed,Object? eventTitle = freezed,Object? meetingLink = freezed,Object? jobType = freezed,Object? read = freezed,Object? jobId = freezed,Object? meta = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Notification(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as User?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as NotificationType?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: freezed == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,eventTitle: freezed == eventTitle ? _self.eventTitle : eventTitle // ignore: cast_nullable_to_non_nullable
as String?,meetingLink: freezed == meetingLink ? _self.meetingLink : meetingLink // ignore: cast_nullable_to_non_nullable
as String?,jobType: freezed == jobType ? _self.jobType : jobType // ignore: cast_nullable_to_non_nullable
as JobType?,read: freezed == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool?,jobId: freezed == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as String?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as NotificationMeta?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get senderId {
    if (_self.senderId == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.senderId!, (value) {
    return _then(_self.copyWith(senderId: value));
  });
}/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $NotificationMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
