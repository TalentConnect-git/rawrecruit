// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Auth _$AuthFromJson(Map<String, dynamic> json) => _Auth(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  email: json['email'] as String?,
  profileImage: json['profileImage'] as String?,
  linkedinId: json['linkedinId'] as String?,
  isNewUser: json['isNewUser'] as bool?,
  onboardingCompleted: json['onboardingCompleted'] as bool?,
  userType: _$JsonConverterFromJson<String, UserType>(
    json['userType'],
    const UserTypeConverter().fromJson,
  ),
  authProvider: _$JsonConverterFromJson<String, AuthProvider>(
    json['authProvider'],
    const AuthProviderConvertor().fromJson,
  ),
  userStatus: _$JsonConverterFromJson<String, UserStatus>(
    json['userStatus'],
    const UserStatusConvertor().fromJson,
  ),
);

Map<String, dynamic> _$AuthToJson(_Auth instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'profileImage': instance.profileImage,
  'linkedinId': instance.linkedinId,
  'isNewUser': instance.isNewUser,
  'onboardingCompleted': instance.onboardingCompleted,
  'userType': _$JsonConverterToJson<String, UserType>(
    instance.userType,
    const UserTypeConverter().toJson,
  ),
  'authProvider': _$JsonConverterToJson<String, AuthProvider>(
    instance.authProvider,
    const AuthProviderConvertor().toJson,
  ),
  'userStatus': _$JsonConverterToJson<String, UserStatus>(
    instance.userStatus,
    const UserStatusConvertor().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
