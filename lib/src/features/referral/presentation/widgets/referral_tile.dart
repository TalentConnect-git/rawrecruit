import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class ReferralTile extends StatelessWidget {
  const ReferralTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.pushNamed(RouteNames.referralPost),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.kGreen,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kGreen.withOpacity(0.4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add, color: Colors.black, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Post Referral Job',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s16W600.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: GestureDetector(
            onTap: () => context.pushNamed(RouteNames.askForReferral),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.kGreen,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kGreen.withOpacity(0.4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Ask for Referral',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.s16W600.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
