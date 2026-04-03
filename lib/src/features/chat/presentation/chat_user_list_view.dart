import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/theme/index.dart';
import 'package:rawrecruit/src/core/index.dart';
import 'package:rawrecruit/src/features/chat/data/entities/chat_user_model.dart';

import '../index.dart';
import 'chat_detail_view.dart';

class ChatUserListView extends StatefulWidget {
  const ChatUserListView({super.key});

  @override
  State<ChatUserListView> createState() => _ChatUserListViewState();
}

class _ChatUserListViewState extends State<ChatUserListView> {
  bool isOnline(String userId, ChatViewModel vm) {
    return vm.onlineUsers.contains(userId);
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final vm = context.read<ChatViewModel>();

      vm.fetchUsers();
      vm.fetchUnreadCounts();

      vm.listenOnlineUsers();
      vm.listenNewMessages();
    });
  }

  int getUnreadCount(String userId, ChatViewModel vm) {
    final match = vm.unreadCounts.where((e) => e.userId == userId).toList();

    return match.isNotEmpty ? match.first.count : 0;
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();
    return Scaffold(
      backgroundColor: AppColors.kBg,
      body: Builder(
        builder: (_) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.users.isEmpty) {
            return const Center(child: Text("No Users Found"));
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            itemCount: vm.users.length,
            separatorBuilder: (_, _) => Divider(color: AppColors.kBg),
            itemBuilder: (context, index) {
              final user = vm.users[index];
              final unread = vm.getUnreadCount(user.id!);
              return ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.kGreen,
                      backgroundImage:
                          (user.profileImage != null &&
                              user.profileImage!.isNotEmpty)
                          ? NetworkImage(user.profileImage!)
                          : null,
                      child:
                          (user.profileImage == null ||
                              user.profileImage!.isEmpty)
                          ? Text(
                              name(user).getInitials,
                              style: AppTextStyles.s18W600.copyWith(
                                color: AppColors.kBg,
                              ),
                            )
                          : null,
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          color: vm.onlineUsers.contains(user.id)
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: unread > 0
                    ? CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Text(
                          unread.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      )
                    : null,
                title: Text(
                  name(user),
                  style: AppTextStyles.s16W400.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  user.userType?.toCapitalise ?? "-",
                  style: AppTextStyles.s12W400.copyWith(color: Colors.white),
                ),
                onTap: () async {
                  final vm = context.read<ChatViewModel>();

                  await vm.startConversation(user.id!);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChangeNotifierProvider.value(
                        value: vm, // pass existing ViewModel
                        child: ChatDetailView(user: user),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String name(ChatUserModel user) {
    if (user.name != null && user.name!.trim().isNotEmpty) {
      return user.name!;
    }

    if (user.email != null && user.email!.trim().isNotEmpty) {
      return user.email!;
    }

    return "Anonymous User";
  }

  @override
  void dispose() {
    super.dispose();
  }
}
