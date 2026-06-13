import 'package:rawrecruit/src/core/index.dart' show ResultFuture;
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart'
    show InterviewDataSource, InterviewModel;

import 'scheduled_interview_repo.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  InterviewRepositoryImpl({required InterviewDataSource dataSource})
    : _dataSource = dataSource;

  final InterviewDataSource _dataSource;

  @override
  ResultFuture<List<InterviewModel>> getInterviews() =>
      _dataSource.getInterviews();

  @override
  ResultFuture<InterviewModel> getInterviewById(String interviewId) =>
      _dataSource.getInterviewById(interviewId);

  @override
  ResultFuture<bool> checkForNewInterviews() =>
      _dataSource.checkForNewInterviews();

  @override
  ResultFuture<InterviewModel> markInterviewAsRead(String interviewId) =>
      _dataSource.markInterviewAsRead(interviewId);
}
