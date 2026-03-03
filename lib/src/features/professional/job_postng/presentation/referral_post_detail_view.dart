import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_post_model.dart';

class ReferralPostDetailView extends StatelessWidget {
  final ReferralPostModel job;

  const ReferralPostDetailView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(job.jobTitle ?? "-"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            _buildRow("Job Title", job.jobTitle),
            _buildRow("Description", job.description),
            _buildRow("Approval Status", job.approvalStatus),
            _buildRow("Employment Type", job.employmentType),
            _buildRow("Work Mode", job.workMode),
            _buildRow("Min Education", job.minEducation),
            _buildRow("Experience", job.yearsOfExperience),
            _buildRow("Work Authorization", job.workAuthorization),
            _buildRow("Eligibility Criteria", job.eligibilityCriteria),
            _buildRow("Openings",
                job.numberOfOpenings?.toString()),

            _buildRow("Location",
                job.location?.join(", ")),

            _buildRow("Student Streams",
                job.studentStreams?.join(", ")),

            _buildRow("Tags",
                job.tags?.join(", ")),

            _buildRow("Benefits",
                job.benefits?.join(", ")),

            _buildRow("Certifications",
                job.certifications?.join(", ")),

            const SizedBox(height: 20),

            const Text(
              "Package Details",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            _buildRow(
                "Currency",
                job.packageDetails?.currency),

            _buildRow(
                "Total CTC",
                job.packageDetails?.totalCTC?.toString()),

            _buildRow(
                "Fixed Pay",
                job.packageDetails?.fixedPay?.toString()),

            _buildRow(
                "Joining Bonus",
                job.packageDetails?.joiningBonus?.toString()),

            const SizedBox(height: 20),

            const Text(
              "Skills",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
  }

  Widget _buildRow(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              "$title:",
              style: const TextStyle(
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : "-",
            ),
          ),
        ],
      ),
    );
  }
}