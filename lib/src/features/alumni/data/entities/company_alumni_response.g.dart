// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_alumni_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyAlumniResponse _$CompanyAlumniResponseFromJson(
  Map<String, dynamic> json,
) => _CompanyAlumniResponse(
  companies: (json['companiesChecked'] as List<dynamic>?)
      ?.map((e) => CompanyChecked.fromJson(e as Map<String, dynamic>))
      .toList(),
  alumni: (json['alumniByCompany'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$CompanyAlumniResponseToJson(
  _CompanyAlumniResponse instance,
) => <String, dynamic>{
  'companiesChecked': instance.companies,
  'alumniByCompany': instance.alumni,
};

_CompanyChecked _$CompanyCheckedFromJson(Map<String, dynamic> json) =>
    _CompanyChecked(
      key: json['key'] as String?,
      canonicalId: json['canonicalId'] as String?,
      companyName: json['companyName'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$CompanyCheckedToJson(_CompanyChecked instance) =>
    <String, dynamic>{
      'key': instance.key,
      'canonicalId': instance.canonicalId,
      'companyName': instance.companyName,
      'displayName': instance.displayName,
    };
