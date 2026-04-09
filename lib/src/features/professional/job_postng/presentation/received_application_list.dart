import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/repository/application_repository.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo.dart';
import 'package:rawrecruit/src/features/professional/job_postng/data/repository/job_posting_repo_impl.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

import '../../../../core/index.dart';
import 'widgets/applicant_card.dart';

class ReferralApplicationsView extends StatefulWidget {
  final String jobId;

  const ReferralApplicationsView({super.key, required this.jobId});

  @override
  State<ReferralApplicationsView> createState() =>
      _ReferralApplicationsViewState();
}

class _ReferralApplicationsViewState
    extends State<ReferralApplicationsView> {
  List<ReferralApplication> applications = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApplications();
  }

 Future<void> _fetchApplications() async {
  final result = await getIt<ReferralPostRepository>()
      .getApplicationByReferralJobId(jobId: widget.jobId);

  result.fold(
    (failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(failure.message ?? "Error")),
      );
    },
    (data) {
      applications = data;
    },
  );

  if (mounted) {
    setState(() => isLoading = false);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kCard,
        title: const Text("Applications",
            style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: AppLoadingIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: applications.length,
              itemBuilder: (_, index) {
                return ApplicantCard(
                  application: applications[index],
                );
              },
            ),
    );
  }
}