class ChatUserModel {

  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? userType;

  ChatUserModel({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.userType,
  });

  factory ChatUserModel.fromJson(Map<String, dynamic> json) {
    return ChatUserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      userType: json['userType'],
    );
  }
}