// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyDetail _$CompanyDetailFromJson(Map<String, dynamic> json) =>
    _CompanyDetail(
      id: json['id'] as String?,
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

Map<String, dynamic> _$CompanyDetailToJson(_CompanyDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
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
