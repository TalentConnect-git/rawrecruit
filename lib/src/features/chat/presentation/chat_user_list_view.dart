import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/core/index.dart';

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
      backgroundColor: Colors.white,
      body: Builder(
        builder: (_) {
          if (vm.viewState == ViewState.busy) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.users.isEmpty) {
            return const Center(child: Text("No Users Found"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: vm.users.length,
            separatorBuilder: (_, _) => Divider(),
            itemBuilder: (context, index) {
              final user = vm.users[index];
              final unread = vm.getUnreadCount(user.id!);
              debugPrint("USER ID: ${user.id}");
              debugPrint("ONLINE USERS: ${vm.onlineUsers}");
              return ListTile(
                leading: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          (user.profileImage != null &&
                              user.profileImage!.isNotEmpty)
                          ? NetworkImage(user.profileImage!)
                          : null,
                      child:
                          (user.profileImage == null ||
                              user.profileImage!.isEmpty)
                          ? const Icon(Icons.person)
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
                  (user.name != null && user.name!.trim().isNotEmpty)
                      ? user.name!
                      : (user.email ?? "-"),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(user.userType ?? "-"),
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

  @override
  void dispose() {
    super.dispose();
  }
}
