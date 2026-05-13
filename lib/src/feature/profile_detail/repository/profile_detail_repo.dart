import '../../../core/index.dart';

abstract class ProfileDetailRepository {
  ResultFuture<User> getProfileDetails(
    String userId,
  );
}