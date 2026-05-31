import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'company_alumni_response.freezed.dart';
part 'company_alumni_response.g.dart';

@freezed
abstract class CompanyAlumniResponse with _$CompanyAlumniResponse {
  const factory CompanyAlumniResponse({
    @JsonKey(name: 'companiesChecked') List<String>? companies,
    @JsonKey(name: 'alumniByCompany') Map<String, List<User>>? alumni,
  }) = _CompanyAlumniResponse;

  factory CompanyAlumniResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyAlumniResponseFromJson(json);
}
