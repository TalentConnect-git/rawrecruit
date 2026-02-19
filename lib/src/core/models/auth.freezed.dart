// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Auth {

@JsonKey(name: '_id') String? get id; String? get name; String? get email; String? get profileImage; String? get linkedinId; bool? get isNewUser; bool? get onboardingCompleted;@UserTypeConverter() UserType? get userType;@AuthProviderConvertor() AuthProvider? get authProvider;@UserStatusConvertor() UserStatus? get userStatus;
/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthCopyWith<Auth> get copyWith => _$AuthCopyWithImpl<Auth>(this as Auth, _$identity);

  /// Serializes this Auth to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Auth&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.linkedinId, linkedinId) || other.linkedinId == linkedinId)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.userStatus, userStatus) || other.userStatus == userStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,profileImage,linkedinId,isNewUser,onboardingCompleted,userType,authProvider,userStatus);

@override
String toString() {
  return 'Auth(id: $id, name: $name, email: $email, profileImage: $profileImage, linkedinId: $linkedinId, isNewUser: $isNewUser, onboardingCompleted: $onboardingCompleted, userType: $userType, authProvider: $authProvider, userStatus: $userStatus)';
}


}

/// @nodoc
abstract mixin class $AuthCopyWith<$Res>  {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) _then) = _$AuthCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, String? email, String? profileImage, String? linkedinId, bool? isNewUser, bool? onboardingCompleted,@UserTypeConverter() UserType? userType,@AuthProviderConvertor() AuthProvider? authProvider,@UserStatusConvertor() UserStatus? userStatus
});




}
/// @nodoc
class _$AuthCopyWithImpl<$Res>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._self, this._then);

  final Auth _self;
  final $Res Function(Auth) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? profileImage = freezed,Object? linkedinId = freezed,Object? isNewUser = freezed,Object? onboardingCompleted = freezed,Object? userType = freezed,Object? authProvider = freezed,Object? userStatus = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,linkedinId: freezed == linkedinId ? _self.linkedinId : linkedinId // ignore: cast_nullable_to_non_nullable
as String?,isNewUser: freezed == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType?,authProvider: freezed == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as AuthProvider?,userStatus: freezed == userStatus ? _self.userStatus : userStatus // ignore: cast_nullable_to_non_nullable
as UserStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [Auth].
extension AuthPatterns on Auth {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Auth value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Auth() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Auth value)  $default,){
final _that = this;
switch (_that) {
case _Auth():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Auth value)?  $default,){
final _that = this;
switch (_that) {
case _Auth() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  String? email,  String? profileImage,  String? linkedinId,  bool? isNewUser,  bool? onboardingCompleted, @UserTypeConverter()  UserType? userType, @AuthProviderConvertor()  AuthProvider? authProvider, @UserStatusConvertor()  UserStatus? userStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Auth() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.profileImage,_that.linkedinId,_that.isNewUser,_that.onboardingCompleted,_that.userType,_that.authProvider,_that.userStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String? name,  String? email,  String? profileImage,  String? linkedinId,  bool? isNewUser,  bool? onboardingCompleted, @UserTypeConverter()  UserType? userType, @AuthProviderConvertor()  AuthProvider? authProvider, @UserStatusConvertor()  UserStatus? userStatus)  $default,) {final _that = this;
switch (_that) {
case _Auth():
return $default(_that.id,_that.name,_that.email,_that.profileImage,_that.linkedinId,_that.isNewUser,_that.onboardingCompleted,_that.userType,_that.authProvider,_that.userStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String? name,  String? email,  String? profileImage,  String? linkedinId,  bool? isNewUser,  bool? onboardingCompleted, @UserTypeConverter()  UserType? userType, @AuthProviderConvertor()  AuthProvider? authProvider, @UserStatusConvertor()  UserStatus? userStatus)?  $default,) {final _that = this;
switch (_that) {
case _Auth() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.profileImage,_that.linkedinId,_that.isNewUser,_that.onboardingCompleted,_that.userType,_that.authProvider,_that.userStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Auth implements Auth {
  const _Auth({@JsonKey(name: '_id') this.id, this.name, this.email, this.profileImage, this.linkedinId, this.isNewUser, this.onboardingCompleted, @UserTypeConverter() this.userType, @AuthProviderConvertor() this.authProvider, @UserStatusConvertor() this.userStatus});
  factory _Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String? name;
@override final  String? email;
@override final  String? profileImage;
@override final  String? linkedinId;
@override final  bool? isNewUser;
@override final  bool? onboardingCompleted;
@override@UserTypeConverter() final  UserType? userType;
@override@AuthProviderConvertor() final  AuthProvider? authProvider;
@override@UserStatusConvertor() final  UserStatus? userStatus;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthCopyWith<_Auth> get copyWith => __$AuthCopyWithImpl<_Auth>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Auth&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.linkedinId, linkedinId) || other.linkedinId == linkedinId)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.authProvider, authProvider) || other.authProvider == authProvider)&&(identical(other.userStatus, userStatus) || other.userStatus == userStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,profileImage,linkedinId,isNewUser,onboardingCompleted,userType,authProvider,userStatus);

@override
String toString() {
  return 'Auth(id: $id, name: $name, email: $email, profileImage: $profileImage, linkedinId: $linkedinId, isNewUser: $isNewUser, onboardingCompleted: $onboardingCompleted, userType: $userType, authProvider: $authProvider, userStatus: $userStatus)';
}


}

/// @nodoc
abstract mixin class _$AuthCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) _then) = __$AuthCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String? name, String? email, String? profileImage, String? linkedinId, bool? isNewUser, bool? onboardingCompleted,@UserTypeConverter() UserType? userType,@AuthProviderConvertor() AuthProvider? authProvider,@UserStatusConvertor() UserStatus? userStatus
});




}
/// @nodoc
class __$AuthCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(this._self, this._then);

  final _Auth _self;
  final $Res Function(_Auth) _then;

/// Create a copy of Auth
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? profileImage = freezed,Object? linkedinId = freezed,Object? isNewUser = freezed,Object? onboardingCompleted = freezed,Object? userType = freezed,Object? authProvider = freezed,Object? userStatus = freezed,}) {
  return _then(_Auth(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,linkedinId: freezed == linkedinId ? _self.linkedinId : linkedinId // ignore: cast_nullable_to_non_nullable
as String?,isNewUser: freezed == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool?,onboardingCompleted: freezed == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as UserType?,authProvider: freezed == authProvider ? _self.authProvider : authProvider // ignore: cast_nullable_to_non_nullable
as AuthProvider?,userStatus: freezed == userStatus ? _self.userStatus : userStatus // ignore: cast_nullable_to_non_nullable
as UserStatus?,
  ));
}


}

// dart format on
