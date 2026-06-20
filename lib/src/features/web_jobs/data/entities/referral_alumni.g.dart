// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_alumni.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralAlumni _$ReferralAlumniFromJson(Map<String, dynamic> json) =>
    _ReferralAlumni(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      currentCompany: json['currentCompany'] as String?,
      profileImage: json['profileImage'] as String?,
      totalYearsOfExperience: json['totalYearsOfExperience'] as String?,
      jobRoles: (json['jobRoles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      college: json['college'] as String?,
      currentRole: json['currentRole'] as String?,
      about: json['about'] as String?,
      linkedin: json['linkedin'] as String?,
      github: json['github'] as String?,
      portfolio: json['portfolio'] as String?,
      isCurrentEmployee: json['isCurrentEmployee'] as bool?,
      isAlumni: json['isAlumni'] as bool?,
    );

Map<String, dynamic> _$ReferralAlumniToJson(_ReferralAlumni instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'currentCompany': instance.currentCompany,
      'profileImage': instance.profileImage,
      'totalYearsOfExperience': instance.totalYearsOfExperience,
      'jobRoles': instance.jobRoles,
      'college': instance.college,
      'currentRole': instance.currentRole,
      'about': instance.about,
      'linkedin': instance.linkedin,
      'github': instance.github,
      'portfolio': instance.portfolio,
      'isCurrentEmployee': instance.isCurrentEmployee,
      'isAlumni': instance.isAlumni,
    };
