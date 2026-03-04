class MessageModel {

  final String? id;
  final String? senderId;
  final String? receiverId;
  final String? message;
  final bool? read;
  final String? createdAt;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.message,
    this.read,
    this.createdAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      message: json['message'],
      read: json['read'],
      createdAt: json['createdAt'],
    );
  }
}