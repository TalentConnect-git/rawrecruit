// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobModel _$JobModelFromJson(Map<String, dynamic> json) => _JobModel(
  id: json['_id'] as String?,
  jobTitle: json['jobTitle'] as String?,
  description: json['description'] as String?,
  jobType: json['jobType'] as String?,
  jobStatus: json['jobStatus'] as String?,
  approvalStatus: json['approvalStatus'] as String?,
  visibleTo: json['visibleTo'] as String?,
  broadcastType: json['broadcastType'] as String?,
  eligibilityCriteria: json['eligibilityCriteria'] as String?,
  minimumStudents: json['minimumStudents'] as String?,
  venue: json['venue'] as String?,
  companyName: json['companyName'] as String?,
  cgpa: _doubleFromJson(json['cgpa']),
  numberOfOpenings: (json['numberOfOpenings'] as num?)?.toInt(),
  views: (json['views'] as num?)?.toInt(),
  matchScore: (json['matchScore'] as num?)?.toInt(),
  jobRoles: (json['jobRoles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  workMode: (json['workMode'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  location: (json['location'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  degree: (json['degree'] as List<dynamic>?)?.map((e) => e as String).toList(),
  studentStreams: (json['studentStreams'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collegeTypes: (json['collegeTypes'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collegeCategories: (json['collegeCategories'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  companyType: (json['companyType'] as List<dynamic>?)
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
      : JobPackageDetails.fromJson(
          json['packageDetails'] as Map<String, dynamic>,
        ),
  interviewWindow: json['interviewWindow'] == null
      ? null
      : InterviewWindow.fromJson(
          json['interviewWindow'] as Map<String, dynamic>,
        ),
  contactPerson: json['contactPerson'] == null
      ? null
      : ContactPerson.fromJson(json['contactPerson'] as Map<String, dynamic>),
  companyPosted: json['companyPosted'] == null
      ? null
      : JobCompanyPosted.fromJson(
          json['companyPosted'] as Map<String, dynamic>,
        ),
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

Map<String, dynamic> _$JobModelToJson(_JobModel instance) => <String, dynamic>{
  '_id': instance.id,
  'jobTitle': instance.jobTitle,
  'description': instance.description,
  'jobType': instance.jobType,
  'jobStatus': instance.jobStatus,
  'approvalStatus': instance.approvalStatus,
  'visibleTo': instance.visibleTo,
  'broadcastType': instance.broadcastType,
  'eligibilityCriteria': instance.eligibilityCriteria,
  'minimumStudents': instance.minimumStudents,
  'venue': instance.venue,
  'companyName': instance.companyName,
  'cgpa': instance.cgpa,
  'numberOfOpenings': instance.numberOfOpenings,
  'views': instance.views,
  'matchScore': instance.matchScore,
  'jobRoles': instance.jobRoles,
  'skills': instance.skills,
  'workMode': instance.workMode,
  'location': instance.location,
  'employmentType': instance.employmentType,
  'degree': instance.degree,
  'studentStreams': instance.studentStreams,
  'collegeTypes': instance.collegeTypes,
  'collegeCategories': instance.collegeCategories,
  'companyType': instance.companyType,
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
  'interviewWindow': instance.interviewWindow,
  'contactPerson': instance.contactPerson,
  'companyPosted': instance.companyPosted,
  'onlineTestDate': instance.onlineTestDate?.toIso8601String(),
  'offerRolloutDate': instance.offerRolloutDate?.toIso8601String(),
  'startDate': instance.startDate?.toIso8601String(),
  'endDate': instance.endDate?.toIso8601String(),
  'expireAt': instance.expireAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

_InterviewWindow _$InterviewWindowFromJson(Map<String, dynamic> json) =>
    _InterviewWindow(
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$InterviewWindowToJson(_InterviewWindow instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };

_JobPackageDetails _$JobPackageDetailsFromJson(Map<String, dynamic> json) =>
    _JobPackageDetails(
      currency: json['currency'] as String?,
      totalCTC: (json['totalCTC'] as num?)?.toInt(),
      fixedPay: (json['fixedPay'] as num?)?.toInt(),
      joiningBonus: (json['joiningBonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$JobPackageDetailsToJson(_JobPackageDetails instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'totalCTC': instance.totalCTC,
      'fixedPay': instance.fixedPay,
      'joiningBonus': instance.joiningBonus,
    };

_ContactPerson _$ContactPersonFromJson(Map<String, dynamic> json) =>
    _ContactPerson(
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      linkedin: json['linkedin'] as String?,
    );

Map<String, dynamic> _$ContactPersonToJson(_ContactPerson instance) =>
    <String, dynamic>{
      'name': instance.name,
      'designation': instance.designation,
      'email': instance.email,
      'mobile': instance.mobile,
      'linkedin': instance.linkedin,
    };

_JobCompanyPosted _$JobCompanyPostedFromJson(Map<String, dynamic> json) =>
    _JobCompanyPosted(
      id: json['_id'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      employerDetails: json['employerDetails'] == null
          ? null
          : JobEmployerDetails.fromJson(
              json['employerDetails'] as Map<String, dynamic>,
            ),
      companyDetails: json['companyDetails'] == null
          ? null
          : JobCompanyDetails.fromJson(
              json['companyDetails'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$JobCompanyPostedToJson(_JobCompanyPosted instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'profileImageUrl': instance.profileImageUrl,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'employerDetails': instance.employerDetails,
      'companyDetails': instance.companyDetails,
    };

_JobEmployerDetails _$JobEmployerDetailsFromJson(Map<String, dynamic> json) =>
    _JobEmployerDetails(
      name: json['name'] as String?,
      designation: json['designation'] as String?,
      workEmail: json['workEmail'] as String?,
      mobile: json['mobile'] as String?,
      linkedIn: json['linkedIn'] as String?,
    );

Map<String, dynamic> _$JobEmployerDetailsToJson(_JobEmployerDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'designation': instance.designation,
      'workEmail': instance.workEmail,
      'mobile': instance.mobile,
      'linkedIn': instance.linkedIn,
    };

_JobCompanyDetails _$JobCompanyDetailsFromJson(Map<String, dynamic> json) =>
    _JobCompanyDetails(
      companyName: json['companyName'] as String?,
      description: json['description'] as String?,
      companyType: json['companyType'] as String?,
      industryType: json['industryType'] as String?,
      numberOfEmployees: json['numberOfEmployees'] as String?,
      establishedYear: json['establishedYear'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      companyLinkedin: json['companyLinkedin'] as String?,
      linkedinUrl: json['linkedinUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      alternatePhoneNumber: json['alternatePhoneNumber'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
    );

Map<String, dynamic> _$JobCompanyDetailsToJson(_JobCompanyDetails instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'description': instance.description,
      'companyType': instance.companyType,
      'industryType': instance.industryType,
      'numberOfEmployees': instance.numberOfEmployees,
      'establishedYear': instance.establishedYear,
      'websiteUrl': instance.websiteUrl,
      'companyLinkedin': instance.companyLinkedin,
      'linkedinUrl': instance.linkedinUrl,
      'phoneNumber': instance.phoneNumber,
      'alternatePhoneNumber': instance.alternatePhoneNumber,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'pincode': instance.pincode,
    };
