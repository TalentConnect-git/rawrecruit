import 'package:rawrecruit/src/core/index.dart' show ResultFuture, User;

abstract class ProfileDetailRepository {
  ResultFuture<User> getProfileDetails(String userId);
}
