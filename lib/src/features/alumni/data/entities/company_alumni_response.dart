import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'company_alumni_response.freezed.dart';
part 'company_alumni_response.g.dart';

@freezed
abstract class CompanyAlumniResponse with _$CompanyAlumniResponse {
  const factory CompanyAlumniResponse({
    @JsonKey(name: 'companiesChecked') List<CompanyChecked>? companies,
    @JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni,
  }) = _CompanyAlumniResponse;

  factory CompanyAlumniResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyAlumniResponseFromJson(json);
}

@freezed
abstract class CompanyChecked with _$CompanyChecked {
  const factory CompanyChecked({
    String? key,
    String? canonicalId,
    String? companyName,
    String? displayName,
  }) = _CompanyChecked;

  factory CompanyChecked.fromJson(Map<String, dynamic> json) =>
      _$CompanyCheckedFromJson(json);
}
