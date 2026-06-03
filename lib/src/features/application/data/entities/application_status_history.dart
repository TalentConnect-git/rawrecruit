import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_status_history.freezed.dart';
part 'application_status_history.g.dart';

@freezed
abstract class ApplicationStatusHistory with _$ApplicationStatusHistory {
  const factory ApplicationStatusHistory({
    String? status,

    @JsonKey(name: '_id') String? id,

    DateTime? date,
  }) = _ApplicationStatusHistory;

  factory ApplicationStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$ApplicationStatusHistoryFromJson(json);
}
