import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/professional/job_postng/presentation/entities/referral_application.dart';
class ApplicantCard extends StatelessWidget {
  final ReferralApplication application;

  const ApplicantCard({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    final User user = application.applicant ?? const User();

    final name = user.name ?? "Candidate";

    final role = user.jobRoles?.isNotEmpty == true
        ? user.jobRoles!.first
        : "Frontend Engineer";

    final company = user.currentCompany ?? "Company";

    /// ❗ No matchScore in API → fallback static
    final match = 92;

    final college = user.college ?? "College";

    final status = application.currentStatus?.name ?? "pending";

    return Container(
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
            child: Text(
              _initials(name),
              style: const TextStyle(color: Colors.black),
            ),
          ),

          const SizedBox(width: 12),

          /// 🔥 CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// NAME + STATUS
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppTextStyles.s16W600
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    _statusChip(status),
                  ],
                ),

                const SizedBox(height: 4),

                /// ROLE
                Text(
                  "for $role at $company",
                  style: AppTextStyles.s12W400.copyWith(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 6),

                /// MATCH + COLLEGE
                Row(
                  children: [
                    Text(
                      "$match% match",
                      style: AppTextStyles.s12W600.copyWith(
                        color: AppColors.kGreen,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.kCard,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "Same college - $college",
                        style: AppTextStyles.s12W400
                            .copyWith(color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// TIME
                Text(
                  _timeAgo(application.createdAt),
                  style: AppTextStyles.s12W400.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios,
              size: 14, color: Colors.grey),
        ],
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

  Widget _statusChip(String status) {
    final isPending = status.toLowerCase() == "pending";

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPending
            ? Colors.orange.withOpacity(0.15)
            : AppColors.kGreen.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isPending ? Colors.orange : AppColors.kGreen,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
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