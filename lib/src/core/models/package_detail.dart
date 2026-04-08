import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail.freezed.dart';
part 'package_detail.g.dart';

@freezed
abstract class PackageDetail with _$PackageDetail {
  const factory PackageDetail({
    String? currency,
    int? totalCTC,
    int? fixedPay,
    int? joiningBonus,
  }) = _PackageDetail;

  factory PackageDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailFromJson(json);
}
