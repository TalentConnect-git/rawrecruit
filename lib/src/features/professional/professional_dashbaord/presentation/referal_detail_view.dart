import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'view_model/prof_dashboard_view_model.dart';

class ReferralDetailView extends StatefulWidget {
  final String jobId;

  const ReferralDetailView({super.key, required this.jobId});

  @override
  State<ReferralDetailView> createState() => _ReferralDetailViewState();
}

class _ReferralDetailViewState extends State<ReferralDetailView> {
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
              body: Center(child: CircularProgressIndicator()),
            );
          }

          final job = vm.selectedReferralJob;

          if (job == null) {
            return const Scaffold(body: Center(child: Text("No Data")));
          }

          return Scaffold(
            appBar: AppBar(title: Text(job.jobTitle ?? "")),
           body: Padding(
  padding: const EdgeInsets.all(16),
  child: ListView(
    children: [

      /// Description
      _buildRow("Description", job.description),

      const SizedBox(height: 12),

      /// Basic Info
      _buildRow("Experience", job.yearsOfExperience),
      _buildRow("Education", job.minEducation),
      _buildRow("Work Authorization", job.workAuthorization),
      _buildRow("Eligibility Criteria", job.eligibilityCriteria),
      _buildRow("Number of Openings",
          job.numberOfOpenings?.toString()),

      /// Employment Type
      _buildRow(
        "Employment Type",
        job.employmentType?.join(", "),
      ),

      /// Work Mode
      _buildRow(
        "Work Mode",
        job.workMode?.join(", "),
      ),

      /// Location
      _buildRow(
        "Location",
        job.location?.join(", "),
      ),

      const SizedBox(height: 20),

      /// ✅ PACKAGE DETAILS (SEPARATE FIELDS)
      const Text(
        "Package Details",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10),

      _buildRow(
        "Currency",
        job.packageDetails?.currency,
      ),

      _buildRow(
        "Total CTC",
        job.packageDetails?.totalCTC?.toString(),
      ),

      _buildRow(
        "Fixed Pay",
        job.packageDetails?.fixedPay?.toString(),
      ),

      _buildRow(
        "Joining Bonus",
        job.packageDetails?.joiningBonus?.toString(),
      ),

      const SizedBox(height: 20),

      /// Benefits
      _buildRow(
        "Benefits",
        job.benefits?.join(", "),
      ),

      /// Tags
      _buildRow(
        "Tags",
        job.tags?.join(", "),
      ),

      const SizedBox(height: 20),

      /// Skills
      const Text(
        "Skills",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 8),

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
  Widget _buildRow(String title, String? value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            "$title:",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(value?.isNotEmpty == true ? value! : "-"),
        ),
      ],
    ),
  );
}
}
