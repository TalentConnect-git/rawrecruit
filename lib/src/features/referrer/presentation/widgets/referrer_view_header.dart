import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class ReferrerViewHeader extends StatelessWidget {
  const ReferrerViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Referrer Dashboard',
          style: AppTextStyles.s24W600.copyWith(color: AppColors.white),
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: _buildCard(
                icon: Icon(Icons.pin, color: AppColors.kGreen),
                num: '12',
                label: 'Referrals',
              ),
            ),
            Expanded(
              child: _buildCard(
                icon: Icon(Icons.group, color: Color(0xffE9A839)),
                num: '8',
                label: 'Hires',
              ),
            ),
            Expanded(
              child: _buildCard(
                icon: Icon(
                  Icons.work_history_outlined,
                  color: Color(0xff3D98F4),
                ),
                num: '16',
                label: 'Requests',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({
    required Icon icon,
    required String num,
    required String label,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kTile,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(height: 4),
          Text(
            num,
            style: AppTextStyles.s24W900.copyWith(color: AppColors.white),
          ),
          Text(
            label,
            style: AppTextStyles.s16W600.copyWith(color: AppColors.secText),
          ),
        ],
      ),
    );
  }
}
