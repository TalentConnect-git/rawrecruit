import 'package:flutter/material.dart';

import '../../../common/index.dart';
import '../entities/job_model.dart';
import 'widgets/section_tile.dart';

class JobDetailView extends StatelessWidget {
  final JobModel job;

  const JobDetailView({super.key, required this.job});

  String _formatDate(DateTime? date) {
    if (date == null) return "-";
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(job.jobRoles?.first ?? 'Job Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Company
            Text(job.companyName ?? '', style: AppTextStyles.s18W600),

            const SizedBox(height: 12),

            /// Description
            Text(job.description ?? ''),

            const SizedBox(height: 20),

            SectionTitle(title: "Skills"),
            Wrap(
              spacing: 8,
              children:
                  job.skills?.map((e) => CustomChip(text: e)).toList() ?? [],
            ),

            const SizedBox(height: 20),

            SectionTitle(title: "Interview Window"),
            Text("Start: ${_formatDate(job.interviewWindow?.start)}"),
            Text("End: ${_formatDate(job.interviewWindow?.end)}"),

            const SizedBox(height: 20),

            SectionTitle(title: "Online Test Date"),
            Text(_formatDate(job.onlineTestDate)),

            const SizedBox(height: 20),

            SectionTitle(title: "Offer Rollout Date"),
            Text(_formatDate(job.offerRolloutDate)),

            const SizedBox(height: 20),

            SectionTitle(title: "Eligibility"),
            Text(job.eligibilityCriteria ?? ''),

            const SizedBox(height: 20),

            SectionTitle(title: "Benefits"),
            ...?job.benefits?.map((e) => Text("• $e")),
          ],
        ),
      ),
    );
  }
}
