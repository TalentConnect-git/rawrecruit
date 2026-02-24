import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_post_model.freezed.dart';
part 'referral_post_model.g.dart';

@freezed
abstract class ReferralPostModel with _$ReferralPostModel {
  const factory ReferralPostModel({
    required String jobTitle,
    required String description,
    required String employmentType,
    required String workMode,
    required String broadcastType,
    required String jobType,
    required List<String> location,
    required String minEducation,
    required int numberOfOpenings,
    required PackageDetails packageDetails,
    required List<String> skills,
    required List<String> studentStreams,
    required List<String> tags,
    required String workAuthorization,
    required String yearsOfExperience,
    required List<String> benefits,
    required List<String> certifications,
    required String eligibilityCriteria,
  }) = _ReferralPostModel;

  factory ReferralPostModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ReferralPostModelFromJson(json);
}

@freezed
abstract class PackageDetails with _$PackageDetails {
  const factory PackageDetails({
    required String currency,
    required int totalCTC,
    required int fixedPay,
    required int joiningBonus,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PackageDetailsFromJson(json);
}