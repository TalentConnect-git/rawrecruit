import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/scheduled_interviews/data/index.dart';

class InterviewProvider extends ViewStateProvider {
  bool _newInterviewsAvailable = false;

  bool get hasNewInterviews => _newInterviewsAvailable;

  void setNewInterviewsAvailable() {
    _newInterviewsAvailable = true;
    notifyListeners();
  }

  void clearNewInterviewsAvailable() {
    _newInterviewsAvailable = false;
    notifyListeners();
  }

  Future<Failure?> checkForNewInterviews() async {
    Failure? failure;

    final result = await getIt<InterviewRepository>().checkForNewInterviews();

    result.fold((e) => failure = APIFailure.fromException(exception: e), (r) {
      if (r) {
        setNewInterviewsAvailable();
      } else {
        clearNewInterviewsAvailable();
      }
    });

    return failure;
  }
}
