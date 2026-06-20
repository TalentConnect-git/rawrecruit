import 'package:freezed_annotation/freezed_annotation.dart';

import 'referral_alumni.dart';
import 'referral_request.dart';

part 'career_page_referral_data.freezed.dart';
part 'career_page_referral_data.g.dart';

@freezed
abstract class CareerPageReferralData with _$CareerPageReferralData {
  const factory CareerPageReferralData({
    String? companyName,
    String? careerPageUrl,
    String? sourceType,
    @Default(0) int totalAlumniFound,
    @Default(0) int totalRequestsSent,
    @Default([]) List<ReferralAlumni> alumni,
    @Default([]) List<ReferralRequest> requests,
  }) = _CareerPageReferralData;

  factory CareerPageReferralData.fromJson(Map<String, dynamic> json) =>
      _$CareerPageReferralDataFromJson(json);
}
