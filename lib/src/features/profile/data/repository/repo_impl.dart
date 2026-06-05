import 'package:rawrecruit/src/core/index.dart' show User, ResultFuture;
import 'package:rawrecruit/src/features/profile/index.dart'
    show ProfileDetailDataSource;

import 'profile_detail_repo.dart';

class ProfileDetailRepositoryImpl implements ProfileDetailRepository {
  final ProfileDetailDataSource profileDetailDataSource;

  ProfileDetailRepositoryImpl({required this.profileDetailDataSource});
  @override
  ResultFuture<User> getProfileDetails(String userId) {
    return profileDetailDataSource.getProfileDetails(userId);
  }
}
