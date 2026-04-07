import 'package:json_annotation/json_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

class UserOrStringConvertor implements JsonConverter<User?, Object?> {
  const UserOrStringConvertor();

  @override
  User? fromJson(Object? json) {
    if (json == null) return null;

    if (json is String) {
      return User(id: json);
    }

    if (json is Map<String, dynamic>) {
      return User.fromJson(json);
    }

    throw Exception('Invalid User format');
  }

  @override
  Object? toJson(User? object) {
    if (object == null) return null;

    return object.toJson();
  }
}
