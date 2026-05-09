import 'package:flutter/material.dart' hide Notification;
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/extensions/date_time_ext.dart';
import 'package:rawrecruit/src/features/notifications/index.dart'
    show Notification;

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    required this.notification,
    super.key,
  });

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    final isRead = notification.read ?? false;

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: AppColors.kTile,

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: isRead
              ? AppColors.kBorder
              : AppColors.kGreen.withOpacity(.35),
        ),
      ),

      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          /// 🔥 ICON
          Container(
            padding: const EdgeInsets.all(12),

            decoration: BoxDecoration(
              color:
                  notification.type?.backgroundColor ??
                  AppColors.kCard,

              borderRadius:
                  BorderRadius.circular(14),
            ),

            child: Icon(
              notification.type?.icon ??
                  Icons.notifications_none,

              color:
                  notification.type?.textColor ??
                  AppColors.kGreen,

              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          /// 🔥 CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                /// TYPE
                Text(
                  notification.type?.label ??
                      "Notification",

                  style:
                      AppTextStyles.s14W600.copyWith(
                    color:
                        notification.type
                            ?.textColor ??
                        AppColors.kGreen,
                  ),
                ),

                const SizedBox(height: 6),

                /// MESSAGE
                Text(
                  notification.message ?? '',

                  style:
                      (isRead
                              ? AppTextStyles.s14W400
                              : AppTextStyles.s14W600)
                          .copyWith(
                    color: AppColors.white,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 10),

                /// TIME
                Text(
                  notification.createdAt
                          ?.toRelativeTime() ??
                      '-',

                  style:
                      AppTextStyles.s12W400.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// 🔥 UNREAD DOT
          if (!isRead)
            Container(
              width: 10,
              height: 10,

              margin:
                  const EdgeInsets.only(left: 10),

              decoration: BoxDecoration(
                color: AppColors.kGreen,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}