import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_send_model.freezed.dart';
part 'career_send_model.g.dart';

@freezed
abstract class CareerPageReferralSendResponse
    with _$CareerPageReferralSendResponse {
  const factory CareerPageReferralSendResponse({
    @Default(false) bool success,
    @Default('') String message,
    Map<String, dynamic>? data,
  }) = _CareerPageReferralSendResponse;

  factory CareerPageReferralSendResponse.fromJson(Map<String, dynamic> json) =>
      _$CareerPageReferralSendResponseFromJson(json);
}
