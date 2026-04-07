import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
abstract class Job with _$Job {
  const factory Job({
    @JsonKey(name: '_id') String? id,

    // Basic
    String? jobTitle, // 🔥 REQUIRED
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
    String? yearsOfExperience,

    // Numbers
    String? cgpa,
    int? numberOfOpenings,
    int? views,
    int? matchScore,

    // Lists - Roles & Skills
    List<String>? jobRoles,
    List<String>? skills,
    List<String>? certifications,
    List<String>? degree,
    List<String>? studentStreams,

    // Lists - Location & Work
    List<String>? location,
    List<String>? workMode,
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
    List<String>? benefits,
    List<String>? toolsAndPlatforms,
    List<String>? tags,
    List<String>? numberOfStudent,

    // Internship specific
    String? venue,
    String? internshipDuration,
    String? minimumStudents,

    // Complex Objects
    PackageDetail? packageDetails,
    User? contactPerson,
    Timeline? interviewWindow,
    @JsonKey(name: 'candidatePosted') User? candidatePosted,
    JobPosting? companyPosted,
    JobPosting? jobCompanyPosted,

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
