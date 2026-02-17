import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/application/presentation/widget/application_progress_stepper.dart';

class ApplicationDetailView extends StatelessWidget {
  const ApplicationDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "TCS",
          style: TextStyle(color: Colors.black),
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
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Software Developer",
                    style: AppTextStyles.s22W600,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, size: 16),
                      SizedBox(width: 4),
                      Text("Mumbai"),
                      SizedBox(width: 16),
                      Icon(Icons.work_outline, size: 16),
                      SizedBox(width: 4),
                      Text("Full-Time"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: const ApplicationProgressStepper(
                currentStep: 1,
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Info Section
            Text(
              "Job Details",
              style: AppTextStyles.s16W600,
            ),

            const SizedBox(height: 16),

            _InfoRow(
              label1: "Job Type",
              value1: "Full-Time",
              label2: "Experience",
              value2: "2+ Years",
            ),

            const SizedBox(height: 16),

            _InfoRow(
              label1: "Compensation",
              value1: "2.4 LPA",
              label2: "Applied On",
              value2: "12 Feb 2026",
            ),

            const SizedBox(height: 24),

            /// 🔥 Description Section
            Text(
              "Description",
              style: AppTextStyles.s16W600,
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Text(
                "We are looking for a skilled Software Developer to join our team. You will be responsible for developing backend services and collaborating with cross-functional teams to deliver scalable solutions.",
              ),
            ),

            const SizedBox(height: 24),

            /// 🔥 Recruiter Info Section
            Text(
              "Recruiter",
              style: AppTextStyles.s16W600,
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black.withOpacity(0.05),
                  )
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor:
                        AppColors.primary.withOpacity(0.2),
                    child: const Icon(Icons.person),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Rahul Sharma",
                        style: TextStyle(
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text("HR Manager"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// 🔥 Withdraw Button
            SizedBox(
              height: 48,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      color: Colors.red.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Withdraw Application",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
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

  const _InfoTile({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
