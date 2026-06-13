import 'package:freezed_annotation/freezed_annotation.dart';

import 'career_page_referral_data.dart';

part 'career_page_referral_response.freezed.dart';
part 'career_page_referral_response.g.dart';

@freezed
abstract class CareerPageReferralResponse with _$CareerPageReferralResponse {
  const factory CareerPageReferralResponse({
    @Default(false) bool success,
    @Default('') String message,
    CareerPageReferralData? data,
  }) = _CareerPageReferralResponse;

  factory CareerPageReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$CareerPageReferralResponseFromJson(json);
}
