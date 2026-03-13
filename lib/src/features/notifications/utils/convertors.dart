import 'package:json_annotation/json_annotation.dart';

import '../../onboarding/data/entities/index.dart' show UserProfile;

class UserProfileOrStringConvertor
    implements JsonConverter<UserProfile?, Object?> {
  const UserProfileOrStringConvertor();

  @override
  UserProfile? fromJson(Object? json) {
    if (json == null) return null;

    if (json is String) {
      return UserProfile(id: json);
    }

    if (json is Map<String, dynamic>) {
      return UserProfile.fromJson(json);
    }

    throw Exception('Invalid UserProfile format');
  }

  @override
  Object? toJson(UserProfile? object) {
    if (object == null) return null;

    return object.toJson();
  }
}
