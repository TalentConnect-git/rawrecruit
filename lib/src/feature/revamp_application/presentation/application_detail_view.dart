import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_application/entities/application_model.dart';
import 'package:rawrecruit/src/feature/revamp_application/presentation/widget/application_progress_stepper.dart';

class ApplicationDetailView extends StatelessWidget {
  final ApplicationModel? model;

  const ApplicationDetailView({super.key, required this.model});

  int _getStep(String status) {
    switch (status.toLowerCase()) {
      case "applied":
        return 0;
      case "shortlisted":
        return 1;
      case "accepted":
      case "rejected":
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final job = model?.jobDetails;
    final company = model?.companyProfile?.companyDetails;
    final status = model?.currentStatus ?? "";

    final jobTitle = (job?.jobRoles ?? []).isNotEmpty
        ? job?.jobRoles?.firstOrNull
        : "-";

    final location = (job?.location ?? []).isNotEmpty
        ? job?.location?.firstOrNull
        : "-";

    final jobType = job?.jobType ?? "-";
    final package = job?.packageDetails;

    final totalCTC = package?.totalCTC != null
        ? "${package!.currency ?? "INR"} ${package.totalCTC}"
        : "-";

    final fixedPay = package?.fixedPay != null
        ? "${package!.currency ?? "INR"} ${package.fixedPay}"
        : "-";

    final joiningBonus = package?.joiningBonus != null
        ? "${package!.currency ?? "INR"} ${package.joiningBonus}"
        : "-";
    return Scaffold(
      backgroundColor: AppColors.secBorder,
      appBar: RAppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
        title: Text(
          company?.companyName ?? "",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        
        child: ListView(
          children: [
            /// 🔥 Job Header Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jobTitle ?? '-', style: AppTextStyles.s22W600.copyWith(color: AppColors.white)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                       Icon(Icons.location_on, size: 16,color: AppColors.kGreen,),
                      const SizedBox(width: 4),
                      Text(location ?? '-',style: AppTextStyles.s22W600.copyWith(color: AppColors.white)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Progress Stepper
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
color: AppColors.kCard,
border: Border.all(color: AppColors.kBorder),                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.white.withValues(alpha: 0.05),
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ApplicationProgressStepper(
                currentStep: _getStep(status),
                status: status,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Basic Info Section
            Text("Application Info", style: AppTextStyles.s16W600.copyWith(color: AppColors.white)),

            const SizedBox(height: 16),

            _InfoRow(
              label1: "Status",
              value1: status,
              label2: "Company",
              value2: company?.companyName ?? "-",
            ),

            const SizedBox(height: 16),

            _InfoRow(
              label1: "Role",
              value1: jobTitle ?? '-',
              label2: "Location",
              value2: location ?? '-',
            ),
            const SizedBox(height: 16),
            _InfoRow(
              label1: "Job Type",
              value1: jobType,
              label2: "Employment",
              value2: job?.employmentType?.firstOrNull ?? "-",
            ),
            const SizedBox(height: 16),

            _InfoRow(
              label1: "Total CTC",
              value1: totalCTC,
              label2: "Fixed Pay",
              value2: fixedPay,
            ),
            const SizedBox(height: 16),
            _InfoRow(
              label1: "Joining Bonus",
              value1: joiningBonus,
              label2: "Work Mode",
              value2: job?.workMode?.firstOrNull ?? "-",
            ),
            const SizedBox(height: 30),

            /// 🔥 Withdraw Button
            OutlinedButton(
              onPressed: status.toLowerCase() == "accepted"
                  ? null
                  : () {
                      // TODO: implement withdraw logic
                    },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: status.toLowerCase() == "accepted"
                      ? Colors.grey
                      : Colors.red.shade400,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                status.toLowerCase() == "accepted"
                    ? "Application Accepted"
                    : "Withdraw Application",
                style: TextStyle(
                  color: status.toLowerCase() == "accepted"
                      ? Colors.grey
                      : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

/// 🔥 Reusable Two Column Info Row
class _InfoRow extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;

  const _InfoRow({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InfoTile(label: label1, value: value1),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _InfoTile(label: label2, value: value2),
        ),
      ],
    );
  }
}

class _InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const _InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
color: AppColors.kBorder,
border: Border.all(color: AppColors.kBorder),        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        ],
      ),
    );
  }
}
