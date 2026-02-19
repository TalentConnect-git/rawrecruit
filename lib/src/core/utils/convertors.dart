import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart'
    show
        UserType,
        UserTypeExt,
        AuthProvider,
        AuthProviderExt,
        UserStatus,
        UserStatusExt;

class AuthProviderConvertor implements JsonConverter<AuthProvider, String> {
  const AuthProviderConvertor();

  @override
  AuthProvider fromJson(String json) {
    return AuthProviderExt.fromValue(json);
  }

  @override
  String toJson(AuthProvider object) {
    return object.label;
  }
}

class UserTypeConverter implements JsonConverter<UserType, String> {
  const UserTypeConverter();

  @override
  UserType fromJson(String json) {
    return UserTypeExt.fromValue(json);
  }

  @override
  String toJson(UserType object) {
    return object.label;
  }
}

class UserStatusConvertor implements JsonConverter<UserStatus, String> {
  const UserStatusConvertor();

  @override
  UserStatus fromJson(String json) {
    return UserStatusExt.fromValue(json);
  }

  @override
  String toJson(UserStatus object) {
    return object.label;
  }
}
