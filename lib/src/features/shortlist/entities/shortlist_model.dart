import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/feature/revamp_dashboard/entities/job_model.dart';

part 'shortlist_model.freezed.dart';
part 'shortlist_model.g.dart';

@freezed
abstract class ShortlistModel with _$ShortlistModel {
  const factory ShortlistModel({
    @JsonKey(name: '_id') String? id,
    String? jobType,
    String? currentStatus,
    DateTime? createdAt,

    /// 🔥 ADD THIS
    JobModel? job,
  }) = _ShortlistModel;

  factory ShortlistModel.fromJson(Map<String, dynamic> json) =>
      _$ShortlistModelFromJson(json);
}
