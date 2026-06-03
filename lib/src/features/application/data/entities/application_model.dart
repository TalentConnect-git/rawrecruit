import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationStatusHistory;
import 'package:rawrecruit/src/features/notifications/index.dart';

part 'application_model.freezed.dart';
part 'application_model.g.dart';

@freezed
abstract class ApplicationModel with _$ApplicationModel {
  const factory ApplicationModel({
    @JsonKey(name: '_id') String? id,

    @UserOrStringConvertor() User? applicant,
    String? applicantType,
    String? appliedForCompany,
    String? referralCompany,
    String? appliedByType,

    String? adminApprovalStatus,
    String? currentStatus,
    String? jobType,

    bool? isVisited,

    @JobOrStringConvertor() Job? job,

    int? matchScore,
    String? adminComment,
    num? rating,

    DateTime? createdAt,
    DateTime? updatedAt,

    String? displayCompanyName,

    @JsonKey(name: 'jobDetails') Job? jobDetails,

    @JsonKey(name: 'companyProfile') CompanyDetail? companyProfile,

    List<ApplicationStatusHistory>? statusHistory,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
}
