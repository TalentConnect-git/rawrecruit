// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralJobModel _$ReferralJobModelFromJson(
  Map<String, dynamic> json,
) => _ReferralJobModel(
  id: json['_id'] as String?,
  candidatePosted: json['candidatePosted'] == null
      ? null
      : CandidatePosted.fromJson(
          json['candidatePosted'] as Map<String, dynamic>,
        ),
  jobTitle: _jobTitleFromJson(json['jobTitle']),
  description: json['description'] as String?,
  jobStatus: json['jobStatus'] as String?,
  company: json['company'] as String?,
  currentCompany: json['currentCompany'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  jobType: json['jobType'] as String?,
  visibleTo: json['visibleTo'] as String?,
  broadcastType: json['broadcastType'] as String?,
  minEducation: json['minEducation'] as String?,
  workAuthorization: json['workAuthorization'] as String?,
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  yearsOfExperience: json['yearsOfExperience'] as String?,
  status: json['status'] as String?,
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  cgpa: (json['cgpa'] as num?)?.toInt(),
  views: (json['views'] as num?)?.toInt(),
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  degree: (json['degree'] as List<dynamic>?)?.map((e) => e as String).toList(),
  collegeTypes: (json['collegeTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collegeCategories: (json['collegeCategories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  companyType: (json['companyType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  studentStreams: (json['studentStreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  rounds: (json['rounds'] as List<dynamic>?)?.map((e) => e as String).toList(),
  selectionProcess: (json['selectionProcess'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  certifications: (json['certifications'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workAchievements: (json['workAchievements'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  amenitiesRequired: (json['amenitiesRequired'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  benefits: (json['benefits'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  toolsAndPlatforms: (json['toolsAndPlatforms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  workLocation: (json['workLocation'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  numberOfStudent: (json['numberOfStudent'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  packageDetails: json['packageDetails'] == null
      ? null
      : PackageDetails.fromJson(json['packageDetails'] as Map<String, dynamic>),
  endDate: json['endDate'] == null
      ? null
      : DateTime.parse(json['endDate'] as String),
  inactive: json['inactive'] as bool?,
  matchScore: (json['matchScore'] as num?)?.toInt(),
  expireAt: json['expireAt'] == null
      ? null
      : DateTime.parse(json['expireAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  metrics: json['metrics'] == null
      ? null
      : Metrics.fromJson(json['metrics'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ReferralJobModelToJson(_ReferralJobModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'candidatePosted': instance.candidatePosted,
      'jobTitle': instance.jobTitle,
      'description': instance.description,
      'jobStatus': instance.jobStatus,
      'company': instance.company,
      'currentCompany': instance.currentCompany,
      'approvalStatus': instance.approvalStatus,
      'jobType': instance.jobType,
      'visibleTo': instance.visibleTo,
      'broadcastType': instance.broadcastType,
      'minEducation': instance.minEducation,
      'workAuthorization': instance.workAuthorization,
      'eligibilityCriteria': instance.eligibilityCriteria,
      'yearsOfExperience': instance.yearsOfExperience,
      'status': instance.status,
      'numberOfOpenings': instance.numberOfOpenings,
      'cgpa': instance.cgpa,
      'views': instance.views,
      'location': instance.location,
      'workMode': instance.workMode,
      'employmentType': instance.employmentType,
      'skills': instance.skills,
      'degree': instance.degree,
      'collegeTypes': instance.collegeTypes,
      'collegeCategories': instance.collegeCategories,
      'companyType': instance.companyType,
      'studentStreams': instance.studentStreams,
      'rounds': instance.rounds,
      'selectionProcess': instance.selectionProcess,
      'certifications': instance.certifications,
      'workAchievements': instance.workAchievements,
      'amenitiesRequired': instance.amenitiesRequired,
      'benefits': instance.benefits,
      'tags': instance.tags,
      'toolsAndPlatforms': instance.toolsAndPlatforms,
      'workLocation': instance.workLocation,
      'numberOfStudent': instance.numberOfStudent,
      'packageDetails': instance.packageDetails,
      'endDate': instance.endDate?.toIso8601String(),
      'inactive': instance.inactive,
      'matchScore': instance.matchScore,
      'expireAt': instance.expireAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'metrics': instance.metrics,
    };

_CandidatePosted _$CandidatePostedFromJson(Map<String, dynamic> json) =>
    _CandidatePosted(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      about: json['about'] as String?,
      college: json['college'] as String?,
      degree: json['degree'] as String?,
      specialization: json['specialization'] as String?,
      yearOfGraduation: json['yearOfGraduation'] as String?,
      semester: json['semester'] as String?,
      cgpa: json['cgpa'] as String?,
      currentCompany: json['currentCompany'] as String?,
      noticePeriod: json['noticePeriod'] as String?,
      openToShift: json['openToShift'] as String?,
      profileType: json['profileType'] as String?,
      referralSource: json['referralSource'] as String?,
      currentSalaryAmount: json['currentSalaryAmount'] as String?,
      expectedSalaryAmount: json['expectedSalaryAmount'] as String?,
      github: json['github'] as String?,
      linkedin: json['linkedin'] as String?,
      portfolio: json['portfolio'] as String?,
      resume: json['resume'] as String?,
      certifications: json['certifications'] as String?,
      skills: json['skills'] as List<dynamic>?,
      jobRoles: json['jobRoles'] as List<dynamic>?,
      experiences: json['experiences'] as List<dynamic>?,
      toolsAndPlatforms: json['toolsAndPlatforms'] as List<dynamic>?,
      languagesKnown: json['languagesKnown'] as List<dynamic>?,
      domainKnowledge: json['domainKnowledge'] as List<dynamic>?,
      employmentType: json['employmentType'] as List<dynamic>?,
      industry: json['industry'] as List<dynamic>?,
      locations: json['locations'] as List<dynamic>?,
      lookingFor: json['lookingFor'] as List<dynamic>?,
      achievements: json['achievements'] as List<dynamic>?,
      awards: json['awards'] as List<dynamic>?,
      publications: json['publications'] as List<dynamic>?,
      internationalExperience:
          json['internationalExperience'] as List<dynamic>?,
      leadership: json['leadership'] as List<dynamic>?,
      servingNoticePeriod: json['servingNoticePeriod'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CandidatePostedToJson(_CandidatePosted instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'about': instance.about,
      'college': instance.college,
      'degree': instance.degree,
      'specialization': instance.specialization,
      'yearOfGraduation': instance.yearOfGraduation,
      'semester': instance.semester,
      'cgpa': instance.cgpa,
      'currentCompany': instance.currentCompany,
      'noticePeriod': instance.noticePeriod,
      'openToShift': instance.openToShift,
      'profileType': instance.profileType,
      'referralSource': instance.referralSource,
      'currentSalaryAmount': instance.currentSalaryAmount,
      'expectedSalaryAmount': instance.expectedSalaryAmount,
      'github': instance.github,
      'linkedin': instance.linkedin,
      'portfolio': instance.portfolio,
      'resume': instance.resume,
      'certifications': instance.certifications,
      'skills': instance.skills,
      'jobRoles': instance.jobRoles,
      'experiences': instance.experiences,
      'toolsAndPlatforms': instance.toolsAndPlatforms,
      'languagesKnown': instance.languagesKnown,
      'domainKnowledge': instance.domainKnowledge,
      'employmentType': instance.employmentType,
      'industry': instance.industry,
      'locations': instance.locations,
      'lookingFor': instance.lookingFor,
      'achievements': instance.achievements,
      'awards': instance.awards,
      'publications': instance.publications,
      'internationalExperience': instance.internationalExperience,
      'leadership': instance.leadership,
      'servingNoticePeriod': instance.servingNoticePeriod,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) =>
    _PackageDetails(
      currency: json['currency'] as String?,
      totalCTC: (json['totalCTC'] as num?)?.toInt(),
      fixedPay: (json['fixedPay'] as num?)?.toInt(),
      joiningBonus: (json['joiningBonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PackageDetailsToJson(_PackageDetails instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'totalCTC': instance.totalCTC,
      'fixedPay': instance.fixedPay,
      'joiningBonus': instance.joiningBonus,
    };
