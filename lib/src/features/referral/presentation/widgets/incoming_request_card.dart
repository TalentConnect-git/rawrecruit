import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';

import '../../../../common/index.dart';
import '../../../../core/index.dart';
import '../../../professional/job_postng/presentation/entities/referral_application.dart';

class IncomingRequestCard extends StatelessWidget {
  const IncomingRequestCard({required this.request, super.key});

  final ReferralApplication request;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(RouteNames.referrerDetail, extra: request.id);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.kTile,
          border: ThemeController.instance.isDark
              ? null
              : Border.all(color: Color(0xff222222).withValues(alpha: 0.4)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.kGreen,
              child: ClipOval(
                child: (request.applicant?.profileImage ?? '').isNotEmpty
                    ? Image.network(
                        request.applicant!.profileImage!,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Center(
                            child: Text(
                              request.applicant?.name?.getInitials ?? '',
                              style: AppTextStyles.s18W600.copyWith(
                                color: AppColors.kBg,
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text(
                          request.applicant?.name?.getInitials ?? '',
                          style: AppTextStyles.s18W600.copyWith(
                            color: AppColors.kBg,
                          ),
                        ),
                      ),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          request.applicant?.name ?? '',
                          style: AppTextStyles.s16W600.copyWith(
                            color: AppColors.white,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),

                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     _statusChip(request.currentStatus?.label ?? ''),
                      //     Icon(
                      //       Icons.keyboard_arrow_right,
                      //       size: 28,
                      //       color: AppColors.white,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Text(
                    'For ${request.job?.jobTitle?.join(',') ?? ''}',
                    style: AppTextStyles.s16W600.copyWith(
                      color: AppColors.secText,
                    ),
                  ),
                  if ((request.job?.isAskForReferral ?? false))
                    SizedBox(height: 12),
                  if (!(request.job?.isAskForReferral ?? false))
                    _percent(request.matchScore ?? 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _percent(num percent) {
    Color color;

    switch (percent) {
      case > 75:
        color = Colors.green;
        break;
      case > 40:
        color = Colors.orange;
        break;
      default:
        color = Colors.red;
    }

    return Text(
      '$percent% match',
      style: AppTextStyles.s16W600.copyWith(color: color),
    );
  }

  Widget _statusChip(String status) {
    Color color;

    switch (status) {
      case "Accepted":
        color = Colors.green;
        break;
      case "Referred To Company":
        color = Colors.blue;
        break;
      case "Application Sent":
        color = Colors.orange;
        break;
      case "Rejected":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
