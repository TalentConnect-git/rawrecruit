// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['_id'] as String?,
  userId: json['userId'] as String?,
  v: (json['__v'] as num?)?.toInt(),
  companyEmail: json['companyEmail'] as String?,
  achievements: (json['achievements'] as List<dynamic>?)
      ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
      .toList(),
  awards: (json['awards'] as List<dynamic>?)
      ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
      .toList(),
  publications: (json['publications'] as List<dynamic>?)
      ?.map((e) => Publication.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  profileImage: json['profileImage'] as String?,
  currentCompany: json['currentCompany'] as String?,
  responseRate: (json['responseRate'] as num?)?.toInt(),
  totalYearsOfExperience: json['totalYearsOfExperience'] as String?,
  noticePeriod: json['noticePeriod'] as String?,
  noticePeriodStartDate: json['noticePeriodStartDate'] as String?,
  servingNoticePeriod: json['servingNoticePeriod'] as bool?,
  domainKnowledge: (json['domainKnowledge'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  employmentType: (json['employmentType'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  experiences: (json['experiences'] as List<dynamic>?)
      ?.map((e) => Experience.fromJson(e as Map<String, dynamic>))
      .toList(),
  industry: (json['industry'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  leadershipExperiences: (json['leadership'] as List<dynamic>?)
      ?.map((e) => LeadershipExperience.fromJson(e as Map<String, dynamic>))
      .toList(),
  internationalExperiences: (json['internationalExperience'] as List<dynamic>?)
      ?.map((e) => InternationalExperience.fromJson(e as Map<String, dynamic>))
      .toList(),
  educations: (json['educations'] as List<dynamic>?)
      ?.map((e) => Education.fromJson(e as Map<String, dynamic>))
      .toList(),
  jobRoles: (json['jobRoles'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  languagesKnown: (json['languagesKnown'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  locations: (json['locations'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  lookingFor: (json['lookingFor'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  resume: json['resume'] as String?,
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
  toolsAndPlatforms: (json['toolsAndPlatforms'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  about: json['about'] as String?,
  certifications: json['certifications'] as String?,
  degreeCertificate: json['degreeCertificate'] as String?,
  email: json['email'] as String?,
  emailVerified: json['emailVerified'] as bool?,
  mobile: json['mobile'] as String?,
  designation: json['designation'] as String?,
  gender: json['gender'] as String?,
  github: json['github'] as String?,
  linkedin: json['linkedin'] as String?,
  name: json['name'] as String?,
  openToShift: json['openToShift'] as String?,
  phone: json['phone'] as String?,
  portfolio: json['portfolio'] as String?,
  profileType: json['profileType'] as String?,
  onboardingCompleted: json['onboardingCompleted'] as bool?,
  referralSource: json['referralSource'] as String?,
  currentSalaryAmount: json['currentSalaryAmount'] as String?,
  currentSalaryCurrency: json['currentSalaryCurrency'] as String?,
  dob: json['dob'] as String?,
  ethnicity: json['ethnicity'] as String?,
  expectedSalaryAmount: json['expectedSalaryAmount'] as String?,
  expectedSalaryCurrency: json['expectedSalaryCurrency'] as String?,
  maritalStatus: json['maritalStatus'] as String?,
  visaStatus: json['visaStatus'] as String?,
  referralJobs: (json['referralJobs'] as List<dynamic>?)
      ?.map((e) => Job.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  '_id': instance.id,
  'userId': instance.userId,
  '__v': instance.v,
  'companyEmail': instance.companyEmail,
  'achievements': instance.achievements,
  'awards': instance.awards,
  'publications': instance.publications,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'profileImage': instance.profileImage,
  'currentCompany': instance.currentCompany,
  'responseRate': instance.responseRate,
  'totalYearsOfExperience': instance.totalYearsOfExperience,
  'noticePeriod': instance.noticePeriod,
  'noticePeriodStartDate': instance.noticePeriodStartDate,
  'servingNoticePeriod': instance.servingNoticePeriod,
  'domainKnowledge': instance.domainKnowledge,
  'employmentType': instance.employmentType,
  'experiences': instance.experiences,
  'industry': instance.industry,
  'leadership': instance.leadershipExperiences,
  'internationalExperience': instance.internationalExperiences,
  'educations': instance.educations,
  'jobRoles': instance.jobRoles,
  'languagesKnown': instance.languagesKnown,
  'locations': instance.locations,
  'lookingFor': instance.lookingFor,
  'resume': instance.resume,
  'skills': instance.skills,
  'toolsAndPlatforms': instance.toolsAndPlatforms,
  'about': instance.about,
  'certifications': instance.certifications,
  'degreeCertificate': instance.degreeCertificate,
  'email': instance.email,
  'emailVerified': instance.emailVerified,
  'mobile': instance.mobile,
  'designation': instance.designation,
  'gender': instance.gender,
  'github': instance.github,
  'linkedin': instance.linkedin,
  'name': instance.name,
  'openToShift': instance.openToShift,
  'phone': instance.phone,
  'portfolio': instance.portfolio,
  'profileType': instance.profileType,
  'onboardingCompleted': instance.onboardingCompleted,
  'referralSource': instance.referralSource,
  'currentSalaryAmount': instance.currentSalaryAmount,
  'currentSalaryCurrency': instance.currentSalaryCurrency,
  'dob': instance.dob,
  'ethnicity': instance.ethnicity,
  'expectedSalaryAmount': instance.expectedSalaryAmount,
  'expectedSalaryCurrency': instance.expectedSalaryCurrency,
  'maritalStatus': instance.maritalStatus,
  'visaStatus': instance.visaStatus,
  'referralJobs': instance.referralJobs,
};
