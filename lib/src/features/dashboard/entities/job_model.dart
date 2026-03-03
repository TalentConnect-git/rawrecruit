import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
abstract class JobModel with _$JobModel {
  const factory JobModel({
    @JsonKey(name: '_id') String? id,

    String? description,
    String? jobTitle,

    List<String>? skills,

    List<String>? workMode,

    List<String>? location,

    List<String>? jobRoles,

    List<String>? degree,

    List<String>? employmentType,

    List<String>? studentStreams,

    String? eligibilityCriteria,

    List<String>? benefits,

    List<String>? tags,

    int? cgpa,

    int? numberOfOpenings,

    InterviewWindow? interviewWindow,

    DateTime? onlineTestDate,

    DateTime? offerRolloutDate,

    JobPackageDetails? packageDetails,

    String? companyName,
  }) = _JobModel;

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}

@freezed
abstract class InterviewWindow with _$InterviewWindow {
  const factory InterviewWindow({DateTime? start, DateTime? end}) =
      _InterviewWindow;

  factory InterviewWindow.fromJson(Map<String, dynamic> json) =>
      _$InterviewWindowFromJson(json);
}

@freezed
abstract class JobPackageDetails with _$JobPackageDetails {
  const factory JobPackageDetails({int? totalCTC}) = _JobPackageDetails;

  factory JobPackageDetails.fromJson(Map<String, dynamic> json) =>
      _$JobPackageDetailsFromJson(json);
}
