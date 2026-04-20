// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Job _$JobFromJson(Map<String, dynamic> json) => _Job(
  id: json['_id'] as String?,
  jobTitle: json['jobTitle'] as String?,
  description: json['description'] as String?,
  jobStatus: json['jobStatus'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  visibleTo: json['visibleTo'] as String?,
  broadcastType: json['broadcastType'] as String?,
  jobType: json['jobType'] as String?,
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  companyName: json['companyName'] as String?,
  status: json['status'] as String?,
  workAuthorization: json['workAuthorization'] as String?,
  minEducation: json['minEducation'] as String?,
  yearsOfExperience: json['yearsOfExperience'],
  cgpa: json['cgpa'],
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  views: (json['views'] as num?)?.toInt(),
  matchScore: (json['matchScore'] as num?)?.toInt(),
  alumniCount: (json['alumniCount'] as num?)?.toInt(),
  jobRoles: _safeList(json['jobRoles']),
  location: _safeList(json['location']),
  workMode: _safeList(json['workMode']),
  skills: _safeList(json['skills']),
  benefits: _safeList(json['benefits']),
  certifications: (json['certifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  degree: (json['degree'] as List<dynamic>?)?.map((e) => e as String).toList(),
  studentStreams: (json['studentStreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workLocation: (json['workLocation'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  companyType: (json['companyType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collegeTypes: (json['collegeTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collegeCategories: (json['collegeCategories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  rounds: (json['rounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  selectionProcess: (json['selectionProcess'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workAchievements: (json['workAchievements'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  amenitiesRequired: (json['amenitiesRequired'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  toolsAndPlatforms: (json['toolsAndPlatforms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  numberOfStudent: (json['numberOfStudent'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  venue: json['venue'] as String?,
  internshipDuration: json['internshipDuration'] as String?,
  minimumStudents: json['minimumStudents'],
  packageDetails: json['packageDetails'] == null
      ? null
      : PackageDetail.fromJson(json['packageDetails'] as Map<String, dynamic>),
  contactPerson: json['contactPerson'] == null
      ? null
      : User.fromJson(json['contactPerson'] as Map<String, dynamic>),
  interviewWindow: json['interviewWindow'] == null
      ? null
      : Timeline.fromJson(json['interviewWindow'] as Map<String, dynamic>),
  candidatePosted: json['candidatePosted'] == null
      ? null
      : User.fromJson(json['candidatePosted'] as Map<String, dynamic>),
  companyPosted: json['companyPosted'] == null
      ? null
      : JobPosting.fromJson(json['companyPosted'] as Map<String, dynamic>),
  jobCompanyPosted: json['jobCompanyPosted'] == null
      ? null
      : JobPosting.fromJson(json['jobCompanyPosted'] as Map<String, dynamic>),
  onlineTestDate: json['onlineTestDate'] == null
      ? null
      : DateTime.parse(json['onlineTestDate'] as String),
  offerRolloutDate: json['offerRolloutDate'] == null
      ? null
      : DateTime.parse(json['offerRolloutDate'] as String),
  startDate: json['startDate'] == null
      ? null
      : DateTime.parse(json['startDate'] as String),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  expireAt: json['expireAt'] == null
      ? null
      : DateTime.parse(json['expireAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$JobToJson(_Job instance) => <String, dynamic>{
  '_id': instance.id,
  'jobTitle': instance.jobTitle,
  'description': instance.description,
  'jobStatus': instance.jobStatus,
  'approvalStatus': instance.approvalStatus,
  'visibleTo': instance.visibleTo,
  'broadcastType': instance.broadcastType,
  'jobType': instance.jobType,
  'eligibilityCriteria': instance.eligibilityCriteria,
  'companyName': instance.companyName,
  'status': instance.status,
  'workAuthorization': instance.workAuthorization,
  'minEducation': instance.minEducation,
  'yearsOfExperience': instance.yearsOfExperience,
  'cgpa': instance.cgpa,
  'numberOfOpenings': instance.numberOfOpenings,
  'views': instance.views,
  'matchScore': instance.matchScore,
  'alumniCount': instance.alumniCount,
  'jobRoles': instance.jobRoles,
  'location': instance.location,
  'workMode': instance.workMode,
  'skills': instance.skills,
  'benefits': instance.benefits,
  'certifications': instance.certifications,
  'degree': instance.degree,
  'studentStreams': instance.studentStreams,
  'employmentType': instance.employmentType,
  'workLocation': instance.workLocation,
  'companyType': instance.companyType,
  'collegeTypes': instance.collegeTypes,
  'collegeCategories': instance.collegeCategories,
  'rounds': instance.rounds,
  'selectionProcess': instance.selectionProcess,
  'workAchievements': instance.workAchievements,
  'amenitiesRequired': instance.amenitiesRequired,
  'toolsAndPlatforms': instance.toolsAndPlatforms,
  'tags': instance.tags,
  'numberOfStudent': instance.numberOfStudent,
  'venue': instance.venue,
  'internshipDuration': instance.internshipDuration,
  'minimumStudents': instance.minimumStudents,
  'packageDetails': instance.packageDetails,
  'contactPerson': instance.contactPerson,
  'interviewWindow': instance.interviewWindow,
  'candidatePosted': instance.candidatePosted,
  'companyPosted': instance.companyPosted,
  'jobCompanyPosted': instance.jobCompanyPosted,
  'onlineTestDate': instance.onlineTestDate?.toIso8601String(),
  'offerRolloutDate': instance.offerRolloutDate?.toIso8601String(),
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'expireAt': instance.expireAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
