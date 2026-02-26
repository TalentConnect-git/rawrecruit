import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_job_model.freezed.dart';
part 'referral_job_model.g.dart';

@freezed
abstract class ReferralJobModel with _$ReferralJobModel {
  const factory ReferralJobModel({
    @JsonKey(name: '_id') String? id,
    @JsonKey(name: 'candidatePosted')
CandidatePosted? candidatePosted,

String? minEducation,
String? workAuthorization,
String? eligibilityCriteria,
List<String>? benefits,
List<String>? tags,
int? numberOfOpenings,
String? status,
    String? jobTitle,
    List<String>? location,
    List<String>? workMode,
    List<String>? employmentType,
    String? approvalStatus,
    String? description,
    List<String>? skills,
    PackageDetails? packageDetails,
    String? yearsOfExperience,
  }) = _ReferralJobModel;

  factory ReferralJobModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralJobModelFromJson(json);
}
@freezed
abstract class CandidatePosted with _$CandidatePosted {
  const factory CandidatePosted({
    @JsonKey(name: '_id') String? id,
    String? name,
    List<dynamic>? experiences,
    List<dynamic>? jobRoles,
  }) = _CandidatePosted;

  factory CandidatePosted.fromJson(
    Map<String, dynamic> json,
  ) =>
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

  factory PackageDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PackageDetailsFromJson(json);
}