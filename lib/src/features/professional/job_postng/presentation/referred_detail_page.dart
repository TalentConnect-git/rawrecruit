import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart'
    show ApplicationViewModel;
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

class ReferredCandidateDetailPage extends StatelessWidget {
  final ReferralApplication application;
  final bool showStatusActions;

  const ReferredCandidateDetailPage({
    super.key,
    required this.application,
    this.showStatusActions = false,
  });

  @override
  Widget build(BuildContext context) {
    final user = application.applicant ?? const User();

    final name = user.name ?? "-";
    final jobTitle = application.jobTitle ?? "-";
    final status = application.currentStatus ?? "-";
    final createdAt = application.createdAt;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Referral Details",
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// 🔥 PROFILE CARD
              _profileCard(name),

              const SizedBox(height: 16),

              /// 🔥 JOB CARD
              _jobCard(jobTitle, createdAt),

              const SizedBox(height: 20),

              /// 🔥 PROGRESS
              _progressSection(status),

              const SizedBox(height: 30),

              /// 🔥 BOTTOM BUTTONS
              _bottomActions(context),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// PROFILE
  Widget _profileCard(String name) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.kGreen,
            child: Text(
              name.isNotEmpty ? name[0] : "U",
              style: const TextStyle(color: Colors.black),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),

                const SizedBox(height: 4),

                const Text("Candidate", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// JOB
  Widget _jobCard(String jobTitle, DateTime? date) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("JOB", style: TextStyle(color: Colors.green)),

          const SizedBox(height: 6),

          Text(
            jobTitle,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),

          const SizedBox(height: 6),

          Text(
            "Referred on ${_formatDate(date)}",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 🔥 PROGRESS
  Widget _progressSection(String status) {
    final steps = [
      "Application Sent",
      "Referred To Company",
      "Shortlisted",
      "Interview Scheduled",
      "Offer Extended",
      "Accepted",
      "Rejected",
    ];

    final currentIndex = steps.indexOf(status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Progress", style: TextStyle(color: Colors.white)),

        const SizedBox(height: 10),

        ...List.generate(steps.length, (index) {
          final isDone = currentIndex == -1 ? false : index <= currentIndex;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// CIRCLE
              Column(
                children: [
                  Icon(
                    isDone ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: isDone ? Colors.green : Colors.grey,
                  ),

                  if (index != steps.length - 1)
                    Container(
                      width: 2,
                      height: 30,
                      color: isDone ? Colors.green : Colors.grey,
                    ),
                ],
              ),

              const SizedBox(width: 10),

              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  steps[index],
                  style: TextStyle(color: isDone ? Colors.white : Colors.grey),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  /// 🔥 BUTTONS
  Widget _bottomActions(BuildContext context) {
    return Column(
      children: [
        /// MESSAGE
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.kGreen,
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            context.pushNamed(
              RouteNames.chatUser,
              extra: application.applicant,
            );
          },
          child: Text(
            "Message Candidate",
            style: TextStyle(color: AppColors.white),
          ),
        ),

        /// ✅ SHOW ONLY FOR REFERRED BY ME
        if (showStatusActions) ...[
          const SizedBox(height: 12),

          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) async {
              // final vm = context.read<ApplicationViewModel>();

              final vm = ApplicationViewModel();

              await vm.updateReferralStatus(
                context: context,
                applicationId: application.id ?? "",
                status: value,
                jobRole: application.jobTitle ?? "",
              );
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: "Shortlisted",
                child: Text("Shortlist", style: TextStyle(color: Colors.black)),
              ),
              PopupMenuItem(
                value: "Interview Scheduled",
                child: Text(
                  "Interview Scheduled",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PopupMenuItem(
                value: "Offer Extended",
                child: Text(
                  "Extend Offer",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PopupMenuItem(
                value: "Accepted",
                child: Text("Refer", style: TextStyle(color: Colors.black)),
              ),
              PopupMenuItem(
                value: "Rejected",
                child: Text("Reject", style: TextStyle(color: Colors.black)),
              ),
            ],
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  "Update Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "-";

    return "${date.day}/${date.month}/${date.year}";
  }
}
