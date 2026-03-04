import 'package:rawrecruit/src/features/chat/data/entities/chat_user_model.dart';

import '../../../../core/index.dart';
import '../entities/chat_conversation_model.dart';
import '../entities/chat_unread_model.dart';
import '../entities/message_model.dart';

abstract class ChatDataSource {

  ResultFuture<List<ChatUserModel>> getAllUsers();
  ResultFuture<List<MessageModel>> getMessages(String userId);

ResultFuture<MessageModel> sendMessage(
  String userId,
  String message,
);

ResultFuture<List<ChatUnreadModel>> getUnreadCounts();
ResultFuture<ChatConversationModel> createConversation(String receiverId);
}