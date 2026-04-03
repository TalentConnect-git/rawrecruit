import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/feature/revamp_onboarding/presentation/widgets/continue_button.dart';

class ReferralHomeHeader extends StatelessWidget {
  const ReferralHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.kBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white30, width: 0.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGreen,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        spacing: 24,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Icon(Icons.auto_graph, color: AppColors.kGreen),
              Text(
                'Active Now',
                style: AppTextStyles.s16W600.copyWith(color: AppColors.kGreen),
              ),
            ],
          ),
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Refer Others',
                style: AppTextStyles.s24W600.copyWith(color: AppColors.white),
              ),
              Text(
                '2 Candidates are waiting for your referral',
                style: AppTextStyles.s18W600.copyWith(color: AppColors.secText),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              AppButton(
                onPressed: () {},
                label: 'Get Referred',
                foregroundColor: AppColors.kBg,
                backgroundColor: AppColors.kGreen,
                circularRadius: 12,
              ),
              AppButton.outlined(
                onPressed: () {},
                label: 'Refer Candidates',
                foregroundColor: AppColors.kBg,
                backgroundColor: AppColors.kGreen,
                circularRadius: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
