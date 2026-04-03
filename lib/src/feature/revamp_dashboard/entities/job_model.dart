import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
abstract class JobModel with _$JobModel {
  const factory JobModel({
    @JsonKey(name: '_id') String? id,

    // Basic
    String? jobTitle,
    String? description,
    String? jobType,
    String? jobStatus,
    String? approvalStatus,
    String? visibleTo,
    String? broadcastType,
    String? eligibilityCriteria,
    String? minimumStudents,
    String? venue,
    String? companyName,

    // Numbers — cgpa can be int or double in API
    @JsonKey(fromJson: _doubleFromJson) double? cgpa,
    int? numberOfOpenings,
    int? views,
    int? matchScore,

    // Lists
    List<String>? jobRoles,
    List<String>? skills,
    List<String>? workMode,
    List<String>? location,
    List<String>? employmentType,
    List<String>? degree,
    List<String>? studentStreams,
    List<String>? collegeTypes,
    List<String>? collegeCategories,
    List<String>? companyType,
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

    // Nested
    JobPackageDetails? packageDetails,
    InterviewWindow? interviewWindow,
    ContactPerson? contactPerson,
    JobCompanyPosted? companyPosted,

    // Dates
    DateTime? onlineTestDate,
    DateTime? offerRolloutDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? expireAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}

double? _doubleFromJson(dynamic v) =>
    v == null ? null : (v as num).toDouble();

// ─────────────────────────────────────────────────────────────────────────────

@freezed
abstract class InterviewWindow with _$InterviewWindow {
  const factory InterviewWindow({DateTime? start, DateTime? end}) =
      _InterviewWindow;

  factory InterviewWindow.fromJson(Map<String, dynamic> json) =>
      _$InterviewWindowFromJson(json);
}

@freezed
abstract class JobPackageDetails with _$JobPackageDetails {
  const factory JobPackageDetails({
    String? currency,
    int? totalCTC,
    int? fixedPay,
    int? joiningBonus,
  }) = _JobPackageDetails;

  factory JobPackageDetails.fromJson(Map<String, dynamic> json) =>
      _$JobPackageDetailsFromJson(json);
}

@freezed
abstract class ContactPerson with _$ContactPerson {
  const factory ContactPerson({
    String? name,
    String? designation,
    String? email,
    String? mobile,
    String? linkedin,
  }) = _ContactPerson;

  factory ContactPerson.fromJson(Map<String, dynamic> json) =>
      _$ContactPersonFromJson(json);
}

@freezed
abstract class JobCompanyPosted with _$JobCompanyPosted {
  const factory JobCompanyPosted({
    @JsonKey(name: '_id') String? id,
    String? profileImageUrl,
    String? backgroundImageUrl,
    JobEmployerDetails? employerDetails,
    JobCompanyDetails? companyDetails,
  }) = _JobCompanyPosted;

  factory JobCompanyPosted.fromJson(Map<String, dynamic> json) =>
      _$JobCompanyPostedFromJson(json);
}

@freezed
abstract class JobEmployerDetails with _$JobEmployerDetails {
  const factory JobEmployerDetails({
    String? name,
    String? designation,
    String? workEmail,
    String? mobile,
    String? linkedIn,
  }) = _JobEmployerDetails;

  factory JobEmployerDetails.fromJson(Map<String, dynamic> json) =>
      _$JobEmployerDetailsFromJson(json);
}

@freezed
abstract class JobCompanyDetails with _$JobCompanyDetails {
  const factory JobCompanyDetails({
    String? companyName,
    String? description,
    String? companyType,
    String? industryType,
    String? numberOfEmployees,
    String? establishedYear,
    String? websiteUrl,
    String? companyLinkedin,
    String? linkedinUrl,
    String? phoneNumber,
    String? alternatePhoneNumber,
    String? state,
    String? city,
    String? country,
    String? pincode,
  }) = _JobCompanyDetails;

  factory JobCompanyDetails.fromJson(Map<String, dynamic> json) =>
      _$JobCompanyDetailsFromJson(json);
}