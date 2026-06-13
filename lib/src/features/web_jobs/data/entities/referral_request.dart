import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral_request.freezed.dart';
part 'referral_request.g.dart';

@freezed
abstract class ReferralRequest with _$ReferralRequest {
  const factory ReferralRequest({
    @JsonKey(name: '_id') String? id,
    String? status,
  }) = _ReferralRequest;

  factory ReferralRequest.fromJson(Map<String, dynamic> json) =>
      _$ReferralRequestFromJson(json);
}
