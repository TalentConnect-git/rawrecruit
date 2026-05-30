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

        appBar: AppBar(
          backgroundColor: AppColors.kBg,
          elevation: 0,
          centerTitle: false,

          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.white,
              size: 18,
            ),
          ),

          title: Text(
            "Notifications",
            style: AppTextStyles.s20W600.copyWith(color: AppColors.white),
          ),
        ),

        body: Consumer<NotificationViewModel>(
          builder: (vmContext, vm, _) {
            /// 🔥 LOADING
            if (vm.isLoading) {
              return const Center(child: AppLoadingIndicator());
            }

            /// 🔥 EMPTY
            if (vm.notifications.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_off_outlined,
                      size: 70,
                      color: Colors.grey.shade700,
                    ),

                    const SizedBox(height: 14),

                    Text(
                      'No Notifications Yet',
                      style: AppTextStyles.s18W600.copyWith(
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'You’ll see updates and alerts here.',
                      style: AppTextStyles.s14W400.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              );
            }

            /// 🔥 LIST
            return RefreshIndicator(
              color: AppColors.kGreen,
              backgroundColor: AppColors.kTile,

              onRefresh: () async {
                final failure = await notificationViewModel.getNotifications();

                Toasts.showErrorToast(context, message: failure?.message);
              },

              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),

                itemCount: vm.notifications.length,

                separatorBuilder: (_, __) => const SizedBox(height: 12),

                itemBuilder: (_, index) {
                  final notification = vm.notifications[index];

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),

                    decoration: BoxDecoration(
                      color: notification.read == true
                          ? AppColors.kTile
                          : AppColors.kTile.withOpacity(.95),

                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: notification.read == true
                            ? AppColors.kBorder
                            : AppColors.kGreen.withOpacity(.4),
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: NotificationCard(
                      notification: notification,
                      onTap: () async {
                        final failure = await vm.markAsRead(
                          notification.id ?? '',
                        );

                        Toasts.showErrorToast(
                          context,
                          message: failure?.message,
                        );
                      },
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
