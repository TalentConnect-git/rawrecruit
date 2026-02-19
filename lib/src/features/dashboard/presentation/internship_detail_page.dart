import 'package:flutter/material.dart';

import '../../../common/index.dart';
import '../entities/internship_model.dart';
import 'widgets/section_tile.dart';

class InternshipDetailView extends StatelessWidget {
  final InternshipModel internship;

  const InternshipDetailView({
    super.key,
    required this.internship,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return "-";
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            internship.jobRoles?.first ??
                'Internship Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            /// Company
            Text(
              internship.companyPosted
                      ?.companyDetails
                      ?.companyName ??
                  '',
              style: AppTextStyles.s18W600,
            ),

            const SizedBox(height: 12),

            /// Description
            Text(internship.description ?? ''),

            const SizedBox(height: 20),

            SectionTitle(title: "Duration"),
            Text(internship.internshipDuration ?? ''),

            const SizedBox(height: 20),

            SectionTitle(title: "Openings"),
            Text(
                "${internship.numberOfOpenings ?? 0}"),

            const SizedBox(height: 20),

            SectionTitle(title: "Online Test Date"),
            Text(_formatDate(
                internship.onlineTestDate)),

            const SizedBox(height: 20),

            SectionTitle(title: "Skills"),
            Wrap(
              spacing: 8,
              children: internship.skills
                      ?.map((e) =>
                          CustomChip(text: e))
                      .toList() ??
                  [],
            ),

            const SizedBox(height: 20),

            SectionTitle(title: "Eligibility"),
            Text(
                internship.eligibilityCriteria ??
                    ''),
          ],
        ),
      ),
    );
  }
}
