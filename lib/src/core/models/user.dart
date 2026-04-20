import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @JsonKey(name: '_id') String? id,
    String? userId,
    @JsonKey(name: '__v') int? v,

    List<Achievement>? achievements,
    List<Award>? awards,
    List<Publication>? publications,

    String? createdAt,
    String? updatedAt,

    String? profileImage,
    String? currentCompany,
    String? noticePeriod,

    List<String>? domainKnowledge,
    List<String>? employmentType,
    List<Experience>? experiences,
    List<String>? industry,
    List<String>? internationalExperience,
    List<String>? jobRoles,
    List<String>? languagesKnown,
    List<String>? leadership,
    List<String>? locations,
    List<String>? lookingFor,

    String? resume,
    List<String>? skills,
    List<String>? toolsAndPlatforms,

    String? about,
    String? certifications,
    String? cgpa,
    String? college,
    String? degree,
    String? degreeCertificate,
    String? email,
    bool? emailVerified,
    String? mobile,
    String? designation,
    String? gender,
    String? github,
    String? linkedin,
    String? name,
    String? openToShift,
    String? phone,
    String? portfolio,
    String? profileType,
    String? referralSource,
    String? semester,
    bool? servingNoticePeriod,
    String? specialization,
    String? yearOfGraduation,

    String? currentSalaryAmount,
    String? currentSalaryCurrency,
    String? dob,
    String? ethnicity,
    String? expectedSalaryAmount,
    String? expectedSalaryCurrency,
    String? maritalStatus,
    String? visaStatus,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
