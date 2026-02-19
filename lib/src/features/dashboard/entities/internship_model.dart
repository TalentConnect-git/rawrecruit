import 'package:freezed_annotation/freezed_annotation.dart';

part 'internship_model.freezed.dart';
part 'internship_model.g.dart';

@freezed
 abstract class InternshipModel with _$InternshipModel {
  const factory InternshipModel({
    @JsonKey(name: '_id') String? id,

    String? description,

    List<String>? skills,

    List<String>? workMode,

    List<String>? location,

    List<String>? jobRoles,

    String? internshipDuration,

    int? numberOfOpenings,

    String? minEducation,

    List<String>? benefits,

    List<String>? tags,

    String? eligibilityCriteria,

    DateTime? onlineTestDate,

    InternshipPackageDetails? packageDetails,

    InternshipCompanyPosted? companyPosted,
  }) = _InternshipModel;

  factory InternshipModel.fromJson(
          Map<String, dynamic> json) =>
      _$InternshipModelFromJson(json);
}

@freezed
abstract class InternshipPackageDetails
    with _$InternshipPackageDetails {
  const factory InternshipPackageDetails({
    int? totalCTC,
  }) = _InternshipPackageDetails;

  factory InternshipPackageDetails.fromJson(
          Map<String, dynamic> json) =>
      _$InternshipPackageDetailsFromJson(json);
}

@freezed
abstract class InternshipCompanyPosted
    with _$InternshipCompanyPosted {
  const factory InternshipCompanyPosted({
    InternshipCompanyDetails? companyDetails,
    String? profileImageUrl,
  }) = _InternshipCompanyPosted;

  factory InternshipCompanyPosted.fromJson(
          Map<String, dynamic> json) =>
      _$InternshipCompanyPostedFromJson(json);
}

@freezed
abstract class InternshipCompanyDetails
    with _$InternshipCompanyDetails {
  const factory InternshipCompanyDetails({
    String? companyName,
  }) = _InternshipCompanyDetails;

  factory InternshipCompanyDetails.fromJson(
          Map<String, dynamic> json) =>
      _$InternshipCompanyDetailsFromJson(json);
}
