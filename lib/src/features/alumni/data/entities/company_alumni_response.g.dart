// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_alumni_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyAlumniResponse _$CompanyAlumniResponseFromJson(
  Map<String, dynamic> json,
) => _CompanyAlumniResponse(
  companies: (json['companiesChecked'] as List<dynamic>?)
      ?.map((e) => e as String)
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
