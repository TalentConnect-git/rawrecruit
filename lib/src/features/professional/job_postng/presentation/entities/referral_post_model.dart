import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/convertors.dart';

part 'referral_post_model.freezed.dart';
part 'referral_post_model.g.dart';

@freezed
abstract class ReferralPostModel with _$ReferralPostModel {
  const factory ReferralPostModel({
    @JsonKey(name: '_id') String? id,
List<String>? jobTitle,   String? description,
    String? approvalStatus,
List<String>? employmentType,
List<String>? workMode,
    String? broadcastType,
    String? jobType,
    List<String>? location,
    String? minEducation,
    int? numberOfOpenings,
    PackageDetails? packageDetails,
    List<String>? skills,
    List<String>? studentStreams,
    List<String>? tags,
    String? workAuthorization,
    String? yearsOfExperience,
    String? minYearofExperience,

List<String>? rounds,

List<String>? selectionProcess,

String? endDate,
  bool? inactive,
    List<String>? benefits,
    List<String>? certifications,
    String? eligibilityCriteria,
      Metrics? metrics,
  }) = _ReferralPostModel;

  factory ReferralPostModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralPostModelFromJson(json);
}
@freezed
abstract class Metrics with _$Metrics {
  const factory Metrics({
    int? totalApplicationsReceived,
    int? totalReferredToCompany,
    int? totalAcceptedByCompany,
    int? responseRate,
    int? referralSuccessRate,
  }) = _Metrics;

  factory Metrics.fromJson(Map<String, dynamic> json) =>
      _$MetricsFromJson(json);
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
