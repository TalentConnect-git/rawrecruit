import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/application/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

class ReferredApplicantCard extends StatelessWidget {
  final ReferralApplication application;
  final bool showStatusActions;

  const ReferredApplicantCard({
    super.key,
    required this.application,
    this.showStatusActions = false,
  });

  @override
  Widget build(BuildContext context) {
    final User user = application.applicant ?? const User();
    final referralCompany = application.referralCompany ?? '';

    /// ✅ NAME
    final name = user.name ?? "Candidate";

    /// ✅ MATCH SCORE
    final match = application.matchScore ?? 0;
    final imageUrl = application.applicant?.profileImage ?? '';
    // /// ✅ JOB TITLE
    // final jobTitle = application.jobTitle ?? "-";

    return InkWell(
      borderRadius: BorderRadius.circular(12),

      /// 🔥 NAVIGATION
      onTap: () {
        context.pushNamed(
          RouteNames.referredCandidateDetail,

          extra: {
            'application': application,
            'showStatusActions': showStatusActions,
          },
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔥 AVATAR
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.kGreen,
              backgroundImage: imageUrl.isNotEmpty
                  ? NetworkImage(imageUrl)
                  : null,
              child: imageUrl.isEmpty
                  ? Text(
                      _initials(name),
                      style: const TextStyle(color: Colors.black),
                    )
                  : null,
            ),
            const SizedBox(width: 12),

            /// 🔥 CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ✅ NAME
                  Text(
                    name,
                    style: AppTextStyles.s16W600.copyWith(color: Colors.white),
                  ),

                  const SizedBox(height: 6),

                  /// ✅ MATCH + company
                  Row(
                    children: [
                      if (referralCompany.isNotEmpty) ...[
                        Icon(Icons.business, size: 14, color: AppColors.kGreen),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            referralCompany,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.s12W400.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],

                      Text(
                        "$match% match",
                        style: AppTextStyles.s12W600.copyWith(
                          color: AppColors.kGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  /// ✅ STATUS
                  if (showStatusActions)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kGreen.withOpacity(.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        application.currentStatus?.toString() ?? "Pending",
                        style: AppTextStyles.s12W600.copyWith(
                          color: AppColors.kGreen,
                        ),
                      ),
                    ),

                  const SizedBox(height: 6),

                  /// ✅ TIME
                  Text(
                    _timeAgo(application.createdAt),
                    style: AppTextStyles.s12W400.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// 🔥 RIGHT ACTIONS
            if (showStatusActions)
              PopupMenuButton<String>(
                color: Colors.white,
                onSelected: (value) {
                  _changeStatus(context, status: value);
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(
                    value: "Shortlisted",
                    child: Text("Shortlisted"),
                  ),
                  PopupMenuItem(
                    value: "Interview Scheduled",
                    child: Text("Interview Scheduled"),
                  ),
                  PopupMenuItem(
                    value: "Offer Extended",
                    child: Text("Offer Extended"),
                  ),

                  PopupMenuItem(
                    value: "Offer Accepted",
                    child: Text("Offer Accepted"),
                  ),
                  PopupMenuItem(
                    value: "Offer Rejected",
                    child: Text("Offer Rejected"),
                  ),
                  PopupMenuItem(
                    value: "Joined the Company",
                    child: Text("Joined the Company"),
                  ),
                ],
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secBorder,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.sync, size: 14, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _changeStatus(BuildContext context, {required String status}) async {
    final vm = context.read<ApplicationViewModel>();

    await vm.updateReferralStatus(
      context: context,
      applicationId: application.id ?? "",
      status: status,
      jobRole: application.jobTitle ?? "",
    );
  }

  String _initials(String name) {
    final parts = name.split(" ");

    if (parts.length >= 2) {
      return "${parts[0][0]}${parts[1][0]}";
    }

    return name.isNotEmpty ? name[0] : "U";
  }

  String _timeAgo(DateTime? date) {
    if (date == null) return "";

    final diff = DateTime.now().difference(date);

    if (diff.inMinutes < 60) {
      return "${diff.inMinutes} mins ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hours ago";
    } else {
      return "${diff.inDays} days ago";
    }
  }
}
