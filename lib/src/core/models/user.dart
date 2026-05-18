import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/models/experience.dart';

import 'international_experience.dart';
import 'leadership_experience.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @JsonKey(name: '_id') String? id,
    String? userId,
    @JsonKey(name: '__v') int? v,
String? companyEmail,
    List<Achievement>? achievements,
    List<Award>? awards,
    List<Publication>? publications,

    String? createdAt,
    String? updatedAt,

    String? profileImage,
    String? currentCompany,
    
    @JsonKey(name: 'totalYearsOfExperience')
    String? totalYearsOfExperience,
    String? noticePeriod,
String? noticePeriodStartDate,
bool? servingNoticePeriod,
    List<String>? domainKnowledge,
    List<String>? employmentType,
    List<Experience>? experiences,
    List<String>? industry,
   @JsonKey(name: 'leadership')
List<LeadershipExperience>? leadershipExperiences,

@JsonKey(name: 'internationalExperience')
List<InternationalExperience>? internationalExperiences,
    List<String>? jobRoles,
    List<String>? languagesKnown,
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
    bool? onboardingCompleted,
    String? referralSource,
    String? semester,
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

    List<Job>? referralJobs,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
