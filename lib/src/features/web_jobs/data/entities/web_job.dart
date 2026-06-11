import 'package:freezed_annotation/freezed_annotation.dart';

import 'company_job.dart';

part 'web_job.freezed.dart';
part 'web_job.g.dart';

@freezed
abstract class CompanyJobsDiscovery with _$CompanyJobsDiscovery {
  const factory CompanyJobsDiscovery({
    String? companyName,
    String? companySlug,
    String? atsType,
    String? candidateProfileType,
    String? candidateExperience,
    String? candidateExperienceLevel,

    int? totalFetched,
    int? totalMatched,

    List<CompanyJob>? jobs,
  }) = _CompanyJobsDiscovery;

  factory CompanyJobsDiscovery.fromJson(Map<String, dynamic> json) =>
      _$CompanyJobsDiscoveryFromJson(json);
}
