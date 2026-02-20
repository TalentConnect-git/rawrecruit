import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/features/dashboard/data/data_source/dashbooard_data_source.dart';
import 'package:rawrecruit/src/features/dashboard/entities/internship_model.dart';
import 'package:rawrecruit/src/features/dashboard/entities/job_model.dart';

import '../../../../core/index.dart';

class DashboardDataSourceImpl implements DashboardDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<JobModel>> getOffCampusJobs() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiOffCampusJobs,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      final jobs = data.map((e) => JobModel.fromJson(e)).toList();

      return Right(jobs);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<InternshipModel>> getInternships() async {
    final Request request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.apiInternshipPostings,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);
      final response = result.data as Map<String, dynamic>;

      final List data = response['data'] ?? [];

      final internships = data.map((e) => InternshipModel.fromJson(e)).toList();

      return Right(internships);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
