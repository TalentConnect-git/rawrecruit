class ChatUnreadModel {
  final String userId;
  final int count;

  ChatUnreadModel({
    required this.userId,
    required this.count,
  });

  factory ChatUnreadModel.fromJson(Map<String, dynamic> json) {
    return ChatUnreadModel(
      userId: json['_id'],
      count: json['count'],
    );
  }
}