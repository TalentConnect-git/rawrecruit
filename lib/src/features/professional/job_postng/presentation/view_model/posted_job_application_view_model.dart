import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
import 'package:rawrecruit/src/features/professional/job_postng/utils/enum.dart';

class PostedJobApplicationViewModel extends ViewStateProvider {
  final _referralPostRepository = getIt<ReferralPostRepository>();

  List<ReferralApplication> _application = [];
  List<ReferralApplication> get application => _application;
  set application(List<ReferralApplication> application) {
    _application = application;
    notifyListeners();
  }

  Future<Failure?> getApplications({required String id}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _referralPostRepository.getApplicationByReferralJobId(
      jobId: id,
    );

    result.fold(
      (e) {
        failure = APIFailure.fromException(exception: e);
      },
      (r) {
        application = r;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> updateApplicationStatus({
    required String id,
    required ApplicationStatus status,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _referralPostRepository.updateReferralJobStatus(
      status: status.label,
      applicationId: id,
    );

    result.fold((e) {
      failure = APIFailure.fromException(exception: e);
    }, (r) {});

    setViewState(ViewState.complete);

    return failure;
  }
}
