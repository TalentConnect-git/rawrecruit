import 'package:flutter/material.dart';
import 'package:rawrecruit/src/features/dashboard/presentation/widgets/job_card.dart';

class JobView extends StatelessWidget {
  const JobView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        JobCard(
            jobId: "job_2",
          title: "Software Developer II",
          yoe: 2,
          workMode: "On-Site",
          location: "Mumbai",
          package: "2.4 LPA",
          skills: const ["Java", "VSCode"],
          description:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
          onApply: () {},
        ),
         JobCard(
            jobId: "job_1",
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
