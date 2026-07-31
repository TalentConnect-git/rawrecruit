import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/core/navigation/routes_index.dart';
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
    final jobTitle = application.jobTitle ?? "";
    final status = application.currentStatus ?? "-";
    final createdAt = application.createdAt;
    final company = application.referralCompany ?? "-";

    final location = application.job?.location?.join(", ") ?? "-";
    return Scaffold(
      backgroundColor: AppColors.kBg,
      appBar: AppBar(
        backgroundColor: AppColors.kBg,
        iconTheme: IconThemeData(color: AppColors.white),
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
              GestureDetector(
                onTap: () {
                  final userId = application.applicant?.userId;
                  debugPrint('Opening profile: $userId');

                  if (userId == null || userId.isEmpty) {
                    debugPrint('UserId is null');
                    return;
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProfileDetailView(userId: userId),
                    ),
                  );
                },
                child: _profileCard(
                  name,
                  application.applicant?.profileImage ?? '',
                ),
              ),
              const SizedBox(height: 16),

              /// 🔥 JOB CARD
              GestureDetector(
                onTap: () {
                  final job = application.job;

                  if (job == null) return;

                  // Don't open posted job for Ask for Referral jobs
                  if (job.isAskForReferral == true) return;

                  context.pushNamed(
                    RouteNames.referralPostDetail,
                    extra: job.id ?? "",
                  );
                },
                child: _jobCard(company, location, createdAt),
              ),
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
  Widget _profileCard(String name, String imageUrl) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ThemeController.instance.isDark
              ? Colors.transparent
              : const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.kGreen, width: 2),
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.kGreen,
              backgroundImage: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : null,
              child: imageUrl.isEmpty
                  ? Text(
                      name.isNotEmpty ? name[0].toUpperCase() : "U",
                      style: TextStyle(color: AppColors.onGreenButton),
                    )
                  : null,
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
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),

                const SizedBox(height: 4),
                Text(
                  application.applicant?.email ?? "-",
                  style: TextStyle(color: AppColors.secText),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jobCard(String company, String location, DateTime? date) {
    final isRedirectable = application.job?.isAskForReferral != true;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ThemeController.instance.isDark
              ? Colors.transparent
              : const Color(0xFFE5E7EB),
          width: 1,
        ),
        boxShadow: ThemeController.instance.isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isRedirectable
                        ? AppColors.kGreen
                        : AppColors.kBorder,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.kTile,
                  child: Text(
                    company.isNotEmpty ? company[0].toUpperCase() : "C",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      company,
                      style: TextStyle(
                        color: AppColors.secText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: AppColors.secText,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(color: AppColors.secText),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Text(
            "Referred on ${_formatDate(date)}",
            style: TextStyle(color: AppColors.secText),
          ),
        ],
      ),
    );
  }

  /// 🔥 PROGRESS
  Widget _progressSection(String status) {
    final steps = [
      "Applied",
      "Application Sent",
      "Referred To Company",
      "Shortlisted",
      "Interview Scheduled",
      "Offer Extended",
      "Accepted",

      if (status == "Offer Accepted")
        "Offer Accepted"
      else if (status == "Offer Rejected")
        "Offer Rejected"
      else
        "Offer Accepted / Offer Rejected",

      "Joined the Company",
    ];
    final currentIndex = steps.indexOf(status);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Progress", style: TextStyle(color: AppColors.white)),

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
                    color: isDone ? AppColors.kGreen : AppColors.secText,
                  ),

                  if (index != steps.length - 1)
                    Container(
                      width: 2,
                      height: 30,
                      color: isDone ? AppColors.kGreen : AppColors.secText,
                    ),
                ],
              ),

              const SizedBox(width: 10),

              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  steps[index],
                  style: TextStyle(
                    color: isDone ? AppColors.white : AppColors.secText,
                  ),
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
              extra: application.applicant?.userId,
            );
          },
          child: Text(
            "Message Candidate",
            style: TextStyle(color: AppColors.onGreenButton),
          ),
        ),

        /// ✅ SHOW ONLY FOR REFERRED BY ME
        if (showStatusActions) ...[
          const SizedBox(height: 12),

          PopupMenuButton<String>(
            color: AppColors.kCard,
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
            itemBuilder: (_) => [
              PopupMenuItem(
                value: "Shortlisted",
                child: Text(
                  "Shortlisted",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              PopupMenuItem(
                value: "Interview Scheduled",
                child: Text(
                  "Interview Scheduled",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              PopupMenuItem(
                value: "Offer Extended",
                child: Text(
                  "Offer Extended",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              PopupMenuItem(
                value: "Offer Accepted",
                child: Text(
                  "Offer Accepted",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              PopupMenuItem(
                value: "Offer Rejected",
                child: Text(
                  "Offer Rejected",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
              PopupMenuItem(
                value: "Joined the Company",
                child: Text(
                  "Joined the Company",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ],
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: ThemeController.instance.isDark
                    ? Colors.white
                    : AppColors.kCard,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ThemeController.instance.isDark
                      ? Colors.transparent
                      : Colors.black,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  "Update Status",
                  style: TextStyle(
                    color: ThemeController.instance.isDark
                        ? Colors.black
                        : AppColors.white,
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
