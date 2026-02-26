import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

class StringOrListConvertor implements JsonConverter<String?, dynamic> {
  const StringOrListConvertor();

  @override
  String? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is List && json.isNotEmpty) {
      return json.first.toString();
    }

    if (json is String) {
      return json;
    }

    return null;
  }

  @override
  dynamic toJson(String? object) {
    if (object == null || object.isEmpty) return [];

    return [object];
  }
}

class ApplicationStatusConvertor
    implements JsonConverter<ApplicationStatus?, String?> {
  const ApplicationStatusConvertor();

  @override
  ApplicationStatus? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;

    return ApplicationStatus.fromValue(json);
  }

  @override
  String? toJson(ApplicationStatus? object) {
    if (object == null) return '';

    return object.name;
  }
}
