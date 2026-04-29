import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_job_model.freezed.dart';
part 'referral_job_model.g.dart';

@freezed
abstract class ReferralJobModel with _$ReferralJobModel {
  const factory ReferralJobModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'candidatePosted') CandidatePosted? candidatePosted,

    String? jobTitle,
    String? description,
    String? jobStatus,
    String? approvalStatus,
    String? jobType,
    String? visibleTo,
    String? broadcastType,
    String? minEducation,
    String? workAuthorization,
    String? eligibilityCriteria,
    String? yearsOfExperience,
    String? status,

    int? numberOfOpenings,
    int? cgpa,
    int? views,

    List<String>? location,
    List<String>? workMode,
    List<String>? employmentType,
    List<String>? skills,
    List<String>? degree,
    List<String>? collegeTypes,
    List<String>? collegeCategories,
    List<String>? companyType,
    List<String>? studentStreams,
    List<String>? rounds,
    List<String>? selectionProcess,
    List<String>? certifications,
    List<String>? workAchievements,
    List<String>? amenitiesRequired,
    List<String>? benefits,
    List<String>? tags,
    List<String>? toolsAndPlatforms,
    List<String>? workLocation,
    List<String>? numberOfStudent,

    PackageDetails? packageDetails,

    DateTime? expireAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ReferralJobModel;

  factory ReferralJobModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralJobModelFromJson(json);
}

@freezed
abstract class CandidatePosted with _$CandidatePosted {
  const factory CandidatePosted({
    @JsonKey(name: '_id') String? id,
String? userId,

    // Identity
    String? name,
    String? email,
    String? phone,

    // Profile
    String? about,
    String? college,
    String? degree,
    String? specialization,
    String? yearOfGraduation,
    String? semester,
    String? cgpa,
    String? currentCompany,
    String? noticePeriod,
    String? openToShift,
    String? profileType,
    String? referralSource,

    // Salary
    String? currentSalaryAmount,
    String? expectedSalaryAmount,

    // Links
    String? github,
    String? linkedin,
    String? portfolio,
    String? resume,
    String? certifications,

    // Lists
    List<dynamic>? skills,
    List<dynamic>? jobRoles,
    List<dynamic>? experiences,
    List<dynamic>? toolsAndPlatforms,
    List<dynamic>? languagesKnown,
    List<dynamic>? domainKnowledge,
    List<dynamic>? employmentType,
    List<dynamic>? industry,
    List<dynamic>? locations,
    List<dynamic>? lookingFor,
    List<dynamic>? achievements,
    List<dynamic>? awards,
    List<dynamic>? publications,
    List<dynamic>? internationalExperience,
    List<dynamic>? leadership,

    bool? servingNoticePeriod,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CandidatePosted;

  factory CandidatePosted.fromJson(Map<String, dynamic> json) =>
      _$CandidatePostedFromJson(json);
}

@freezed
abstract class PackageDetails with _$PackageDetails {
  const factory PackageDetails({
    String? currency,
    int? totalCTC,
    int? fixedPay,
    int? joiningBonus,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}