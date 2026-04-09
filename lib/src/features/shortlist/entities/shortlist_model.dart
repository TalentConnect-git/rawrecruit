import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'shortlist_model.freezed.dart';
part 'shortlist_model.g.dart'; // ✅ ADD THIS

@freezed
abstract class ShortlistModel with _$ShortlistModel {
  const factory ShortlistModel({
    @JsonKey(name: '_id') String? id,
    String? jobType,
    String? currentStatus,
    DateTime? createdAt,

    @JsonKey(fromJson: _jobFromJson, toJson: _jobToJson)
    Job? job,
  }) = _ShortlistModel;

  factory ShortlistModel.fromJson(Map<String, dynamic> json) =>
      _$ShortlistModelFromJson(json);
}

/// 🔥 ADD THESE BELOW (OUTSIDE CLASS)

Job? _jobFromJson(Map<String, dynamic>? json) {
  if (json == null) return null;
  return Job.fromJson(json);
}

Map<String, dynamic>? _jobToJson(Job? job) {
  if (job == null) return null;
  return job.toJson();
}