import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/widgets/job_card.dart';

class InternshipView extends StatelessWidget {
  const InternshipView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const _InternshipStats(),
        const SizedBox(height: 20),

        /// Internship Cards
        JobCard(
            jobId: "job_3",
          title: "Software Developer II",
          yoe: 2,
          workMode: "Remote/Hybrid",
          location: "Mumbai",
          package: "2.4 LPA",
          skills: const ["Java", "VSCode"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo.",
          onApply: () {},
        ),
         JobCard(
            jobId: "job_4",
          title: "Software Developer II",
          yoe: 2,
          workMode: "Remote/Hybrid",
          location: "Mumbai",
          package: "2.4 LPA",
          skills: const ["Java", "VSCode"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo.",
          onApply: () {},
        ),
      ],
    );
  }
}
class _InternshipStats extends StatelessWidget {
  const _InternshipStats();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: _StatCard(
            title: "Total\nInternships",
            value: "2",
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            title: "Active Filters",
            value: "2",
          ),
        ),
      ],
    );
  }
}
class _StatCard extends StatelessWidget {
  final String title;
  final String value;

  const _StatCard({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.s12W600),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.s22W600
                .copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
