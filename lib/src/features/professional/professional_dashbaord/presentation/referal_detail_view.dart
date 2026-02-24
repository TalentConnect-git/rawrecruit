import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'view_model/prof_dashboard_view_model.dart';

class ReferralDetailView extends StatefulWidget {
  final String jobId;

  const ReferralDetailView({
    super.key,
    required this.jobId,
  });

  @override
  State<ReferralDetailView> createState() =>
      _ReferralDetailViewState();
}

class _ReferralDetailViewState
    extends State<ReferralDetailView> {

  final viewModel = ProfessionalViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.fetchReferralJobDetails(widget.jobId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ProfessionalViewModel>(
        builder: (context, vm, _) {

          if (vm.viewState == ViewState.busy) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final job = vm.selectedReferralJob;

          if (job == null) {
            return const Scaffold(
              body: Center(
                child: Text("No Data"),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(job.jobTitle ?? ""),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [

                  Text(job.description ?? ""),

                  const SizedBox(height: 20),

                  Text("Experience: ${job.yearsOfExperience}"),
                  Text("Education: ${job.minEducation}"),
                  Text("Work Authorization: ${job.workAuthorization}"),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 8,
                    children: (job.skills ?? [])
                        .map((e) => Chip(label: Text(e)))
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}