import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';

class ApplicantCard extends StatelessWidget {
  final ReferralApplication application;

  const ApplicantCard({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final User user = application.applicant ?? const User();

    /// ✅ NAME
    final name = user.name ?? "Candidate";

    /// ✅ MATCH SCORE
    final match = application.matchScore ?? 0;

    /// ✅ COLLEGE
    final jobTitle = application.job?.jobTitle is List
        ? (application.job!.jobTitle as List).join(", ")
        : application.job?.jobTitle?.toString() ?? "-";
    return InkWell(
      borderRadius: BorderRadius.circular(12),

      /// 🔥 NAVIGATION TO DETAIL PAGE
      onTap: () {
        context.pushNamed(RouteNames.referrerDetail, extra: application.id);
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
          children: [
            /// 🔥 AVATAR
            CircleAvatar(
              radius: 22,

              backgroundColor: AppColors.kGreen,

              backgroundImage: (user.profileImage ?? '').isNotEmpty
                  ? NetworkImage(user.profileImage!)
                  : null,

              child: (user.profileImage ?? '').isEmpty
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

                  /// ✅ MATCH + COLLEGE
                  Row(
                    children: [
                      /// MATCH SCORE
                      Text(
                        "$match% match",
                        style: AppTextStyles.s12W600.copyWith(
                          color: AppColors.kGreen,
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// COLLEGE (ELLIPSIS FIXED)
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kCard,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            jobTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.s12W400.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
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

            /// 🔥 ARROW
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
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
