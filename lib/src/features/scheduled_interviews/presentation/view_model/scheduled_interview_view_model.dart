
import '../../../../core/index.dart';
import '../../data/entity/interview_model.dart';
import '../../data/repository/scheduled_interview_repo.dart';

class InterviewViewModel extends ViewStateProvider {
  final _repository = getIt<InterviewRepository>();

  List<InterviewModel> interviews = [];
  InterviewModel? selectedInterview;
 
  Future<Failure?> getInterviews() async {
    Failure? failure;

    setViewState(ViewState.busy);

    final result = await _repository.getInterviews();

    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (data) {
        interviews = data;
      },
    );

    setViewState(ViewState.complete);
    return failure;
  }
  
  Future<Failure?> getInterviewById(String interviewId) async {
    Failure? failure;
 
    setViewState(ViewState.busy);
 
    final result = await _repository.getInterviewById(interviewId);
 
    result.fold(
      (exception) {
        failure = APIFailure.fromException(exception: exception);
      },
      (data) {
        selectedInterview = data;
      },
    );
 
    setViewState(ViewState.complete);
    return failure;
  }
}