import 'package:dartz/dartz.dart';

import '../../../../../core/index.dart';
import '../../presentation/entities/referral_post_model.dart';
import 'job_posting_data_source.dart';


class ReferralPostDataSourceImpl
    implements ReferralPostDataSource {

  final NetworkService _networkService =
      NetworkService();

  @override
  ResultFuture<void> postReferralJob(
      ReferralPostModel model) async {

    final request = Request(
      method: RequestMethod.post,
      endpoint:
          "/api/hiring-channels/referral-posting",
      body: model.toJson(),
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}