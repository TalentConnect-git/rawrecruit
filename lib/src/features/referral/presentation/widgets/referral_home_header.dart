import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/jobs/utils/enums.dart';
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show MyProfileViewModel;
import 'package:rawrecruit/src/features/referrer/utils/enums.dart';

class ReferralHomeHeader extends StatelessWidget {
  final MyProfileViewModel vm;

  const ReferralHomeHeader({super.key, required this.vm});
String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    return 'Good morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good afternoon';
  } else if (hour >= 17 && hour < 21) {
    return 'Good evening';
  } else {
    return 'Good night';
  }
}
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Greeting
       Text(
  getGreeting(),
  style: AppTextStyles.s14W400.copyWith(color: AppColors.secText),
),

        const SizedBox(height: 6),

        /// Name + emoji
        Row(
          children: [
            Expanded(
              child: Text(
                'Hey, ${vm.user?.name ?? "User"}  👋',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: AppTextStyles.s22W600.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Stats Cards
        Row(
          children: [
            /// 🔹 Referrals Posted
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.goNamed(
                    RouteNames.application,
                    extra: {
                      'userType': UserType.professional,
                      'jobType': ProfessionalJobType.posted,
                    },
                  );
                },
                child: _buildStatCard(
                  icon: Icons.description_outlined,
                  value: "${vm.totalReferrals}",
                  label: 'Referrals\nPosted',
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// 🔹 Applications Received
            Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.goNamed(
                    RouteNames.referrer,
                    extra: {
                      'userType': UserType.professional,
                      'applicationType':
                          ProfessionalReferrerApplicationType.requestsReceived,
                    },
                  );
                },
                child: _buildStatCard(
                  icon: Icons.inbox_outlined,
                  value: "${vm.totalApplications}",
                  label: 'Application',
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// 🔹 Success Rate
            Expanded(
              child: _buildStatCard(
                icon: Icons.emoji_events_outlined,
                value: "${vm.referralSuccessRate}%",
                label: 'Success\nRate',
              ),
            ),

            const SizedBox(width: 12),

            /// 🔹 Response Rate
            Expanded(
              child: _buildStatCard(
                icon: Icons.flash_on_outlined,
                value: "${vm.responseRate}%",
                label: 'Response\nRate',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Container(
      height: 110, // you can tweak 105–120
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 🔥 key fix
        children: [
          Icon(icon, color: AppColors.secText, size: 18),

          /// VALUE
          FittedBox(
            // 🔥 prevents overflow
            child: Text(
              value,
              style: AppTextStyles.s16W600.copyWith(color: AppColors.white),
            ),
          ),

          /// LABEL
          Flexible(
            // 🔥 prevents bottom overflow
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s12W600.copyWith(color: AppColors.secText),
            ),
          ),
        ],
      ),
    );
  }
}
