import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import 'application_data_source.dart';

class ApplicationDataSourceImpl implements ApplicationDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<void> applyOffCampus({required String jobId}) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.applyOffCampus,
      body: {"jobId": jobId},
      isSafeRoute: true,
    );

    try {
      await _networkService.request(request);
      return const Right(null);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }


@override
ResultFuture<List<ReferralApplication>> fetchReferralApplications() async {
  final request = Request(
    method: RequestMethod.get,
    endpoint: "/application/all-referrals",
    isSafeRoute: true,
  );

  try {
    final result = await _networkService.request(request);

    final body = result.data as Map<String, dynamic>;
    final List data = body['data'];

    final list = data.map<ReferralApplication>((e) {
      return ReferralApplication.fromJson({
        "_id": e["_id"],

        "applicantType": e["applicantType"],
        "adminApprovalStatus": e["adminApprovalStatus"],
        "createdAt": e["createdAt"],
"statusText": e["currentStatus"],        
           "matchScore": e["matchScore"],
"jobTitle": e["jobTitle"],
"skills": e["skills"] ?? [],
        /// 🔥 CONVERT FLAT API → NESTED USER
        "applicant": {
          "name": e["applicantName"],
          "email": e["applicantEmail"],
          "phone": e["applicantPhone"],
          "college": e["academicBackground"]?["collegeName"],
        },

        /// OPTIONAL JOB
        "job": {
          "title": e["jobTitle"],
          "id": e["jobId"],
        }
      });
    }).toList();

    return Right(list);
  } catch (e) {
    return Left(APIException.from(e));
  }
}
@override
ResultFuture<List<Job>> fetchAppliedJobs() async {
  final request = Request(
    method: RequestMethod.get,
    endpoint: Endpoints.applicationStatus,
    isSafeRoute: true,
  );

  try {
    final result = await _networkService.request(request);

    final body = result.data as Map<String, dynamic>;
    final List<dynamic> data = body['data'];

    print("🔥 RAW DATA LENGTH: ${data.length}");

    final list = data.map((e) {
      final job = e['jobDetails'];
      final company = e['companyProfile'];

      print("👉 JOB: $job");
      print("👉 COMPANY: $company");

      if (job == null) return null;

      try {
        return Job.fromJson({
          ...job,

          // 🔥 FIX: remove problematic object fields
          "companyPosted": null,
          "jobCompanyPosted": null,
          "candidatePosted": null,
          "contactPerson": null,

          // ✅ inject company name
          "companyName":
              company?['companyDetails']?['companyName'] ?? "-",

          // ✅ inject status
          "status": e['currentStatus'] ?? "pending",
        });
      } catch (err) {
        print("❌ ERROR parsing Job: $err");
        return null;
      }
    }).whereType<Job>().toList();

    print("✅ MAPPED LIST LENGTH: ${list.length}");

    return Right(list);
  } catch (e, stack) {
    print("❌ ERROR IN DATASOURCE: $e");
    print("❌ STACK: $stack");

    return Left(APIException.from(e));
  }
}
}
