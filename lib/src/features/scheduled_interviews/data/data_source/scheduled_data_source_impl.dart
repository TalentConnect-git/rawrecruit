import 'package:dartz/dartz.dart';

import '../../../../core/index.dart';
import '../entity/interview_model.dart';
import 'scheduled_data_source.dart';

class InterviewDataSourceImpl implements InterviewDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<InterviewModel>> getInterviews() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiInterviews,
      isSafeRoute: true, // Auth required
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      final interviews = data.map((e) => InterviewModel.fromJson(e)).toList();

      return Right(interviews);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
  
  @override
  ResultFuture<InterviewModel> getInterviewById(String interviewId) async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: '${Endpoints.apiInterviews}/$interviewId',
      isSafeRoute: true,
    );
 
    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;
 
      final interview = InterviewModel.fromJson(
        response['data'] as Map<String, dynamic>,
      );
 
      return Right(interview);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}