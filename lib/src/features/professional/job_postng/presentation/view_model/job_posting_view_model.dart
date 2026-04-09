import 'package:get_it/get_it.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';
import '../../../../../core/index.dart';


class ReferralPostViewModel extends ViewStateProvider {

  final _repository =
      GetIt.instance<ReferralPostRepository>();

  Future<bool> postJob(
    ReferralPostModel model,
  ) async {

    setViewState(ViewState.busy);

    final result =
        await _repository.postReferralJob(model);

    bool success = false;

    result.fold(
      (_) {},
      (_) => success = true,
    );

    setViewState(ViewState.complete);
    notifyListeners();

    return success;
  }
  

}