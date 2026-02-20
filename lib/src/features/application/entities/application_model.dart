import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_model.freezed.dart';
part 'application_model.g.dart';

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    @JsonKey(name: '_id') String? id,
    String? currentStatus,

    /// 🔹 From API
    @JsonKey(name: 'jobDetails')
    JobDetails? jobDetails,

    /// 🔹 From API
    @JsonKey(name: 'companyProfile')
    CompanyProfile? companyProfile,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApplicationModelFromJson(json);
}

@freezed
abstract class JobDetails with _$JobDetails {
  const factory JobDetails({
    @JsonKey(name: '_id') String? id,
    List<String>? jobRoles,
    List<String>? location,

    String? jobType, // 🔥 ADD THIS

    List<String>? employmentType,
    List<String>? workMode,

    PackageDetails? packageDetails, // 🔥 ADD THIS
  }) = _JobDetails;

  factory JobDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$JobDetailsFromJson(json);
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
@freezed
abstract class CompanyProfile with _$CompanyProfile {
  const factory CompanyProfile({
    CompanyDetails? companyDetails,
  }) = _CompanyProfile;

  factory CompanyProfile.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CompanyProfileFromJson(json);
}

@freezed
abstract class CompanyDetails with _$CompanyDetails {
  const factory CompanyDetails({
    String? companyName,
  }) = _CompanyDetails;

  factory CompanyDetails.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CompanyDetailsFromJson(json);
}