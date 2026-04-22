import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/notifications/index.dart'
    show NotificationViewModel;
import 'package:rawrecruit/src/features/notifications/presentation/widgets/notification_card.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  final NotificationViewModel notificationViewModel =
      getIt<NotificationViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final failure = await notificationViewModel.getNotifications();
      Toasts.showErrorToast(context, message: failure?.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: notificationViewModel,
      child: Scaffold(
        backgroundColor: AppColors.kBg,
        appBar: RAppBar(
          leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.keyboard_arrow_left, color: AppColors.white),
          ),

          label: 'Notifications',
        ),
        body: Consumer<NotificationViewModel>(
          builder: (vmContext, vm, _) {
            if (vm.isLoading) {
              return Center(child: AppLoadingIndicator());
            }

            if (vm.notifications.isEmpty) {
              return Center(
                child: Text(
                  'Notifications Not Found!',
                  style: AppTextStyles.s18W400.copyWith(color: AppColors.white),
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                final failure = await notificationViewModel.getNotifications();
                Toasts.showErrorToast(context, message: failure?.message);
              },
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, index) {
                  final notification = vm.notifications[index];
                  return GestureDetector(
                    onTap: () async {
                      final failure = await vm.markAsRead(
                        notification.id ?? '',
                      );
                      Toasts.showErrorToast(context, message: failure?.message);
                    },
                    child: NotificationCard(notification: notification),
                  );
                },
                itemCount: vm.notifications.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
