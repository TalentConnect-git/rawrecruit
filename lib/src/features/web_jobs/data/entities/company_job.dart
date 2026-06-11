import 'package:freezed_annotation/freezed_annotation.dart';

import 'score_breakdown.dart';

part 'company_job.freezed.dart';
part 'company_job.g.dart';

@freezed
abstract class CompanyJob with _$CompanyJob {
  const factory CompanyJob({
    String? companySlug,
    String? companyName,
    String? companyNormalized,
    String? title,
    String? jobUrl,
    String? applyUrl,
    String? location,
    String? workMode,
    String? department,
    String? jdSnippet,
    String? description,

    List<String>? requiredSkills,
    List<String>? matchedSkills,
    List<String>? missingSkills,

    String? experienceRequired,
    String? salaryRange,
    String? postedDate,
    String? jobId,
    String? atsSource,

    int? matchScore,

    @JsonKey(name: 'scoreBreakdown') ScoreBreakdown? scoreBreakdown,

    int? alumniCount,
    int? totalEmployeeCount,

    String? onboardingId,

    bool? referralRequested,
  }) = _CompanyJob;

  factory CompanyJob.fromJson(Map<String, dynamic> json) =>
      _$CompanyJobFromJson(json);
}
