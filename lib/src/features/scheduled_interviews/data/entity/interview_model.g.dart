// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterviewModel _$InterviewModelFromJson(Map<String, dynamic> json) =>
    _InterviewModel(
      id: json['_id'] as String?,
      jobId: json['jobId'] == null
          ? null
          : InterviewJobRef.fromJson(json['jobId'] as Map<String, dynamic>),
      jobType: json['jobType'] as String?,
      applicationId: json['applicationId'] as String?,
      companyAuthId: json['companyAuthId'] as String?,
      applicantType: json['applicantType'] as String?,
      applicantAuthId: json['applicantAuthId'] as String?,
      applicantProfileId: json['applicantProfileId'] as String?,
      applicantSnapshot: json['applicantSnapshot'] == null
          ? null
          : InterviewApplicantSnapshot.fromJson(
              json['applicantSnapshot'] as Map<String, dynamic>,
            ),
      coordinator: json['coordinator'] == null
          ? null
          : InterviewCoordinator.fromJson(
              json['coordinator'] as Map<String, dynamic>,
            ),
      companySnapshot: json['companySnapshot'] == null
          ? null
          : InterviewCompanySnapshot.fromJson(
              json['companySnapshot'] as Map<String, dynamic>,
            ),
      jobRole: (json['jobRole'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      meetLink: json['meetLink'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      emailStatus: json['emailStatus'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      readByApplicant: json['readByApplicant'] as bool?,
    );

Map<String, dynamic> _$InterviewModelToJson(_InterviewModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobId': instance.jobId,
      'jobType': instance.jobType,
      'applicationId': instance.applicationId,
      'companyAuthId': instance.companyAuthId,
      'applicantType': instance.applicantType,
      'applicantAuthId': instance.applicantAuthId,
      'applicantProfileId': instance.applicantProfileId,
      'applicantSnapshot': instance.applicantSnapshot,
      'coordinator': instance.coordinator,
      'companySnapshot': instance.companySnapshot,
      'jobRole': instance.jobRole,
      'date': instance.date,
      'time': instance.time,
      'meetLink': instance.meetLink,
      'message': instance.message,
      'status': instance.status,
      'emailStatus': instance.emailStatus,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'readByApplicant': instance.readByApplicant,
    };

_InterviewJobRef _$InterviewJobRefFromJson(Map<String, dynamic> json) =>
    _InterviewJobRef(
      id: json['_id'] as String?,
      jobType: json['jobType'] as String?,
      jobTitle: json['jobTitle'] as List<dynamic>?,
      companyName: json['companyName'] as String?,
    );

Map<String, dynamic> _$InterviewJobRefToJson(_InterviewJobRef instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'jobType': instance.jobType,
      'jobTitle': instance.jobTitle,
      'companyName': instance.companyName,
    };

_InterviewApplicantSnapshot _$InterviewApplicantSnapshotFromJson(
  Map<String, dynamic> json,
) => _InterviewApplicantSnapshot(
  name: json['name'] as String?,
  collegeName: json['collegeName'] as String?,
  designation: json['designation'] as String?,
  profileType: json['profileType'] as String?,
);

Map<String, dynamic> _$InterviewApplicantSnapshotToJson(
  _InterviewApplicantSnapshot instance,
) => <String, dynamic>{
  'name': instance.name,
  'collegeName': instance.collegeName,
  'designation': instance.designation,
  'profileType': instance.profileType,
};

_InterviewCoordinator _$InterviewCoordinatorFromJson(
  Map<String, dynamic> json,
) => _InterviewCoordinator(
  name: json['name'] as String?,
  designation: json['designation'] as String?,
  collegeName: json['collegeName'] as String?,
);

Map<String, dynamic> _$InterviewCoordinatorToJson(
  _InterviewCoordinator instance,
) => <String, dynamic>{
  'name': instance.name,
  'designation': instance.designation,
  'collegeName': instance.collegeName,
};

_InterviewCompanySnapshot _$InterviewCompanySnapshotFromJson(
  Map<String, dynamic> json,
) => _InterviewCompanySnapshot(
  companyName: json['companyName'] as String?,
  scheduledBy: json['scheduledBy'] == null
      ? null
      : InterviewScheduledBy.fromJson(
          json['scheduledBy'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$InterviewCompanySnapshotToJson(
  _InterviewCompanySnapshot instance,
) => <String, dynamic>{
  'companyName': instance.companyName,
  'scheduledBy': instance.scheduledBy,
};

_InterviewScheduledBy _$InterviewScheduledByFromJson(
  Map<String, dynamic> json,
) => _InterviewScheduledBy(
  name: json['name'] as String?,
  email: json['email'] as String?,
  designation: json['designation'] as String?,
);

Map<String, dynamic> _$InterviewScheduledByToJson(
  _InterviewScheduledBy instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'designation': instance.designation,
};
