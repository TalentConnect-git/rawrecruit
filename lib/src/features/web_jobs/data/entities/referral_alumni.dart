import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_alumni.freezed.dart';
part 'referral_alumni.g.dart';

@freezed
abstract class ReferralAlumni with _$ReferralAlumni {
  const factory ReferralAlumni({String? userId}) = _ReferralAlumni;

  factory ReferralAlumni.fromJson(Map<String, dynamic> json) =>
      _$ReferralAlumniFromJson(json);
}
