import 'package:flutter/material.dart' hide Notification;
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart'
    show Notification, NotificationMeta;

class NotificationCard extends StatefulWidget {
  const NotificationCard({
    required this.notification,
    required this.onTap,
    super.key,
  });

  final Notification notification;
  final VoidCallback onTap;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    final isRead = widget.notification.read ?? false;

    return GestureDetector(
      onTap: () {
        widget.onTap.call();
        _navigateToView(widget.notification.meta);
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// 🔥 ICON
            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color:
                    widget.notification.type?.backgroundColor ??
                    AppColors.kCard,

                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                widget.notification.type?.icon ?? Icons.notifications_none,

                color: widget.notification.type?.textColor ?? AppColors.kGreen,

                size: 22,
              ),
            ),

            const SizedBox(width: 14),

            /// 🔥 CONTENT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// TYPE
                  Text(
                    widget.notification.type?.label ?? "Notification",

                    style: AppTextStyles.s14W600.copyWith(
                      color:
                          widget.notification.type?.textColor ??
                          AppColors.kGreen,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// MESSAGE
                  Text(
                    widget.notification.message ?? '',

                    style:
                        (isRead ? AppTextStyles.s14W400 : AppTextStyles.s14W600)
                            .copyWith(color: AppColors.white, height: 1.4),
                  ),

                  const SizedBox(height: 10),

                  /// TIME
                  Text(
                    widget.notification.createdAt?.toRelativeTime() ?? '-',

                    style: AppTextStyles.s12W400.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),

            /// 🔥 UNREAD DOT
            if (!isRead)
              Container(
                width: 10,
                height: 10,

                margin: const EdgeInsets.only(left: 10),

                decoration: BoxDecoration(
                  color: AppColors.kGreen,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _navigateToView(NotificationMeta? meta) {
    if (meta == null) return;

    final topic = meta.topic;
    final subtopic = meta.subtopic;
    final body = meta.body;

    if (topic == null) return;

    switch (topic) {
      case 'Jobs':
        switch (subtopic) {
          case 'My Posted':
            final jobId = body?['jobId'];

            if (jobId == null) return;

            context.pushNamed(RouteNames.referralPostDetail, extra: jobId);
            break;

          case 'JobDetail':
            final jobId = body?['jobId'];

            if (jobId == null) return;

            context.pushNamed(RouteNames.referralDetail, extra: jobId);
            break;
        }
        break;

      case 'Job Detail':
        switch (subtopic) {
          case 'Candidates':
            final jobId = body?['jobId'];
            final applicationId = body?['applicationId'];

            if (jobId == null || applicationId == null) return;

            context.pushNamed(RouteNames.referrerDetail, extra: applicationId);
            break;
        }
        break;

      case 'Scheduled Interviews':
        final applicationId = body?['applicationId'];
        final jobId = body?['jobId'];

        if (applicationId == null || jobId == null) return;

        context.pushNamed(RouteNames.scheduledInterviews);
        break;

      case 'Referrer':
        switch (subtopic) {
          case 'Applied By Me':
            final applicationId = body?['applicationId'];
            // final jobId = notificationData['jobId'];

            if (applicationId == null) return;

            context.pushNamed(
              RouteNames.applicationDetail,
              extra: applicationId,
            );
            break;
        }

        break;

      case 'Chat':
        final senderId = body?['senderId'];
        // final referenceId = notificationData['referenceId'];

        // if (senderId == null || referenceId == null) return;

        context.goNamed(
          RouteNames.chatUser,
          extra: {
            'senderId': senderId,
            // 'referenceId': referenceId,
          },
        );
        break;

      case 'Alumni Network':
        switch (subtopic) {
          case 'Alumni Detail':
            final userId = body?['userId'];

            if (userId == null) return;

            context.goNamed(RouteNames.alumniDetail, extra: userId);
            break;
        }
    }
  }
}
