import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
abstract class Status with _$Status {
  const factory Status({
    String? type,
    DateTime? since,
    @Default('') String note,
    DateTime? expectedReturn,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
