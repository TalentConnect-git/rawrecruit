import 'package:rawrecruit/src/features/chat/data/data_source/chat_data_source.dart';
import 'package:rawrecruit/src/features/chat/data/repository/chat_repository.dart';

import '../../../../core/index.dart';
import '../entities/chat_conversation_model.dart';
import '../entities/chat_unread_model.dart';
import '../entities/chat_user_model.dart';
import '../entities/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {

  final ChatDataSource _dataSource;

  ChatRepositoryImpl(this._dataSource);

  @override
  ResultFuture<List<ChatUserModel>> getAllUsers() {

    return _dataSource.getAllUsers();
  }
  @override
ResultFuture<List<MessageModel>> getMessages(String userId) {
  return _dataSource.getMessages(userId);
}

@override
ResultFuture<MessageModel> sendMessage(
  String userId,
  String message,
) {
  return _dataSource.sendMessage(userId, message);
}

@override
ResultFuture<List<ChatUnreadModel>> getUnreadCounts() {
  return _dataSource.getUnreadCounts();
}
@override
ResultFuture<ChatConversationModel> createConversation(String receiverId) {
  return _dataSource.createConversation(receiverId);
}
}