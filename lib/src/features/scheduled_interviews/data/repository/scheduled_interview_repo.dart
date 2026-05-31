import 'package:rawrecruit/src/core/index.dart' show ResultFuture;
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart'
    show InterviewModel;

abstract class InterviewRepository {
  ResultFuture<List<InterviewModel>> getInterviews();
  ResultFuture<InterviewModel> getInterviewById(String interviewId);
}
