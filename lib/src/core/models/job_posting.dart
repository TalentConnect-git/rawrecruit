import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'job_posting.freezed.dart';
part 'job_posting.g.dart';

@freezed
abstract class JobPosting with _$JobPosting {
  const factory JobPosting({
    @JsonKey(name: '_id') String? id,
    String? profileImageUrl,
    String? backgroundImageUrl,
    User? employerDetails,
    CompanyDetail? companyDetails,
  }) = _JobPosting;

  factory JobPosting.fromJson(Map<String, dynamic> json) =>
      _$JobPostingFromJson(json);
}
