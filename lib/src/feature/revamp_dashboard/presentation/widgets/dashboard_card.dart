import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/feature/revamp_jobs/utils/enums.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/index.dart';

class DashboardCard extends StatelessWidget {
  final MyProfileViewModel vm;

  const DashboardCard({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Greeting
        Text(
          'Good morning',
          style: AppTextStyles.s14W400.copyWith(color: AppColors.secText),
        ),

        const SizedBox(height: 6),

        /// Name + emoji
        Row(
          children: [
            Text(
              'Hey, ${vm.user?.name ?? "User"}',
              style: AppTextStyles.s22W600.copyWith(color: AppColors.white),
            ),
            const SizedBox(width: 6),
            const Text('👋', style: TextStyle(fontSize: 20)),
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
                      'userType': UserType.student,
                      'jobType': ProfessionalJobType.saved,
                    },
                  );
                },
                child: _buildStatCard(
                  icon: Icons.description_outlined,
                  value: "${vm.savedJobs}",
                  label: 'Saved Jobs',
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
                      'userType': UserType.student,
                      // 'applicationType':
                      //     ProfessionalReferrerApplicationType.requestsReceived,
                    },
                  );
                },
                child: _buildStatCard(
                  icon: Icons.inbox_outlined,
                  value: "${vm.totalApps}",
                  label: 'Applications',
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// 🔹 Success Rate
            Expanded(
              child: _buildStatCard(
                icon: Icons.emoji_events_outlined,
                value: "${vm.profileScore}%",
                label: 'Profile\nScore',
              ),
            ),

            // const SizedBox(width: 12),
            //
            // /// 🔹 Response Rate
            // Expanded(
            //   child: _buildStatCard(
            //     icon: Icons.flash_on_outlined,
            //     value: "${vm.responseRate}%",
            //     label: 'Response\nRate',
            //   ),
            // ),
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
