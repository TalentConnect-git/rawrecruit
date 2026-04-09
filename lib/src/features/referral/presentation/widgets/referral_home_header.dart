import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class ReferralHomeHeader extends StatelessWidget {
  const ReferralHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Greeting
        Text(
          'Good morning',
          style: AppTextStyles.s14W400.copyWith(
            color: AppColors.secText,
          ),
        ),

        const SizedBox(height: 6),

        /// Name + emoji
        Row(
          children: [
            Text(
              'Hey, Priya',
              style: AppTextStyles.s22W600.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 6),
            const Text(
              '👋',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),

        const SizedBox(height: 20),

        /// Stats Cards
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                icon: Icons.description_outlined,
                value: '5',
                label: 'Posted\nJobs',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.inbox_outlined,
                value: '3',
                label: 'Requests',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.emoji_events_outlined,
                value: '78%',
                label: 'Success',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                icon: Icons.flash_on_outlined,
                value: '94%',
                label: 'Response',
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.secText, size: 20),

          const SizedBox(height: 10),

          Text(
            value,
            style: AppTextStyles.s18W600.copyWith(
              color: AppColors.white,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.s12W400.copyWith(
              color: AppColors.secText,
            ),
          ),
        ],
      ),
    );
  }
}