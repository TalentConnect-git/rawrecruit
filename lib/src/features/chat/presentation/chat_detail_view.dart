import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart';

import '../../../core/index.dart';
import '../data/entities/chat_user_model.dart';
import '../index.dart';

class ChatDetailView extends StatefulWidget {
  final ChatUserModel user;

  const ChatDetailView({super.key, required this.user});

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  final controller = TextEditingController();

  late ChatViewModel vm; // ✅ store reference
  @override
  void initState() {
    super.initState();

    vm = context.read<ChatViewModel>();

    vm.activeChatUserId = widget.user.id!;
    vm.fetchMessages(widget.user.id!);
  }

  @override
  void dispose() {
    vm.activeChatUserId = null; // ✅ safe usage

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ChatViewModel>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.black)),
            ),

            child: Row(
              spacing: 4,
              children: [
                GestureDetector(
                  onTap: context.pop,
                  child: Icon(Icons.keyboard_arrow_left),
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage:
                          (widget.user.profileImage != null &&
                              widget.user.profileImage!.isNotEmpty)
                          ? NetworkImage(widget.user.profileImage!)
                          : null,
                      child:
                          (widget.user.profileImage == null ||
                              widget.user.profileImage!.isEmpty)
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
                          color: vm.onlineUsers.contains(widget.user.id)
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 4),

                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.user.name == null && widget.user.email == null)
                        Flexible(
                          child: Text(
                            'Anonymous User',
                            style: AppTextStyles.s16W600.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      if (widget.user.name != null)
                        Flexible(
                          child: Text(
                            widget.user.name ?? "-",
                            style: AppTextStyles.s16W600.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      if (widget.user.email != null)
                        Flexible(
                          child: Text(
                            widget.user.email ?? "-",
                            style: AppTextStyles.s16W400.copyWith(
                              overflow: TextOverflow.ellipsis,
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
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: vm.messages.length,
              itemBuilder: (_, index) {
                final msg = vm.messages[index];

                final isMe = msg.senderId == getIt<AppStateProvider>().userId;

                return Align(
                  alignment: isMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      msg.message ?? "",
                      style: TextStyle(
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
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
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final text = controller.text;

                        if (text.isEmpty) return;

                        vm.sendMessage(widget.user.id!, text);

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
    );
  }
}
