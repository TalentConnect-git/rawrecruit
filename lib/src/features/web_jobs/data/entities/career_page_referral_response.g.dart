// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_page_referral_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerPageReferralResponse _$CareerPageReferralResponseFromJson(
  Map<String, dynamic> json,
) => _CareerPageReferralResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] == null
      ? null
      : CareerPageReferralData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CareerPageReferralResponseToJson(
  _CareerPageReferralResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
