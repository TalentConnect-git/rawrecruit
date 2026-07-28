import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum NotificationType {
  @JsonValue('TEAM_INVITATION')
  teamInvitation(
    label: 'Team Invitation',
    textColor: Color(0xFF1D4ED8),
    backgroundColor: Color(0xFFE0E7FF),
    icon: Icons.group_add,
  ),

  @JsonValue('MESSAGE')
  message(
    label: 'New Message',
    textColor: Color(0xFF047857),
    backgroundColor: Color(0xFFD1FAE5),
    icon: Icons.chat_bubble_outline,
  ),

  @JsonValue('SYSTEM_UPDATE')
  systemUpdate(
    label: 'System Update',
    textColor: Color(0xFF6B7280),
    backgroundColor: Color(0xFFF3F4F6),
    icon: Icons.system_update_alt,
  ),

  @JsonValue('FILE_SHARED')
  fileShared(
    label: 'File Shared',
    textColor: Color(0xFF7C3AED),
    backgroundColor: Color(0xFFEDE9FE),
    icon: Icons.attach_file,
  ),

  @JsonValue('EVENT_UPDATE')
  eventUpdate(
    label: 'Event Update',
    textColor: Color(0xFFEA580C),
    backgroundColor: Color(0xFFFFEDD5),
    icon: Icons.event,
  ),

  @JsonValue('SERVICE_REQUEST_UPDATE')
  serviceRequestUpdate(
    label: 'Service Request Update',
    textColor: Color(0xFF2563EB),
    backgroundColor: Color(0xFFDBEAFE),
    icon: Icons.support_agent,
  ),

  @JsonValue('APPLICATION_SHORTLISTED')
  applicationShortlisted(
    label: 'Application Shortlisted',
    textColor: Color(0xFF059669),
    backgroundColor: Color(0xFFD1FAE5),
    icon: Icons.check_circle_outline,
  ),

  @JsonValue('APPLICATION_ACCEPTED')
  applicationAccepted(
    label: 'Application Accepted',
    textColor: Color(0xFF15803D),
    backgroundColor: Color(0xFFDCFCE7),
    icon: Icons.verified,
  ),
  @JsonValue('APPLICATION_INTERVIEW_SCHEDULED')
  applicationInterviewScheduled(
    label: 'Interview Scheduled',
    textColor: Color(0xFF2563EB),
    backgroundColor: Color(0xFFDBEAFE),
    icon: Icons.video_call_outlined,
  ),
  @JsonValue('APPLICATION_OFFER_EXTENDED')
  applicationOfferExtended(
    label: 'Offer Extended',
    textColor: Color(0xFF7C3AED),
    backgroundColor: Color(0xFFEDE9FE),
    icon: Icons.workspace_premium_outlined,
  ),
  @JsonValue('REFERRAL_APPLICATION_APPROVED')
  referralApplicationApproved(
    label: 'Referral Approved',
    textColor: Color(0xFF059669),
    backgroundColor: Color(0xFFD1FAE5),
    icon: Icons.verified_outlined,
  ),
  @JsonValue('APPLICATION_REJECTED')
  applicationRejected(
    label: 'Application Rejected',
    textColor: Color(0xFFB91C1C),
    backgroundColor: Color(0xFFFEE2E2),
    icon: Icons.cancel_outlined,
  ),

  @JsonValue('COLLEGE_APPLICATION_SHORTLISTED')
  collegeApplicationShortlisted(
    label: 'College Application Shortlisted',
    textColor: Color(0xFF0EA5E9),
    backgroundColor: Color(0xFFE0F2FE),
    icon: Icons.school_outlined,
  ),

  @JsonValue('COLLEGE_APPLICATION_ACCEPTED')
  collegeApplicationAccepted(
    label: 'College Application Accepted',
    textColor: Color(0xFF16A34A),
    backgroundColor: Color(0xFFDCFCE7),
    icon: Icons.school,
  ),

  @JsonValue('COLLEGE_APPLICATION_REJECTED')
  collegeApplicationRejected(
    label: 'College Application Rejected',
    textColor: Color(0xFFDC2626),
    backgroundColor: Color(0xFFFEE2E2),
    icon: Icons.school_outlined,
  ),

  @JsonValue('JOB_REGISTRATION')
  jobRegistration(
    label: 'Job Registration',
    textColor: Color(0xFF0284C7),
    backgroundColor: Color(0xFFE0F2FE),
    icon: Icons.work_outline,
  ),

  @JsonValue('INTERVIEW_SCHEDULED')
  interviewScheduled(
    label: 'Interview Scheduled',
    textColor: Color(0xFF7C3AED),
    backgroundColor: Color(0xFFEDE9FE),
    icon: Icons.event_available,
  ),
  @JsonValue('ALTERNATE_DATE_REQUEST')
  alternateDateRequest(
    label: 'Alternate Date Request',
    textColor: Color(0xFFD97706),
    backgroundColor: Color(0xFFFEF3C7),
    icon: Icons.date_range_outlined,
  ),

  @JsonValue('APPLICATION_REFERRED_TO_COMPANY')
  applicationReferredToCompany(
    label: 'Application Referred',
    textColor: Color(0xFF0F766E),
    backgroundColor: Color(0xFFCCFBF1),
    icon: Icons.forward_to_inbox_outlined,
  ),
  @JsonValue('REFERRAL_JOB_APPROVED')
  referralJobApproved(
    label: 'Referral Job Approved',
    textColor: Color(0xFF16A34A),
    backgroundColor: Color(0xFFDCFCE7),
    icon: Icons.thumb_up_alt_outlined,
  ),

  @JsonValue('REFERRAL_JOB_REJECTED')
  referralJobRejected(
    label: 'Referral Job Rejected',
    textColor: Color(0xFFDC2626),
    backgroundColor: Color(0xFFFEE2E2),
    icon: Icons.thumb_down_alt_outlined,
  ),
  @JsonValue('NEW_APPLICATION_FOR_JOB')
  newApplicationForJob(
    label: 'New Application',
    textColor: Color(0xFF2563EB),
    backgroundColor: Color(0xFFDBEAFE),
    icon: Icons.person_add_alt_1_outlined,
  ),
  @JsonValue('NEW_MATCHING_REFERRAL_JOB')
  newMatchingReferralJob(
    label: 'New Matching Referral Job',
    textColor: Color(0xFF0284C7),
    backgroundColor: Color(0xFFE0F2FE),
    icon: Icons.recommend_outlined,
  ),

  @JsonValue('NEW_ALUMNI_JOINED_NETWORK')
  newAlumniJoinedNetwork(
    label: 'New Alumni Joined',
    textColor: Color(0xFF7C3AED),
    backgroundColor: Color(0xFFEDE9FE),
    icon: Icons.people_outline,
  ),

  @JsonValue('REFERRAL_MILESTONE_REACHED')
  referralMilestoneReached(
    label: 'Referral Milestone Reached',
    textColor: Color(0xFFD97706),
    backgroundColor: Color(0xFFFEF3C7),
    icon: Icons.emoji_events_outlined,
  ),
  @JsonValue('NEW_REFERRAL_REQUEST')
  newReferralRequest(
    label: 'New Referral Request',
    textColor: Color(0xFF0284C7),
    backgroundColor: Color(0xFFE0F2FE),
    icon: Icons.person_add_alt_outlined,
  ),
  @JsonValue('NEW_CHAT_MESSAGE')
  newChatMessage(
    label: 'New Chat Message',
    textColor: Color(0xFFCA8A04),
    backgroundColor: Color(0xFFEDE9FE),
    icon: Icons.message,
  );

  final String label;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;

  const NotificationType({
    required this.label,
    required this.textColor,
    required this.backgroundColor,
    required this.icon,
  });
}

enum JobType {
  @JsonValue('On-campus')
  onCampus('On Campus'),

  @JsonValue('Off-campus')
  offCampus('Off Campus'),

  @JsonValue('Pool-campus')
  poolCampus('Pool Campus'),

  @JsonValue('Referral')
  referral('Referral'),

  @JsonValue('Internship')
  internship('Internship');

  final String label;

  const JobType(this.label);
}
