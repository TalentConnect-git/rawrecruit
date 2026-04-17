import 'package:freezed_annotation/freezed_annotation.dart';

part 'incoming_request.freezed.dart';
part 'incoming_request.g.dart';

@freezed
abstract class IncomingRequest with _$IncomingRequest {
  const factory IncomingRequest({
    @JsonKey(name: '_id') String? id,
    String? currentStatus,
    num? matchScore,
    String? createdAt,
    String? jobTitle,
    String? applicantName,
    String? applicantEmail,
    String? applicantPhone,
    List<String>? skills,
    Map<String, dynamic>? academicBackground,
  }) = _IncomingRequest;

  factory IncomingRequest.fromJson(Map<String, dynamic> json) =>
      _$IncomingRequestFromJson(json);
}
