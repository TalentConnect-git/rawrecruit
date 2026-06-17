// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApplicationModel _$ApplicationModelFromJson(
  Map<String, dynamic> json,
) => _ApplicationModel(
  id: json['_id'] as String?,
  applicant: const UserOrStringConvertor().fromJson(json['applicant']),
  applicantType: json['applicantType'] as String?,
  appliedForCompany: json['appliedForCompany'] as String?,
  referralCompany: json['referralCompany'] as String?,
  appliedByType: json['appliedByType'] as String?,
  adminApprovalStatus: json['adminApprovalStatus'] as String?,
  currentStatus: json['currentStatus'] as String?,
  jobType: json['jobType'] as String?,
  isVisited: json['isVisited'] as bool?,
  isAskForReferral: json['isAskForReferral'] as bool?,
  careerPageUrl: json['careerPageUrl'] as String?,
  job: const JobOrStringConvertor().fromJson(json['job']),
  matchScore: (json['matchScore'] as num?)?.toInt(),
  adminComment: json['adminComment'] as String?,
  rating: json['rating'] as num?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  displayCompanyName: json['displayCompanyName'] as String?,
  jobDetails: json['jobDetails'] == null
      ? null
      : Job.fromJson(json['jobDetails'] as Map<String, dynamic>),
  companyProfile: json['companyProfile'] == null
      ? null
      : CompanyDetail.fromJson(json['companyProfile'] as Map<String, dynamic>),
  statusHistory: (json['statusHistory'] as List<dynamic>?)
      ?.map((e) => ApplicationStatusHistory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ApplicationModelToJson(_ApplicationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'applicant': const UserOrStringConvertor().toJson(instance.applicant),
      'applicantType': instance.applicantType,
      'appliedForCompany': instance.appliedForCompany,
      'referralCompany': instance.referralCompany,
      'appliedByType': instance.appliedByType,
      'adminApprovalStatus': instance.adminApprovalStatus,
      'currentStatus': instance.currentStatus,
      'jobType': instance.jobType,
      'isVisited': instance.isVisited,
      'isAskForReferral': instance.isAskForReferral,
      'careerPageUrl': instance.careerPageUrl,
      'job': const JobOrStringConvertor().toJson(instance.job),
      'matchScore': instance.matchScore,
      'adminComment': instance.adminComment,
      'rating': instance.rating,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'displayCompanyName': instance.displayCompanyName,
      'jobDetails': instance.jobDetails,
      'companyProfile': instance.companyProfile,
      'statusHistory': instance.statusHistory,
    };
