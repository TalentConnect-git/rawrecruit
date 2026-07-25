import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';

class ReferralTile extends StatelessWidget {
  const ReferralTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () {
              final appState = context.read<AppStateProvider>();

              if ((appState.user?.currentCompany ?? '').trim().isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Please update your current company before posting a job.",
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              context.pushNamed(RouteNames.referralPost);
            },
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: AppColors.kGreen,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Post Job',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16W600.copyWith(color: Colors.black),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => context.pushNamed(RouteNames.askForReferral),
            child: Container(
              height: 62,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.person_search_outlined,
                      color: AppColors.white,
                      size: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Ask Referral',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.s16W600.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 12,
                    color: AppColors.white,
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
