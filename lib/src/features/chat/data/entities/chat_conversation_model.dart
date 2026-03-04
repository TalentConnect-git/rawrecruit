class ChatConversationModel {
  final String id;
  final List<dynamic> members;
  final List<dynamic> messages;

  ChatConversationModel({
    required this.id,
    required this.members,
    required this.messages,
  });

  factory ChatConversationModel.fromJson(Map<String, dynamic> json) {
    return ChatConversationModel(
      id: json['_id'] ?? "",
      members: json['members'] ?? [],
      messages: json['messages'] ?? [],
    );
  }
}