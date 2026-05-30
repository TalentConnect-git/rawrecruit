import 'package:freezed_annotation/freezed_annotation.dart';

part 'education.freezed.dart';
part 'education.g.dart';

@freezed
abstract class Education
    with _$Education {

  const factory Education({

    String? college,

    String? degree,

    String? specialization,

    String? semester,

    String? cgpa,

    String? yearOfGraduation,

    String? startDate,

    String? endDate,

    String? educationType,

    bool? isCurrent,

    String? degreeCertificate,

  }) = _Education;

  factory Education.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$EducationFromJson(json);
}