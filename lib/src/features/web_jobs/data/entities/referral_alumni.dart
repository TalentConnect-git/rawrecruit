import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/education.dart';
import '../../../../core/models/experience.dart';

part 'referral_alumni.freezed.dart';
part 'referral_alumni.g.dart';

@freezed
abstract class ReferralAlumni with _$ReferralAlumni {
  const factory ReferralAlumni({
    String? userId,
    String? name,
    String? currentCompany,
    String? profileImage,
    String? totalYearsOfExperience,
    List<String>? jobRoles,

    String? college,
    String? currentRole,
    bool? currentlyWorking,
    bool? previouslyWorked,

    String? about,
    String? linkedin,
    String? github,
    String? portfolio,

    bool? isCurrentEmployee,
    bool? isAlumni,
  }) = _ReferralAlumni;

  factory ReferralAlumni.fromJson(Map<String, dynamic> json) =>
      _$ReferralAlumniFromJson(json);
}
