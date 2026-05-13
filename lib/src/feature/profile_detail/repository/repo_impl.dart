import 'package:rawrecruit/src/core/index.dart';

import '../data/data_source.dart';
import 'profile_detail_repo.dart';



class ProfileDetailRepositoryImpl
    implements ProfileDetailRepository {

  final ProfileDetailDataSource
      profileDetailDataSource;

  ProfileDetailRepositoryImpl({
    required this.profileDetailDataSource,
  });
@override
ResultFuture<User> getProfileDetails(
  String userId,
) {
  return profileDetailDataSource
      .getProfileDetails(userId);
}
}