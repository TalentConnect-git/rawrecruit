import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'data_source.dart';

class ProfileDetailDataSourceImpl implements ProfileDetailDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<User> getProfileDetails(String userId) async {
    final request = Request(
      method: RequestMethod.get,

      endpoint: "/api/onboarding/get-details/$userId",

      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      return Right(User.fromJson(result.data['data']));
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
