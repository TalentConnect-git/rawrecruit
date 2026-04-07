// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageDetail _$PackageDetailFromJson(Map<String, dynamic> json) =>
    _PackageDetail(
      currency: json['currency'] as String?,
      totalCTC: (json['totalCTC'] as num?)?.toInt(),
      fixedPay: (json['fixedPay'] as num?)?.toInt(),
      joiningBonus: (json['joiningBonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PackageDetailToJson(_PackageDetail instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'totalCTC': instance.totalCTC,
      'fixedPay': instance.fixedPay,
      'joiningBonus': instance.joiningBonus,
    };
