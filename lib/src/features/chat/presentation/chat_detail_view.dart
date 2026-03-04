import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  late ChatViewModel vm;   // ✅ store reference
@override
void initState() {
  super.initState();

  vm = context.read<ChatViewModel>();

  vm.activeChatUserId = widget.user.id!;
  vm.fetchMessages(widget.user.id!);
}

  @override
  void dispose() {

    vm.activeChatUserId = null;   // ✅ safe usage

    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final vm = context.watch<ChatViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name ?? widget.user.email ?? "-"),
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.builder(
              itemCount: vm.messages.length,
              itemBuilder: (_, index) {

                final msg = vm.messages[index];

                final isMe = msg.senderId ==
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
                          ? Colors.blue
                          : Colors.grey.shade300,
                      borderRadius:
                          BorderRadius.circular(10),
                    ),
                    child: Text(
                      msg.message ?? "",
                      style: TextStyle(
                        color: isMe
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            children: [

              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Type message",
                  ),
                ),
              ),

              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {

                  final text = controller.text;

                  if (text.isEmpty) return;

                  vm.sendMessage(
                    widget.user.id!,
                    text,
                  );

                  controller.clear();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}