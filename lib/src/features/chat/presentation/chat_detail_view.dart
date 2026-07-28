import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';
import 'package:rawrecruit/src/features/chat/data/entities/message_model.dart';

import '../../../core/index.dart';
import '../index.dart';

class ChatDetailView extends StatefulWidget {
  final String userId;

  const ChatDetailView({super.key, required this.userId});

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  final controller = TextEditingController();

  ChatViewModel vm = ChatViewModel(); // ✅ store reference
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      vm.activeChatUserId = widget.userId;
      vm.fetchMessages(widget.userId);
      final failure = await vm.getAlumniById(widget.userId);
      failure?.showError(context);
    });
  }

  @override
  void dispose() {
    vm.activeChatUserId = null; // ✅ safe usage

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, res) {
            if (didPop) return;

            context.pop(true);
          },
          child: Scaffold(
            backgroundColor: AppColors.kBg,

            body: Selector<ChatViewModel, bool>(
              selector: (_, vm) => vm.isLoading,
              builder: (_, isLoading, _) => isLoading
                  ? AppLoadingIndicator()
                  : Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.kBg,
                            border: Border(
                              bottom: BorderSide(color: AppColors.kBorder),
                            ),
                          ),

                          child: Selector<ChatViewModel, User?>(
                            selector: (_, vm) => vm.user,
                            builder: (_, user, _) => Row(
                              spacing: 4,
                              children: [
                                GestureDetector(
                                  onTap: () => context.pop(true),
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    color: AppColors.white,
                                  ),
                                ),

                                Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.kGreen,
                                      backgroundImage:
                                          (user?.profileImage != null &&
                                              user!.profileImage!.isNotEmpty)
                                          ? NetworkImage(user.profileImage!)
                                          : null,
                                      child:
                                          (user?.profileImage == null ||
                                              user!.profileImage!.isEmpty)
                                          ? Text(
                                              name(user).getInitials,
                                              style: AppTextStyles.s18W600
                                                  .copyWith(
                                                    color:
                                                        AppColors.onGreenButton,
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
                                          color:
                                              vm.onlineUsers.contains(user?.id)
                                              ? AppColors.kGreen
                                              : AppColors.secBackground,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: AppColors.kBorder,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(width: 4),

                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          name(user),
                                          style: AppTextStyles.s16W400.copyWith(
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.white,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Selector<ChatViewModel, List<MessageModel>>(
                            selector: (_, vm) => vm.messages,
                            builder: (_, messages, _) => ListView.builder(
                              padding: EdgeInsets.all(20),
                              itemCount: messages.length,
                              itemBuilder: (_, index) {
                                final msg = messages[index];

                                final isMe =
                                    msg.senderId ==
                                    getIt<AppStateProvider>().userId;

                                return Align(
                                  alignment: isMe
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: isMe
                                          ? AppColors.kGreen.withValues(
                                              alpha: 0.5,
                                            )
                                          : AppColors.kTile,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      msg.message ?? "",
                                      style: TextStyle(
                                        color: isMe
                                            ? AppColors.onGreenButton
                                            : AppColors.text,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: AppTextFields(
                                  controller: controller,
                                  hint: 'Type message',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.send,
                                      color: AppColors.kGreen,
                                    ),
                                    onPressed: () {
                                      final text = controller.text;

                                      if (text.isEmpty) return;

                                      vm.sendMessage(widget.userId, text);

                                      controller.clear();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  String name(User? user) {
    if (user?.name != null && user!.name!.trim().isNotEmpty) {
      return user.name!;
    }

    if (user?.email != null && user!.email!.trim().isNotEmpty) {
      return user.email!;
    }

    return "Anonymous User";
  }
}
