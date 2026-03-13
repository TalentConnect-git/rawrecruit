import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview_model.freezed.dart';
part 'interview_model.g.dart';

@freezed
abstract class InterviewModel with _$InterviewModel {
  const factory InterviewModel({
    @JsonKey(name: '_id') String? id,

    // Job reference
    InterviewJobRef? jobId,
    String? jobType,
    String? applicationId,

    // Parties
    String? companyAuthId,
    String? applicantType,
    String? applicantAuthId,
    String? applicantProfileId,

    // Snapshots
    InterviewApplicantSnapshot? applicantSnapshot,
    InterviewCoordinator? coordinator,
    InterviewCompanySnapshot? companySnapshot,

    // Details
    List<String>? jobRole,
    String? date,
    String? time,
    String? meetLink,
    String? message,
    String? status,
    String? emailStatus,

    // Dates
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _InterviewModel;

  factory InterviewModel.fromJson(Map<String, dynamic> json) =>
      _$InterviewModelFromJson(json);
}

// ─────────────────────────────────────────────────────────────────────────────

@freezed
abstract class InterviewJobRef with _$InterviewJobRef {
  const factory InterviewJobRef({
    @JsonKey(name: '_id') String? id,
    String? jobType,
    String? jobTitle,
    String? companyName,
  }) = _InterviewJobRef;

  factory InterviewJobRef.fromJson(Map<String, dynamic> json) =>
      _$InterviewJobRefFromJson(json);
}

@freezed
abstract class InterviewApplicantSnapshot with _$InterviewApplicantSnapshot {
  const factory InterviewApplicantSnapshot({
    String? name,
    String? collegeName,
    String? designation,
    String? profileType,
  }) = _InterviewApplicantSnapshot;

  factory InterviewApplicantSnapshot.fromJson(Map<String, dynamic> json) =>
      _$InterviewApplicantSnapshotFromJson(json);
}

@freezed
abstract class InterviewCoordinator with _$InterviewCoordinator {
  const factory InterviewCoordinator({
    String? name,
    String? designation,
    String? collegeName,
  }) = _InterviewCoordinator;

  factory InterviewCoordinator.fromJson(Map<String, dynamic> json) =>
      _$InterviewCoordinatorFromJson(json);
}

@freezed
abstract class InterviewCompanySnapshot with _$InterviewCompanySnapshot {
  const factory InterviewCompanySnapshot({
    String? companyName,
    InterviewScheduledBy? scheduledBy,
  }) = _InterviewCompanySnapshot;

  factory InterviewCompanySnapshot.fromJson(Map<String, dynamic> json) =>
      _$InterviewCompanySnapshotFromJson(json);
}

@freezed
abstract class InterviewScheduledBy with _$InterviewScheduledBy {
  const factory InterviewScheduledBy({
    String? name,
    String? email,
    String? designation,
  }) = _InterviewScheduledBy;

  factory InterviewScheduledBy.fromJson(Map<String, dynamic> json) =>
      _$InterviewScheduledByFromJson(json);
}