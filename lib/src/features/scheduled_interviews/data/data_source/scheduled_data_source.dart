import '../../../../core/index.dart';
import '../entity/interview_model.dart';

abstract class InterviewDataSource {
  ResultFuture<List<InterviewModel>> getInterviews();
    ResultFuture<InterviewModel> getInterviewById(String interviewId);
}