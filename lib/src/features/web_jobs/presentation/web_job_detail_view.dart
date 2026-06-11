import 'package:flutter/material.dart';
import '../../../common/index.dart';
import '../data/entities/company_job.dart';

class WebJobDetailView extends StatelessWidget {
  final CompanyJob job;

  const WebJobDetailView({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              const SizedBox(height: 24),

              Text(
                job.title ?? '-',
                style: AppTextStyles.s24W600.copyWith(color: Colors.white),
              ),

              const SizedBox(height: 24),

              _DetailRow(label: 'Company Name', value: job.companyName),

              _DetailRow(label: 'Title', value: job.title),

              _DetailRow(label: 'Job URL', value: job.jobUrl),

              _DetailRow(label: 'Apply URL', value: job.applyUrl),

              _DetailRow(label: 'Location', value: job.location),

              _DetailRow(label: 'Work Mode', value: job.workMode),

              _DetailRow(label: 'Department', value: job.department),

              _DetailRow(label: 'JD Snippet', value: job.jdSnippet),

              _DetailRow(label: 'Description', value: job.description),

              _DetailRow(
                label: 'Required Skills',
                value: job.requiredSkills?.join(', '),
              ),

              _DetailRow(
                label: 'Matched Skills',
                value: job.matchedSkills?.join(', '),
              ),

              _DetailRow(
                label: 'Missing Skills',
                value: job.missingSkills?.join(', '),
              ),

              _DetailRow(
                label: 'Experience Required',
                value: job.experienceRequired,
              ),

              _DetailRow(label: 'Salary Range', value: job.salaryRange),

              _DetailRow(label: 'Posted Date', value: job.postedDate),

              _DetailRow(label: 'ATS Source', value: job.atsSource),

              _DetailRow(
                label: 'Match Score',
                value: job.matchScore?.toString(),
              ),

              const SizedBox(height: 12),

              Text(
                'Score Breakdown',
                style: AppTextStyles.s18W600.copyWith(color: AppColors.kGreen),
              ),

              const SizedBox(height: 16),

              _DetailRow(
                label: 'Skills Score',
                value: job.scoreBreakdown?.skills?.toString(),
              ),

              _DetailRow(
                label: 'Role Score',
                value: job.scoreBreakdown?.role?.toString(),
              ),

              _DetailRow(
                label: 'Experience Score',
                value: job.scoreBreakdown?.experience?.toString(),
              ),

              _DetailRow(
                label: 'Location Score',
                value: job.scoreBreakdown?.location?.toString(),
              ),

              _DetailRow(
                label: 'Work Mode Score',
                value: job.scoreBreakdown?.workMode?.toString(),
              ),

              _DetailRow(
                label: 'Candidate Type Score',
                value: job.scoreBreakdown?.candidateType?.toString(),
              ),

              _DetailRow(
                label: 'Alumni Count',
                value: job.alumniCount?.toString(),
              ),

              _DetailRow(
                label: 'Total Employee Count',
                value: job.totalEmployeeCount?.toString(),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String? value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final displayValue = (value?.trim().isNotEmpty ?? false) ? value! : '-';

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.s12W600.copyWith(color: AppColors.kGreen),
          ),
          const SizedBox(height: 6),
          Text(
            displayValue,
            style: AppTextStyles.s14W400.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
