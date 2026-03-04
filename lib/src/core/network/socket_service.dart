import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {

  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  SocketService._internal();

  late IO.Socket socket;

  bool _connected = false;

  void connect(String userId) {

    if (_connected) {
      log("⚠️ Socket already connected");
      return;
    }

    log("🔌 Attempting socket connection for user: $userId");

    socket = IO.io(
      "https://stage-api.rawrecruit.in",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setQuery({"userId": userId})
          .enableAutoConnect()
          .build(),
    );

    socket.connect();

    /// ✅ Connected
    socket.onConnect((_) {
      _connected = true;

      log("✅ Socket Connected");
      log("Socket ID: ${socket.id}");
    });

    /// ❌ Connection Error
    socket.onConnectError((data) {
      log("❌ Socket Connection Error: $data");
    });

    /// ❌ General Error
    socket.onError((data) {
      log("❌ Socket Error: $data");
    });

    /// 🔌 Disconnected
    socket.onDisconnect((_) {
      _connected = false;
      log("⚠️ Socket Disconnected");
    });

    /// 👥 Online Users Event
    socket.on("getOnlineUsers", (data) {
      log("🟢 Online Users: $data");
    });

    /// 💬 New Message Event
    socket.on("newMessage", (data) {
      log("📩 New Message Received: $data");
    });

    /// 🔔 Notification Event
    socket.on("newNotification", (data) {
      log("🔔 New Notification: $data");
    });
  }

  IO.Socket getSocket() {
    return socket;
  }
}