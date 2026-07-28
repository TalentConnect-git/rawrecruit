// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: json['_id'] as String?,
      recipientId: json['recipientId'] as String?,
      senderId: const UserOrStringConvertor().fromJson(json['senderId']),
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      message: json['message'] as String?,
      referenceId: json['referenceId'] as String?,
      fileUrl: json['fileUrl'] as String?,
      fileName: json['fileName'] as String?,
      eventTitle: json['eventTitle'] as String?,
      meetingLink: json['meetingLink'] as String?,
      jobType: $enumDecodeNullable(_$JobTypeEnumMap, json['jobType']),
      read: json['read'] as bool? ?? false,
      jobId: json['jobId'] as String?,
      meta: json['meta'] == null
          ? null
          : NotificationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'recipientId': instance.recipientId,
      'senderId': const UserOrStringConvertor().toJson(instance.senderId),
      'type': _$NotificationTypeEnumMap[instance.type],
      'message': instance.message,
      'referenceId': instance.referenceId,
      'fileUrl': instance.fileUrl,
      'fileName': instance.fileName,
      'eventTitle': instance.eventTitle,
      'meetingLink': instance.meetingLink,
      'jobType': _$JobTypeEnumMap[instance.jobType],
      'read': instance.read,
      'jobId': instance.jobId,
      'meta': instance.meta,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$NotificationTypeEnumMap = {
  NotificationType.teamInvitation: 'TEAM_INVITATION',
  NotificationType.message: 'MESSAGE',
  NotificationType.systemUpdate: 'SYSTEM_UPDATE',
  NotificationType.fileShared: 'FILE_SHARED',
  NotificationType.eventUpdate: 'EVENT_UPDATE',
  NotificationType.serviceRequestUpdate: 'SERVICE_REQUEST_UPDATE',
  NotificationType.applicationShortlisted: 'APPLICATION_SHORTLISTED',
  NotificationType.applicationAccepted: 'APPLICATION_ACCEPTED',
  NotificationType.applicationInterviewScheduled:
      'APPLICATION_INTERVIEW_SCHEDULED',
  NotificationType.applicationOfferExtended: 'APPLICATION_OFFER_EXTENDED',
  NotificationType.referralApplicationApproved: 'REFERRAL_APPLICATION_APPROVED',
  NotificationType.applicationRejected: 'APPLICATION_REJECTED',
  NotificationType.collegeApplicationShortlisted:
      'COLLEGE_APPLICATION_SHORTLISTED',
  NotificationType.collegeApplicationAccepted: 'COLLEGE_APPLICATION_ACCEPTED',
  NotificationType.collegeApplicationRejected: 'COLLEGE_APPLICATION_REJECTED',
  NotificationType.jobRegistration: 'JOB_REGISTRATION',
  NotificationType.interviewScheduled: 'INTERVIEW_SCHEDULED',
  NotificationType.alternateDateRequest: 'ALTERNATE_DATE_REQUEST',
  NotificationType.applicationReferredToCompany:
      'APPLICATION_REFERRED_TO_COMPANY',
  NotificationType.referralJobApproved: 'REFERRAL_JOB_APPROVED',
  NotificationType.referralJobRejected: 'REFERRAL_JOB_REJECTED',
  NotificationType.newApplicationForJob: 'NEW_APPLICATION_FOR_JOB',
  NotificationType.newMatchingReferralJob: 'NEW_MATCHING_REFERRAL_JOB',
  NotificationType.newAlumniJoinedNetwork: 'NEW_ALUMNI_JOINED_NETWORK',
  NotificationType.referralMilestoneReached: 'REFERRAL_MILESTONE_REACHED',
  NotificationType.newReferralRequest: 'NEW_REFERRAL_REQUEST',
  NotificationType.newChatMessage: 'NEW_CHAT_MESSAGE',
};

const _$JobTypeEnumMap = {
  JobType.onCampus: 'On-campus',
  JobType.offCampus: 'Off-campus',
  JobType.poolCampus: 'Pool-campus',
  JobType.referral: 'Referral',
  JobType.internship: 'Internship',
};
