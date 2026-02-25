import 'package:freezed_annotation/freezed_annotation.dart';

import 'index.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    @JsonKey(name: '_id') String? id,
    String? userId,
    @JsonKey(name: '__v') int? v,

    List<Achievement>? achievements,
    List<Award>? awards,
    List<Publication>? publications,

    String? createdAt,
    String? updatedAt,

    List<String>? domainKnowledge,
    List<String>? employmentType,
    List<String>? experiences,
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
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
