import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/models/user.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

part 'referral_application.freezed.dart';

@freezed
abstract class ReferralApplication with _$ReferralApplication {
  const factory ReferralApplication({
    String? id,
    User? applicant,
    String? applicantType,
    String? adminApprovalStatus,
    ReferralPostModel? job,
    String? statusText,
    String? currentStatus,
    String? referralCompany,

    DateTime? createdAt,
    int? matchScore,
    String? jobTitle,
    List<String>? skills,
  }) = _ReferralApplication;

  factory ReferralApplication.fromJson(Map<String, dynamic> json) {
    final dynamic title = json['job']?['jobTitle'];

    String? parsedTitle;

    if (title is List) {
      parsedTitle = title.join(", ");
    } else {
      parsedTitle = title?.toString();
    }

    return ReferralApplication(
      id: json['_id']?.toString(),

      applicant: json['applicant'] is Map<String, dynamic>
          ? User.fromJson(json['applicant'])
          : null,

      applicantType: json['applicantType']?.toString(),

      adminApprovalStatus: json['adminApprovalStatus']?.toString(),

      job: json['job'] is Map<String, dynamic>
          ? ReferralPostModel.fromJson(json['job'])
          : null,

      statusText: json['statusText']?.toString(),

      currentStatus: json['currentStatus']?.toString(),

      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,

      matchScore: json['matchScore'] is int ? json['matchScore'] : 0,

      jobTitle: parsedTitle,

      skills: json['skills'] is List ? List<String>.from(json['skills']) : [],
      referralCompany: json['referralCompany']?.toString(),
    );
  }
}
