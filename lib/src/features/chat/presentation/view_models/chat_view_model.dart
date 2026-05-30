import 'package:get_it/get_it.dart';

import '../../../../core/index.dart';
import '../../../../core/network/socket_service.dart';
import '../../data/entities/chat_unread_model.dart';
import '../../data/entities/message_model.dart';
import '../../data/index.dart';

class ChatViewModel extends ViewStateProvider {
  final _repository = GetIt.instance<ChatRepository>();

  List<User> users = [];
  List<MessageModel> _messages = [];
  List<MessageModel> get messages => _messages;
  set messages(List<MessageModel> msgs) {
    if (_messages.isEmpty) {
      _messages = msgs;
    } else {
      _messages = [..._messages, ...msgs];
    }
    notifyListeners();
  }

  List<ChatUnreadModel> unreadCounts = [];
  Set<String> onlineUsers = {};
  String? activeChatUserId;
  bool _disposed = false;
  int get totalUnreadCount {
    return unreadCounts.fold(0, (sum, item) => sum + item.count);
  }

  late final socket = SocketService().getSocket();

  /// ---------- USERS ----------
  Future<void> fetchUsers() async {
    setViewState(ViewState.busy);

    final result = await _repository.getAllUsers();

    result.fold((failure) {}, (data) => users = data);

    setViewState(ViewState.complete);
    safeNotify();
  }

  /// ---------- ONLINE USERS ----------
  /// ---------- ONLINE USERS ----------
  void listenOnlineUsers() {
    socket.off("getOnlineUsers"); // ✅ remove previous

    socket.on("getOnlineUsers", (data) {
      if (_disposed) return;

      onlineUsers
        ..clear()
        ..addAll(List<String>.from(data));

      safeNotify();
    });
  }

  /// ---------- UNREAD COUNT ----------
  Future<void> fetchUnreadCounts() async {
    final result = await _repository.getUnreadCounts();

    result.fold((failure) {}, (data) => unreadCounts = data);

    safeNotify();
  }

  int getUnreadCount(String userId) {
    final match = unreadCounts.where((e) => e.userId == userId);

    return match.isNotEmpty ? match.first.count : 0;
  }

  /// ---------- FETCH CHAT ----------
  Future<void> fetchMessages(String userId) async {
    activeChatUserId = userId;

    setViewState(ViewState.busy);

    final result = await _repository.getMessages(userId);

    result.fold((failure) {}, (data) => messages = data);

    /// remove unread badge locally
    unreadCounts.removeWhere((e) => e.userId == userId);

    setViewState(ViewState.complete);
    notifyListeners();
  }

  /// ---------- SEND MESSAGE ----------
  Future<void> sendMessage(String userId, String message) async {
    final result = await _repository.sendMessage(userId, message);

    result.fold((failure) {}, (data) {
      messages = [data];
    });

    safeNotify();
  }

  void safeNotify() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  /// ---------- SOCKET: NEW MESSAGE ----------
  void listenNewMessages() {
    socket.off("newMessage"); // ✅ remove old listener

    socket.on("newMessage", (data) {
      if (_disposed) return;

      final message = MessageModel.fromJson(data);

      if (activeChatUserId != null && message.senderId == activeChatUserId) {
        messages.add(message);
      } else {
        final index = unreadCounts.indexWhere(
          (e) => e.userId == message.senderId,
        );

        if (index == -1) {
          unreadCounts.add(
            ChatUnreadModel(userId: message.senderId!, count: 1),
          );
        } else {
          unreadCounts[index] = ChatUnreadModel(
            userId: unreadCounts[index].userId,
            count: unreadCounts[index].count + 1,
          );
        }
      }

      safeNotify();
    });
  }

  /// ---------- START CONVERSATION ----------
  Future<void> startConversation(String receiverId) async {
    final result = await _repository.createConversation(receiverId);

    result.fold((failure) {}, (data) {});
  }

  @override
  void dispose() {
    _disposed = true;

    socket.off("getOnlineUsers");
    socket.off("newMessage");

    super.dispose();
  }
}
