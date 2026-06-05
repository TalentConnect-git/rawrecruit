import '../../../../core/index.dart';

abstract class ProfileDetailDataSource {
  ResultFuture<User> getProfileDetails(String userId);
}
