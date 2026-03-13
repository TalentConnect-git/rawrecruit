import 'package:freezed_annotation/freezed_annotation.dart';

part 'internship_model.freezed.dart';
part 'internship_model.g.dart';

@freezed
abstract class InternshipModel with _$InternshipModel {
  const factory InternshipModel({
    @JsonKey(name: '_id') String? id,

    // Basic
    String? description,
    String? jobType,
    String? jobStatus,
    String? approvalStatus,
    String? visibleTo,
    String? broadcastType,
    String? eligibilityCriteria,
    String? minEducation,
    String? minimumStudents,
    String? venue,
    String? internshipDuration,

    // Numbers
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
    InternshipPackageDetails? packageDetails,
    ContactPerson? contactPerson,
    InternshipCompanyPosted? companyPosted,

    // Dates
    DateTime? onlineTestDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? expireAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _InternshipModel;

  factory InternshipModel.fromJson(Map<String, dynamic> json) =>
      _$InternshipModelFromJson(json);
}

double? _doubleFromJson(dynamic v) =>
    v == null ? null : (v as num).toDouble();

// ─────────────────────────────────────────────────────────────────────────────

@freezed
abstract class InternshipPackageDetails with _$InternshipPackageDetails {
  const factory InternshipPackageDetails({
    String? currency,
    int? totalCTC,
    int? fixedPay,
    int? joiningBonus,
  }) = _InternshipPackageDetails;

  factory InternshipPackageDetails.fromJson(Map<String, dynamic> json) =>
      _$InternshipPackageDetailsFromJson(json);
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
abstract class InternshipCompanyPosted with _$InternshipCompanyPosted {
  const factory InternshipCompanyPosted({
    @JsonKey(name: '_id') String? id,
    String? profileImageUrl,
    String? backgroundImageUrl,
    InternshipEmployerDetails? employerDetails,
    InternshipCompanyDetails? companyDetails,
  }) = _InternshipCompanyPosted;

  factory InternshipCompanyPosted.fromJson(Map<String, dynamic> json) =>
      _$InternshipCompanyPostedFromJson(json);
}

@freezed
abstract class InternshipEmployerDetails with _$InternshipEmployerDetails {
  const factory InternshipEmployerDetails({
    String? name,
    String? designation,
    String? workEmail,
    String? mobile,
    String? linkedIn,
  }) = _InternshipEmployerDetails;

  factory InternshipEmployerDetails.fromJson(Map<String, dynamic> json) =>
      _$InternshipEmployerDetailsFromJson(json);
}

@freezed
abstract class InternshipCompanyDetails with _$InternshipCompanyDetails {
  const factory InternshipCompanyDetails({
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
  }) = _InternshipCompanyDetails;

  factory InternshipCompanyDetails.fromJson(Map<String, dynamic> json) =>
      _$InternshipCompanyDetailsFromJson(json);
}