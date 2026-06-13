import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart'
    show
        NetworkService,
        ResultFuture,
        Request,
        RequestMethod,
        Endpoints,
        APIException;
import 'package:rawrecruit/src/features/scheduled_interviews/index.dart'
    show InterviewModel;

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
    } catch (e, s) {
      log('$e\n$s');
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<bool> checkForNewInterviews() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.interviewsUnread,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      return Right(data.isNotEmpty);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<InterviewModel> markInterviewAsRead(String interviewId) async {
    final Request request = Request(
      method: RequestMethod.patch,
      endpoint: '${Endpoints.apiInterviews}/$interviewId/mark-read',
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
