
import '../../../../core/index.dart';
import '../data_source/scheduled_data_source.dart';
import '../entity/interview_model.dart';
import 'scheduled_interview_repo.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  InterviewRepositoryImpl({required InterviewDataSource dataSource})
      : _dataSource = dataSource;

  final InterviewDataSource _dataSource;

  @override
  ResultFuture<List<InterviewModel>> getInterviews() =>
      _dataSource.getInterviews();
        @override

  @override
  ResultFuture<InterviewModel> getInterviewById(String interviewId) =>
      _dataSource.getInterviewById(interviewId);
}