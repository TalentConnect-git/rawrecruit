import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

import '../../features/notifications/index.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
abstract class Job with _$Job {
  const factory Job({
    @JsonKey(name: '_id') String? id,
    String? postedByUser,
    // Basic
    @JsonKey(fromJson: _jobTitleFromJson) String? jobTitle,
    String? description,
    String? jobStatus,
    String? approvalStatus,
    String? visibleTo,
    String? broadcastType,
    String? jobType,
    String? eligibilityCriteria,
    String? companyName,
    String? status,
    String? workAuthorization,

    // Education & Experience
    String? minEducation,
    dynamic yearsOfExperience,

    // Numbers
    dynamic cgpa,
    int? numberOfOpenings,
    int? views,
    int? matchScore,
    String? adminComment,
    int? rating,
    int? alumniCount,
    // Lists - Roles & Skills
    @JsonKey(fromJson: _safeList) List<String>? jobRoles,

    @JsonKey(fromJson: _safeList) List<String>? location,

    @JsonKey(fromJson: _safeList) List<String>? workMode,

    @JsonKey(fromJson: _safeList) List<String>? skills,

    @JsonKey(fromJson: _safeList) List<String>? benefits,
    @JsonKey(fromJson: _safeList) List<String>? certifications,
    List<String>? degree,
    List<String>? studentStreams,

    // Lists - Location & Work
    List<String>? employmentType,
    List<String>? workLocation,

    // Lists - Company & Categories
    List<String>? companyType,
    List<String>? collegeTypes,
    List<String>? collegeCategories,

    // Lists - Process & Benefits
    List<String>? rounds,
    List<String>? selectionProcess,
    List<String>? workAchievements,
    List<String>? amenitiesRequired,
    List<String>? toolsAndPlatforms,
    List<String>? tags,
    List<String>? numberOfStudent,

    // Internship specific
    String? venue,
    String? internshipDuration,
    dynamic minimumStudents,

    // Complex Objects
    PackageDetail? packageDetails,
    User? contactPerson,
    Timeline? interviewWindow,
    @UserOrStringConvertor()
    @JsonKey(name: 'candidatePosted')
    User? candidatePosted,

    @UserOrStringConvertor()
    @JsonKey(name: 'receiverProfile')
    User? receiverProfile,

    JobPosting? companyPosted,
    JobPosting? jobCompanyPosted,
    String? referralCompany,

    String? careerPageUrl,
    bool? isAskForReferral,
    String? referralRequestId,
    // Dates
    DateTime? onlineTestDate,
    DateTime? offerRolloutDate,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? expireAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Job;
  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

String? _jobTitleFromJson(dynamic value) {
  if (value is List) {
    return value.join(', ');
  }

  return value?.toString();
}

List<String>? _safeList(dynamic value) {
  if (value is List) {
    return value.map((e) => e.toString()).toList();
  }

  if (value is String) {
    return [value];
  }
  return null;
}
