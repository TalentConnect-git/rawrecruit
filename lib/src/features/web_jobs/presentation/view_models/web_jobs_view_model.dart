import 'package:rawrecruit/src/core/index.dart';

import '../../data/entities/career_page_referral_response.dart';
import '../../data/entities/career_send_model.dart';
import '../../data/entities/web_job.dart';
import '../../data/index.dart';

class WebJobViewModel extends ViewStateProvider {
  final _repository = getIt<WebJobRepository>();

  CompanyJobsDiscovery? companyJobsDiscovery;
  CareerPageReferralResponse? careerPageReferralResponse;
  CareerPageReferralSendResponse? careerPageReferralSendResponse;
  Future<Failure?> discoverJobs({required String companyName}) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.discoverJobs(companyName: companyName);

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (response) {
        companyJobsDiscovery = response;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  void clearResults() {
    companyJobsDiscovery = null;
    notifyListeners();
  }

  Future<Failure?> requestCareerPageReferral({
    required String careerPageUrl,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.requestCareerPageReferral(
      careerPageUrl: careerPageUrl,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (response) {
        careerPageReferralResponse = response;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }

  Future<Failure?> sendCareerPageReferral({
    required String careerPageUrl,
    required List<String> receiverUserIds,
  }) async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.sendCareerPageReferral(
      careerPageUrl: careerPageUrl,
      receiverUserIds: receiverUserIds,
    );

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (response) {
        careerPageReferralSendResponse = response;
      },
    );

    setViewState(ViewState.complete);

    return failure;
  }
}
