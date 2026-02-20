import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication.freezed.dart';
part 'publication.g.dart';

@freezed
abstract class Publication with _$Publication {
  factory Publication({
    @JsonKey(name: '_id') String? id,
    String? title,
    String? url,
  }) = _Publication;

  factory Publication.fromJson(Map<String, dynamic> json) =>
      _$PublicationFromJson(json);
}
