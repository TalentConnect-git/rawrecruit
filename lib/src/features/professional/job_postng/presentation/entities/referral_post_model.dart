import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/convertors.dart';

part 'referral_post_model.freezed.dart';
part 'referral_post_model.g.dart';

@freezed
abstract class ReferralPostModel with _$ReferralPostModel {
  const factory ReferralPostModel({
    @JsonKey(name: '_id') String? id,
    String? jobTitle,
    String? description,
    String? approvalStatus,
    @StringOrListConvertor() String? employmentType,
    @StringOrListConvertor() String? workMode,
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
    List<String>? benefits,
    List<String>? certifications,
    String? eligibilityCriteria,
  }) = _ReferralPostModel;

  factory ReferralPostModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralPostModelFromJson(json);
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
