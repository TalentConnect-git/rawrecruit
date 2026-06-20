// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'career_send_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CareerPageReferralSendResponse _$CareerPageReferralSendResponseFromJson(
  Map<String, dynamic> json,
) => _CareerPageReferralSendResponse(
  success: json['success'] as bool? ?? false,
  message: json['message'] as String? ?? '',
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CareerPageReferralSendResponseToJson(
  _CareerPageReferralSendResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
