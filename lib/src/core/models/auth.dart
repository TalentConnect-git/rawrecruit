import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rawrecruit/src/core/index.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
abstract class Auth with _$Auth {
  const factory Auth({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? email,
    String? profileImage,
    String? linkedinId,
    bool? isNewUser,
    bool? onboardingCompleted,
    @UserTypeConverter() UserType? userType,
    @AuthProviderConvertor() AuthProvider? authProvider,
    @UserStatusConvertor() UserStatus? userStatus,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
