import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rawrecruit/src/features/chat/data/data_source/chat_data_source.dart';

import '../../../../core/index.dart';
import '../entities/chat_conversation_model.dart';
import '../entities/chat_unread_model.dart';
import '../entities/message_model.dart';

class ChatDataSourceImpl implements ChatDataSource {
  final NetworkService _networkService = NetworkService();

  @override
  ResultFuture<List<User>> getAllUsers() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.chatUserList,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as List<dynamic>;

      final users = response.map((e) => User.fromJson(e)).toList();

      return Right(users);
    } catch (e, s) {
      log('$e\n$s');

      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<MessageModel>> getMessages(String userId) async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: '/api/messages/get/$userId',
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as List<dynamic>;

      final messages = response.map((e) => MessageModel.fromJson(e)).toList();

      return Right(messages);
    } catch (e, s) {
      log('$e\n$s');

      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<MessageModel> sendMessage(String userId, String message) async {
    final request = Request(
      method: RequestMethod.post,
      endpoint: '/api/messages/send/$userId',
      body: {"message": message},
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as Map<String, dynamic>;

      final messageModel = MessageModel.fromJson(response);

      return Right(messageModel);
    } catch (e, s) {
      log('$e\n$s');

      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<List<ChatUnreadModel>> getUnreadCounts() async {
    final request = Request(
      method: RequestMethod.get,
      endpoint: Endpoints.getUnreadCounts,
      isSafeRoute: true,
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as List<dynamic>;

      final counts = response.map((e) => ChatUnreadModel.fromJson(e)).toList();

      return Right(counts);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }

  @override
  ResultFuture<ChatConversationModel> createConversation(
    String receiverId,
  ) async {
    final Request request = Request(
      method: RequestMethod.post,
      endpoint: Endpoints.createConversation,
      isSafeRoute: true,
      body: {"receiverId": receiverId},
    );

    try {
      final result = await _networkService.request(request);

      final response = result.data as Map<String, dynamic>;

      final conversation = ChatConversationModel.fromJson(response);

      return Right(conversation);
    } catch (e) {
      return Left(APIException.from(e));
    }
  }
}
