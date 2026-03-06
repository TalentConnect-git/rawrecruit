import 'package:flutter/material.dart' hide Notification;
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/extensions/date_time_ext.dart';
import 'package:rawrecruit/src/features/notifications/index.dart'
    show Notification;

class NotificationCard extends StatelessWidget {
  const NotificationCard({required this.notification, super.key});

  final Notification notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(width: 0.5, color: AppColors.shadow)),
      ),
      child: Row(
        spacing: 16,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: notification.type?.backgroundColor,
            child: Icon(notification.type?.icon),
          ),
          Expanded(
            child: Text(
              notification.message ?? '',
              style: (notification.read ?? false)
                  ? AppTextStyles.s16W400
                  : AppTextStyles.s16W600,
            ),
          ),
          Text(
            notification.createdAt?.toRelativeTime() ?? '-',
            style: (notification.read ?? false)
                ? AppTextStyles.s12W400
                : AppTextStyles.s12W600,
          ),
        ],
      ),
    );
  }
}
