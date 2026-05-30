import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_detail.freezed.dart';
part 'company_detail.g.dart';

@freezed
abstract class CompanyDetail with _$CompanyDetail {
  const factory CompanyDetail({
    String? id,
    String? companyName,
    String? description,
    String? companyType,
    String? industryType,
    String? numberOfEmployees,
    String? establishedYear,
    String? websiteUrl,
    String? companyLinkedin,
    String? linkedinUrl,
    String? phoneNumber,
    String? alternatePhoneNumber,
    String? state,
    String? city,
    String? country,
    String? pincode,
  }) = _CompanyDetail;

  factory CompanyDetail.fromJson(Map<String, dynamic> json) =>
      _$CompanyDetailFromJson(json);
}
